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
    public partial class CustomerDetails : System.Web.UI.Page
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
        static int CustomerId = 0;
        string user_code, user_name, mobile, password, date;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                  Response.Redirect("../Login.aspx");
                }
                grid.Visible = false;
               
               
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
            grid.Visible = true;
            string Query = "select a.UserId,a.UserName,a.UserCode,a.Password ,convert(Date, a.Timestamp, 103) as Timestamp,a.Age,a.Gender,a.ContactNumber,a.Relationship,a.NomineeName,a.NomineeAge, a.Address ,b.UserName as AdvisorName,b.UserCode  as AdvisorCode,a.BankName ,a.BranchName,a.AccountNumber ,a.IfscCode ,a.PanNumber  from Registration as a  left join Registration as b on b.UserId = a.ReferelId   where 1 = 1 ";

            if (txtfromdate.Text != "" && txttodate.Text != "") 
            {

                datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                dateto = DateTime.Parse(txttodate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);

                Query = Query + " and CAST(a.Timestamp as Date) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";

            }
            //if (DdEmployee.SelectedItem.Text != "All")
            //{
            //    if (DdEmployee.SelectedItem.Text == "Admin")
            //        Query = Query + " and a.EmployeeId=0";
            //    else
            //        Query = Query + " and a.EmployeeId='" + DdEmployee.SelectedItem.Value + "'";
            //}
            if (txtucode.Text != "SSA")
            {
                Query = Query + " and a.UserCode='" + txtucode.Text + "'";
            }
            using (SqlCommand cmd1 = new SqlCommand(Query + " order by a.UserId desc  option (maxrecursion 0)", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                cmd1.CommandTimeout = 48000;
                ds = new DataSet();
                da.Fill(ds);
                GridView2.DataSource = ds;
            }
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            //decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("ProductPrice"));
            //GridView2.Columns[4].FooterText = "Grand Total";
            //GridView2.Columns[10].FooterText = "Rs." + (from b in dt.AsEnumerable()
            //                                            select b.Field<Int32>("ProductPrice")).Sum().ToString();
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

        protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Login")
            {
                LinkButton img = (LinkButton)e.CommandSource as LinkButton;
                GridViewRow row = img.NamingContainer as GridViewRow;

                Label cid = (Label)row.FindControl("lbl_id");
                CustomerId = Convert.ToInt32(cid.Text);
                Session["IdUser"] = CustomerId;

                Label usercode = (Label)row.FindControl("lbl_advisor_code");
                user_code = usercode.Text;
                Session["CodeUser"] = user_code;

                Label username = (Label)row.FindControl("lbl_name");
                user_name = username.Text;
                Session["username"] = user_name;

                Label mbl = (Label)row.FindControl("lbl_contact");
                mobile = mbl.Text;
                Session["ContactNumber"] = mobile;

                Label pwd = (Label)row.FindControl("lbl_pwd");
                password = pwd.Text;
                Session["password"] = password;

                Label timestamp = (Label)row.FindControl("lbl_doj");
                date = timestamp.Text;
                Session["TimestampDt"] = date;

                Response.Redirect("../User/UserHome.aspx", false);
            }
        }

        protected void BtnExport_Click(object sender, EventArgs e)
        {
            string Query = "select a.UserName,a.UserCode ,a.Timestamp as Doj,a.Age,a.Gender,a.ContactNumber,a.Relationship,a.NomineeName, a.NomineeAge, a.Address ,b.UserName as AdvisorName,b.UserCode as AdvisorCode,a.BankName ,a.BranchName, a.AccountNumber ,a.IfscCode ,a.PanNumber from Registration as a  left join Registration as b on b.UserId = a.ReferelId  where 1 = 1";

            if (txtfromdate.Text != "" && txttodate.Text != "")
            {

                datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                dateto = DateTime.Parse(txttodate.Text.Trim(), culInfo, System.Globalization.DateTimeStyles.NoCurrentDateDefault);

                Query = Query + " and CAST(a.Timestamp as Date) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";


            }
            //if (DdEmployee.SelectedItem.Text != "All")
            //{
            //    if (DdEmployee.SelectedItem.Text == "Admin")
            //        Query = Query + " and a.EmployeeId=0";
            //    else
            //        Query = Query + " and a.EmployeeId='" + DdEmployee.SelectedItem.Value + "'";
            //}
            if (txtucode.Text != "SSA")
            {
                Query = Query + " and a.UserCode='" + txtucode.Text + "'";

            }
            using (SqlCommand cmd1 = new SqlCommand(Query + " order by a.UserId desc  option (maxrecursion 0)", con))
            {
                SqlDataAdapter da = new SqlDataAdapter(cmd1);
                cmd1.CommandTimeout = 500;
                ds = new DataSet();
                da.Fill(ds);
            }
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            using (XLWorkbook wb = new XLWorkbook())
            {
                wb.Worksheets.Add(dt, "Customer List");
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "";
                Response.ContentType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                Response.AddHeader("content-disposition", "attachment;filename=Customer List " + DateTime.Now + ".xlsx");
                using (MemoryStream MyMemoryStream = new MemoryStream())
                {
                    wb.SaveAs(MyMemoryStream);
                    MyMemoryStream.WriteTo(Response.OutputStream);
                    Response.Flush();
                    Response.End();
                }
            }
        }
    }
}