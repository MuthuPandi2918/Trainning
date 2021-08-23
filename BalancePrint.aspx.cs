using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Admin
{
    public partial class BalancePrint : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString);
        Bal_Registration obj = new Bal_Registration();
        Bal_commissionWallet obj1 = new Bal_commissionWallet();
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        DataSet ds;
        System.Globalization.CultureInfo Cul1 = new System.Globalization.CultureInfo("hi-IN", true);
        DateTime datefrom, dateto;
        System.Globalization.CultureInfo culInfo = new System.Globalization.CultureInfo("hi-IN");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string FromDate = "", ToDate = "", Code = "";
                if (Session["From"] != null)
                {
                    FromDate = Session["From"].ToString();
                    ToDate = Session["ToDate"].ToString();
                }
                if (Session["Code"] != null)
                    Code = Session["Code"].ToString();
                //string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 4)RoiSelf,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 5)RoiGroup,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 7)Level,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 10)TRoiSelf,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 12)TRoiGroup,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 11)TLevel from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId left join registration as c on c.UserId = a.Advisior where 1 = 1";
                string Query = "with Cte1(UserId, Balance, CountTotal,Timestamp) as (select a.UserId,(isnull(sum(CreditRs) - sum(DebitRs), 0)) as Balance,(select count(1) from PrimaryWallet as h where h.UserId = a.UserId and Status = 1)CountTotal,a.Timestamp from PrimaryWallet as a inner join Registration as b on a.UserId = b.UserId left join Registration as c on c.UserId = a.Advisior group by a.UserId,a.Timestamp) Select UserName, UserCode, Balance, CountTotal,c.UserId from Registration as r Inner Join Cte1 as c On r.UserId = c.UserId where 1 = 1 and c.Balance!=0 ";

                if (FromDate != "" && ToDate != "")
                {

                    datefrom = DateTime.Parse(FromDate.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    dateto = DateTime.Parse(ToDate.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    Query = Query + " and CAST(c.Timestamp as Date ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
                }
                if (Code != "")
                {
                    Query = Query + " and r.UserCode='" + Code + "'";
                }
                using (SqlCommand cmd1 = new SqlCommand(Query , con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    cmd1.CommandTimeout = 500;
                    ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                }
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                GridView1.Columns[4].FooterText = "Rs. " + (from b in dt.AsEnumerable()
                                                            select b.Field<Double>("Balance")).Sum().ToString();
                GridView1.DataBind();
            }
        }
    }
}