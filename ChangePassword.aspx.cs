using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Admin
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        Bal_login obj = new Bal_login();
      
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        int result = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            else
            {
                if (!IsPostBack)
                {
                    txtoldpwd.Focus();
                }
            }
        }
        protected void btnchange_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Type = 4;
                string pass1 = txtoldpwd.Text;
                Session["password"] = pass1.ToString();
                obj.UserName = Session["NameUser"].ToString();
                obj.Password = txtoldpwd.Text;
                dr = obj.DateRead();
                dr.Read();
                if (dr.HasRows)
                {
                    dr.Close();
                    if (txtoldpwd.Text == txtconfirm.Text)
                    {
                        msg.ShowAlertMessage("Try Another Password");
                        Clear();
                    }
                    else if (txtnewpassword.Text == txtconfirm.Text)
                    {
                        obj.Type = 5;
                        obj.UserName = Session["NameUser"].ToString();
                        obj.Password = txtoldpwd.Text;
                        obj.HomeBranch = txtconfirm.Text;
                        result = obj.Execute();
                        if (result >= 1)
                        {
                            msg.ShowAlertMessage("Password is Changed");
                            Clear();
                        }
                    }
                    else
                    {
                        msg.ShowAlertMessage("New and Confirm Password Password is Not Mached!");
                        Clear();
                    }
                }
                else
                {
                    msg.ShowAlertMessage("Old Password is Incorrect!");
                    Clear();
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                Response.Write(ex.ToString());
            }
        }

        public void Clear()
        {
            txtoldpwd.Text = "";
            txtnewpassword.Text = "";
            txtconfirm.Text = "";
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            Clear();
        }
    }
}