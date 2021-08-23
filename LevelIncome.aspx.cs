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
    public partial class LevelIncome : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString);
        Bal_Registration obj = new Bal_Registration();
        Messageclass msg = new Messageclass();
        DataSet ds;
        SqlDataReader dr;
        System.Globalization.CultureInfo Cul1 = new System.Globalization.CultureInfo("hi-IN", true);
        DateTime datefrom, dateto;
        System.Globalization.CultureInfo culInfo = new System.Globalization.CultureInfo("hi-IN");
        static string PId;
        static int UId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            grid.Visible = false;
        }
        protected void UserCodeOnTextChanged(object sender, EventArgs e)
        {
            obj.Type = 2;
            obj.UserCode = txtucode.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                UId = int.Parse(dr[0].ToString());
                txtuname.Text = dr[1].ToString();
                dr.Close();
            }
            else
            {
                msg.ShowAlertMessage("Invalid UserCode");
                txtucode.Text = "SSA";
                dr.Close();
            }

        }

        protected void btnview_Click(object sender, EventArgs e)
        {
            grid.Visible = true;
            string Query = "select a.UserId,a.Advisior,a.CreditRs,b.UserCode ,b.UserName,c.UserCode as ReferralCode,c.UserName as ReferralName,a.Dueno as Level,convert(varchar,a.TimeStamp,103) as Date from PrimaryWallet as a inner join Registration as b on b.UserId = a.Advisior inner join Registration as c on c.UserId =a.UserId  where Status in(1)";

            if (txtfromdate.Text != "" && txttodate.Text != "")
            {
                datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                dateto = DateTime.Parse(txttodate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);

                Query = Query + " and CAST(a.TimeStamp as Date ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
            }

            if (txtucode.Text != "SSA")
            {
                Query = Query + "and a.UserId='" + UId + "'";
            }
            //txtfromdate.Text = "";
            //txttodate.Text = "";
            //txtucode.Text = "";
            //txtuname.Text = "";

            using (SqlCommand cmd1 = new SqlCommand(Query + " order by a.TimeStamp desc  option (maxrecursion 0)", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                cmd1.CommandTimeout = 500;
                ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
            }
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            GridView2.Columns[4].FooterText = "Total";
            GridView2.Columns[5].FooterText = "Rs. " + (from b in dt.AsEnumerable()
                                                        select b.Field<Double>("CreditRs")).Sum().ToString();
            GridView2.DataBind();
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            btnview_Click(this, null);
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            grid.Visible = false;
            txtfromdate.Text = "";
            txttodate.Text = "";
            txtucode.Text = "SSA";
            txtuname.Text = "";
        }
    }
}