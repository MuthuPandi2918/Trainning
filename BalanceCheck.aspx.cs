using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Admin
{
    public partial class BalanceCheck : System.Web.UI.Page
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
                if (Session["username"] == null)
                    Response.Redirect("../Login.aspx");
            }
            Trans.Visible = false;
        }
        protected void Customer_OnTextChanged(object sender, EventArgs e)
        {
            obj.Type = 2;
            obj.UserCode = txtcode.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lblCustomerId.Text = dr[0].ToString();
                txtname.Text = dr[1].ToString();
            }
            else
            {
                msg.ShowAlertMessage("Invalid UserCode");
                txtcode.Text = "SSA";
            }

        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {


            if (txtfdate.Text != "" && txttdate.Text != "")
            {
                //string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 4)RoiSelf,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 5)RoiGroup,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 7)Level,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 10)TRoiSelf,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 12)TRoiGroup,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 11)TLevel from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId left join registration as c on c.UserId = a.Advisior where 1 = 1";
                //string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 1)RoiSelf,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 2)Level,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 3)TopupRoi,(select count(1) from PrimaryWallet as h where h.Advisior = a.Advisior and Status = 4)TopupLevel from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId left join registration as c on c.UserId = a.Advisior where 1 = 1";
                //string Query = "select c.UserName,c.UserCode,c.UserId,(isnull(sum(CreditRs) - sum(DebitRs), 0)) as Balance,(select count(1) from PrimaryWallet  as h where h.Advisior = a.Advisior and Status = 1)Level from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId left join Registration as c on c.UserId = a.Advisior where 1 = 1";
                //string Query = "with Cte1(UserId, Balance, CountTotal,Timestamp) as (select a.UserId,(isnull(sum(CreditRs) - sum(DebitRs), 0)) as Balance,(select count(1) from PrimaryWallet as h where h.UserId = a.UserId and Status = 1)CountTotal,a.Timestamp from PrimaryWallet as a inner join Registration as b on a.UserId = b.UserId left join Registration as c on c.UserId = a.Advisior group by a.UserId,a.Timestamp) Select UserName, UserCode, Balance, CountTotal,c.UserId from Registration as r Inner Join Cte1 as c On r.UserId = c.UserId where 1 = 1 and c.Balance!=0 ";
                //string Query = "select b.USerName,b.USerCode,b.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance,count(a.UserId) as CountTotal from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId  where 1 = 1";
                string Query = " select c.UserId, c.Usercode,c.UserName,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance,count(a.UserId) as CountTotal  from PrimaryWallet as a inner join Registration as b on a.Advisior = b.UserId inner join Registration as c on a.UserId = c.UserId  where 1 = 1";
                if (txtfdate.Text != "" && txttdate.Text != "")
                {
                    datefrom = DateTime.Parse(txtfdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    dateto = DateTime.Parse(txttdate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    Query = Query + " and CAST(a.Timestamp as Date ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
                    Session["From"] = txtfdate.Text;
                    Session["ToDate"] = txttdate.Text;
                }
                if (txtcode.Text != "SSA")
                {
                    Session["Code"] = txtcode.Text;
                    Query = Query + " and c.UserCode='" + txtcode.Text + "'";
                }
                using (SqlCommand cmd1 = new SqlCommand(Query + " group by c.UserCode,c.UserName ,c.UserId ", con))
                {
                    SqlDataAdapter da = new SqlDataAdapter(cmd1);
                    cmd1.CommandTimeout = 500;
                    ds = new DataSet();
                    da.Fill(ds);
                    GridView1.DataSource = ds;
                }
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                GridView1.Columns[4].FooterText = "Rs." + (from b in dt.AsEnumerable()
                                                           select b.Field<Double>("Balance")).Sum().ToString();
                GridView1.DataBind();
                BtnExportExcel.Visible = true;
                BtnExportWord.Visible = true;
                //txtcode.Text = "";
                //txtname.Text = "";
                Trans.Visible = true;
            }
            else
            {
                msg.ShowAlertMessage("Please Choose Date");
                Trans.Visible = false;
            }

        }

        protected void BtnExportExcel_Click(object sender, EventArgs e)
        {

            ExportExcel();
        }
        private void ExportExcel()
        {


            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "CustomerPrimaryWalletBalanceExcel" + DateTime.Now + ".xls";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            GridView1.AllowPaging = false;
            btnsearch_Click(this, null);
            GridView1.RenderControl(htmltextwrtter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/vnd.ms-excel";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            Response.Write(strwritter.ToString());
            Response.End();
        }
        public override void VerifyRenderingInServerForm(Control control)
        {

        }
        protected void BtnExportWord_Click(object sender, EventArgs e)
        {
            ExportWord();
        }
        private void ExportWord()
        {
            Response.Clear();
            Response.Buffer = true;
            Response.ClearContent();
            Response.ClearHeaders();
            Response.Charset = "";
            string FileName = "CustomerPrimaryWalletBalanceWord" + DateTime.Now + ".doc";
            StringWriter strwritter = new StringWriter();
            HtmlTextWriter htmltextwrtter = new HtmlTextWriter(strwritter);
            GridView1.AllowPaging = false;
            btnsearch_Click(this, null);
            GridView1.RenderControl(htmltextwrtter);
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.ContentType = "application/msword";
            Response.AddHeader("Content-Disposition", "attachment;filename=" + FileName);
            GridView1.GridLines = GridLines.Both;
            GridView1.HeaderStyle.Font.Bold = true;
            Response.Write(strwritter.ToString());
            Response.End();
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            btnsearch_Click(this, null);
        }

        protected void btnclose_Click(object sender, EventArgs e)
        {


            Trans.Visible = false;
            txtcode.Text = "SSA";
            txtname.Text = "";
            txttdate.Text = "";
            txtfdate.Text = "";
            BtnExportExcel.Visible = false;
            BtnExportWord.Visible = false;
        }
    }
}