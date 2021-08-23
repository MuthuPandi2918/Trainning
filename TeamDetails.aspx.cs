using ClosedXML.Excel;
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
    public partial class TeamDetails : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString);
        Bal_Registration obj = new Bal_Registration();
        Messageclass msg = new Messageclass();
        DataSet ds;
        DataTable dt;
        SqlDataReader dr;
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
                grid.Visible = false;
                //search.Visible = true;
            }
        }
        protected void UserCodeOnTextChanged(object sender, EventArgs e)
        {
            obj.Type = 2;
            obj.UserCode = txtucode.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lblUId.Text = (dr[0].ToString());
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
            string Query = "";
            grid.Visible = true;
            if (txtucode.Text != "SSA")
            {
                Query = "  with cte1 (advId,ReferId)as (select UserId, ReferelId from Registration   where ReferelId =" + lblUId.Text + " union all  " +
                    "select a.UserId, a.ReferelId from Registration as a inner join cte1 as b on b.advId = a.ReferelId) select b.UserName, b.UserCode," +
                    "b.ContactNumber,b.ReferelName,b.Timestamp,c.UserCode as ReferelCode From cte1 a inner join Registration as b on a.advId = b.UserId  " +
                    "left join Registration as c on c.UserId = b.ReferelId where 1 = 1";
            }
            if (txtfromdate.Text != "" && txttodate.Text != "")
            {

                datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                dateto = DateTime.Parse(txttodate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                Query = Query + " and CAST(b.Timestamp as Date) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
            }
            using (SqlCommand cmd1 = new SqlCommand(Query + " option(maxrecursion 0)", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                cmd1.CommandTimeout = 500;
                ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
            }
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            //decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("ProductPrice"));
            //GridView2.Columns[3].FooterText = "Grand Total";
            //GridView2.Columns[4].FooterText = "Rs." + (from b in dt.AsEnumerable()
            //                                           select b.Field<double>("Value")).Sum().ToString();
            GridView2.DataBind();

            //txtucode.Text = "";
            //txtuname.Text = "";
            //txtfromdate.Text = "";
            //txttodate.Text = "";
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            grid.Visible = false;
            txtfromdate.Text = "";
            txttodate.Text = "";
            txtucode.Text = "SSA";
            txtuname.Text = "";
        }

        protected void GridView2_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView2.PageIndex = e.NewPageIndex;
            btnview_Click(this, null);
        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {
            string Query = "";
            grid.Visible = true;
            if (txtucode.Text != "SSA")
                Query = " with cte1 (advId,ReferId)as (select UserId, ReferelId from Registration   where ReferelId =" + lblUId.Text + " union all" +
                    " select a.UserId, a.ReferelId from Registration as a inner join cte1 as b on b.advId = a.ReferelId) select b.UserName,b.UserCode," +
                    "b.ContactNumber,b.Timestamp,b.ReferelName,c.UserCode as ReferelCode From cte1 a inner join Registration as b on a.advId = b.UserId " +
                    " left join Registration as c on c.UserId = b.ReferelId  where 1 = 1";
            if (txtfromdate.Text != "" && txttodate.Text != "")
            {

                datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                dateto = DateTime.Parse(txttodate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                Query = Query + " and CAST(b.Timestamp as Date) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
            }
            using (SqlCommand cmd1 = new SqlCommand(Query + " option(maxrecursion 0)", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                cmd1.CommandTimeout = 500;
                ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
            }
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "TeamDetails");
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=Team Details " + DateTime.Now + ".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
        public void Clear()
        {

        }
    }
}