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
    public partial class CustomerWalletBalancePrint : System.Web.UI.Page
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
                string FromDate = "", Code = "", Type = "";
                if (Session["From"] != null)
                    FromDate = Session["From"].ToString();
                if (Session["Code"] != null)
                    Code = Session["Code"].ToString();
                if (Session["Type"] != null)
                    Type = Session["Type"].ToString();
                string GroupBy = "", Having = "", OrderBy = "";
                string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance from Wallet as a inner join Registration as   b on a.UserId = b.UserId left join registration as c on c.UserId = a.UserId where 1 = 1";
                if (FromDate != "")
                {
                    datefrom = DateTime.Parse(FromDate.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    //  dateto = DateTime.Parse(txttdate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    //Query = Query + " and convert(date,a.Timestamp,103 ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
                    Query = Query + " and convert(date,a.Timestamp,103 )<= '" + datefrom.ToShortDateString() + "'";
                }
                if (Code != "")
                {
                    Query = Query + " and b.UserCode='" + Code + "'";
                }
                if (Type != "All" && Type != "")
                {
                    if (Type == "Balance")
                        Having = Having + " Having (sum(CreditRs) - sum(DebitRs))>0";
                    else
                        Having = Having + " Having (sum(CreditRs) - sum(DebitRs))<=0";
                }
                GroupBy = " group by c.USerName,c.USerCode,c.UserID ";
                OrderBy = " order by c.UserID asc";
                using (SqlCommand cmd1 = new SqlCommand(Query + GroupBy + Having + OrderBy, con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    cmd1.CommandTimeout = 500;
                    ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                }
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                GridView1.Columns[4].FooterText = "Rs." + (from b in dt.AsEnumerable() select b.Field<Double>("Balance")).Sum().ToString();
                GridView1.DataBind();
            }
        }
    }
}