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

namespace Seenu_Sport_Academy
{
    public partial class Login : System.Web.UI.Page
    {
        Bal_login obj = new Bal_login();
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        DataSet ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["NameUser"] = null;
            txtusername.Focus();
        }
        protected void btnlogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtusername.Text == "")
                {
                    msg.ShowAlertMessage("Enter the UserName");
                }
                else if (txtpwd.Text == "")
                {
                    msg.ShowAlertMessage(" Enter the password");
                }

                if (txtusername.Text != "" && txtpwd.Text != "")


                {
                    obj.Type = 2;
                    obj.UserName = txtusername.Text;
                    obj.Password = txtpwd.Text;
                    dr = obj.DateRead();
                    dr.Read();
                    if (dr.HasRows == true)
                    {
                        dr.Close();
                        Session["username"] = txtusername.Text;
                        Session["password"] = txtpwd.Text;
                        Response.Redirect("Admin/home.aspx");
                    }
                    else
                    {
                        msg.ShowAlertMessage("UserName and Password is Incorrect");
                        dr.Close();
                    }
                }


                else
                {
                    msg.ShowAlertMessage("UserName and Password is Incorrect");
                }

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}