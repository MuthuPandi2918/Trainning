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
    public partial class MobileNumberUpdate : System.Web.UI.Page
    {
        Bal_Registration obj = new Bal_Registration();
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
        }
        protected void NameOnTextChanged(object sender, EventArgs e)
        {
            obj.Type = 2;
            obj.UserCode = txtcode.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lbluid.Text = dr[0].ToString();
                txtname.Text = dr[1].ToString();
                lblmbl.Text = dr[4].ToString();
                txtmbl.Text = lblmbl.Text;
            }
            else
            {
                msg.ShowAlertMessage("Invalid Cuctomer Code");
                txtcode.Text = "";
            }
        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {

            obj.Type = 21;
            obj.UserCode = txtcode.Text;
            obj.ContactNumber = txtmbl.Text;
            int result = obj.Execut();
            if (result > 0)
            {
                msg.ShowAlertMessage("Mobile Number Successfully Updated from " + lblmbl.Text + " to " + txtmbl.Text + "");
                txtcode.Text = "";
                txtname.Text = "";
                txtmbl.Text = "";

            }

        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtcode.Text = "";
            txtname.Text = "";
            txtmbl.Text = "";
        }
    }
}