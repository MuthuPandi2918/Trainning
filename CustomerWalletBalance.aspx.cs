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
    public partial class CustomerWalletBalance : System.Web.UI.Page
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
                {
                    Response.Redirect("../Login.aspx");
                }
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
            Trans.Visible = true;

            string GroupBy = "", Having = "", OrderBy = "";
            //string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs),0))as Balance from Wallet as a inner join Registration as   b on a.Advisior = b.UserId left join registration as c on c.UserId = a.Advisior where 1 = 1";
            string Query = "select c.USerName,c.USerCode,c.UserID,(isnull(sum(CreditRs) - sum(DebitRs), 0)) as Balance from Wallet as a inner join Registration as b on a.UserId = b.UserId left join registration as c on c.UserId = a.UserId where 1 = 1";
            if (txtfdate.Text != "")
            {

                datefrom = DateTime.Parse(txtfdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                //  dateto = DateTime.Parse(txttdate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                //Query = Query + " and convert(date,a.Timestamp,103 ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
                Query = Query + " and convert(date,a.Timestamp,103 )<= '" + datefrom.ToShortDateString() + "'";
                Session["From"] = txtfdate.Text;
            }
            if (txtcode.Text != "SSA")
            {
                Query = Query + " and b.UserCode='" + txtcode.Text + "'";
                Session["Code"] = txtcode.Text;
            }
            if (DdlType.SelectedItem.Text != "All")
            {
                if (DdlType.SelectedItem.Text == "Balance")
                    Having = Having + " Having (sum(CreditRs) - sum(DebitRs))>0";
                else
                    Having = Having + " Having (sum(CreditRs) - sum(DebitRs))<=0";
            }
            Session["Type"] = DdlType.SelectedItem.Text;
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
            GridView1.Columns[4].FooterText = "Rs." + (from b in dt.AsEnumerable()
                                                       select b.Field<Double>("Balance")).Sum().ToString();
            GridView1.DataBind();
            BtnExportExcel.Visible = true;
            BtnExportWord.Visible = true;
            //txtcode.Text = "";
            //txtname.Text = "";
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
            string FileName = "CustomerWalletBalanceexcel" + DateTime.Now + ".xls";
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
            string FileName = "CustomerWalletBalanceWord" + DateTime.Now + ".doc";
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
        protected void btnclose_Click(object sender, EventArgs e)
        {
            Trans.Visible = false;
            txtcode.Text = "SSA";
            txtname.Text = "";
            //txttdate.Text = "";
            txtfdate.Text = "";
            BtnExportExcel.Visible = false;
            BtnExportWord.Visible = false;
        }
    }
}