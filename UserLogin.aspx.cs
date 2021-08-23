using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Website
{
    public partial class UserLogin : System.Web.UI.Page
    {
        Bal_Registration obj = new Bal_Registration();
        SqlDataReader dr;
        Messageclass msg = new Messageclass();
        SqlCommand cmd;
        string user;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ForgetPwd.Visible = false;
                UserLogin1.Visible = true;
                txtcodembl.Text = "";
            }
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            if (txtcode.Text != "")
            {
                obj.Type = 11;
                obj.UserCode = txtcode.Text;
                obj.Password = txtpwd.Text;
                dr = obj.DataRead();
                dr.Read();
                if (dr.HasRows)
                {
                    Session["IdUser"] = dr[0].ToString();
                    Session["username"] = dr[1].ToString();
                    Session["CodeUser"] = dr[2].ToString();
                    Session["Contactnumber"] = dr[4].ToString();
                    Session["Timestamp"] = dr[5].ToString();
                    Session["Timestampdt"] = dr[5].ToString();
                    Response.Redirect("User/UserHome.aspx", false);
                    dr.Close();
                }
                else
                {
                    dr.Close();
                }

            }

        }

        protected void lbtnpass_Click(object sender, EventArgs e)
        {
            ForgetPwd.Visible = true;
            UserLogin1.Visible = false;
        }
        protected void btcnl_Click(object sender, EventArgs e)
        {
            ForgetPwd.Visible = false;
            UserLogin1.Visible = true;
        }
      

        protected void btnpwd_Click1(object sender, EventArgs e)
        {
            ForgetPwd.Visible = true;
            UserLogin1.Visible = false;

            obj.Type = 20;
            obj.UserCode = txtcode.Text;
            obj.ContactNumber = txtcodembl.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lblPassword.Text = dr[0].ToString();
                lblMobileNo.Text = dr[1].ToString();
                lblName.Text = dr[2].ToString();
                lblUsercode.Text = dr[3].ToString();
                new SmsCall().SendSmsBulkSms("Welcome to Seenu Sports Academy ! ,Dear " + lblName.Text + ", Your login credentials are UserCode : " + lblUsercode.Text + ", " + "Password : " + lblPassword.Text + ".for more info log on to :  http://www.seenuacademy.com", lblMobileNo.Text);
                msg.ShowAlertMessage("Password has been sent to your registered Mobile Number");
                txtcodembl.Text = "";
                ForgetPwd.Visible = false;
                UserLogin1.Visible = true;
                dr.Close();
            }
            else
            {
                msg.ShowAlertMessage("UserCode or Mobile Number Incorrect");
                txtcodembl.Text = "";
                ForgetPwd.Visible = false;
                UserLogin1.Visible = true;
                dr.Close();
            }
            dr.Close();
        }
    }
}