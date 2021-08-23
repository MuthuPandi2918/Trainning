
using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Admin
{
    public partial class CustomerLogin : System.Web.UI.Page
    {
        Bal_Registration obj = new Bal_Registration();
        DataSet ds;
        SqlDataReader dr;

        Messageclass msg = new Messageclass();
        static int CustomerId = 0;
        string user_code, user_name, mobile, password, date;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                    Response.Redirect("../Login.aspx");
                Trans.Visible = false;
            }
        }
        protected void Customer_OnTextChanged(object sender, EventArgs e)
        {
            obj.Type = 2;
            obj.UserCode = txtcode.Text.Trim();
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                CustomerId = int.Parse(dr[0].ToString());
                txtname.Text = dr[1].ToString();
                dr.Close();
            }
            else
            {
                msg.ShowAlertMessage("Invalid Cuctomer Code");
                txtcode.Text = "SSA";
                dr.Close();
            }
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            btnsearch_Click(this, null);
        }

        protected void btnsearch_Click(object sender, EventArgs e)
        {
            if (txtcode.Text != "SSA")
            {
                Trans.Visible = true;
                obj.Type = 7;
                obj.UserId = CustomerId;
                ds = obj.DataBind();
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                Trans.Visible = true;
                obj.Type = 8;
                ds = obj.DataBind();
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Login")
            {
                LinkButton img = (LinkButton)e.CommandSource as LinkButton;
                GridViewRow row = img.NamingContainer as GridViewRow;

                Label cid = (Label)row.FindControl("lbluser_id");
                CustomerId = Convert.ToInt32(cid.Text);
                Session["IdUser"] = CustomerId;

                Label usercode = (Label)row.FindControl("lbl_intorducercode");
                user_code = usercode.Text;
                Session["CodeUser"] = user_code;

                Label username = (Label)row.FindControl("lbl_customername");
                user_name = username.Text;
                Session["username"] = user_name;

                Label mbl = (Label)row.FindControl("lbl_mbl");
                mobile = mbl.Text;
                Session["ContactNumber"] = mobile;

                Label pwd = (Label)row.FindControl("lbl_pwd");
                password = pwd.Text;
                Session["password"] = password;

                Label timestamp = (Label)row.FindControl("lbl_timestamp");
                date = timestamp.Text;
                Session["TimestampDt"] = date;

                Response.Redirect("../User/UserHome.aspx", false);
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtcode.Text = "SSA";
            txtname.Text = "";
            Trans.Visible = false;
        }
    }
}