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
    public partial class StateMaster : System.Web.UI.Page
    {

      Bal_state obj = new Bal_state();
        SqlDataReader dr;
        DataSet ds;
        SqlCommand cmd;
        Messageclass msg = new Messageclass();
        string SId;
        static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }

                BindGrid();
                btnupdate.Visible = false;
            }
        }
        public void BindGrid()
        {

            obj.Type = 2;
            ds = obj.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {


                obj.Type = 1;

                obj.StateName = txtsname.Text;
                obj.StateCode = txtcode.Text;
                int result = obj.Execute();
                if (result > 0)
                {
                    msg.ShowAlertMessage("Submitted Successfully");
                    BindGrid();
                    txtsname.Text = "";
                    txtcode.Text = "";
                }
                else
                {
                    msg.ShowAlertMessage("Already Submitted This State ");
                    txtsname.Text = "";
                    txtcode.Text = "";
                }
            }
            catch (Exception Ex)
            {
                throw (Ex);
            }
        }
        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtcode.Text = "";
            txtsname.Text = "";
            btnupdate.Visible = false;
            btnsubmit.Visible = true;
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            try
            {

                btncancel.Visible = true;
                btnsubmit.Visible = false;
                btnupdate.Visible = true;
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
                {

                    Label Sno = (Label)row.FindControl("lblid");
                    id = Convert.ToInt32(Sno.Text);

                    Label sName = (Label)row.FindControl("lblname");
                    txtsname.Text = sName.Text;

                    Label scode = (Label)row.FindControl("lblcode");
                    txtcode.Text = scode.Text;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {

            obj.Type = 4;
            obj.StateId = id;
            obj.StateName = txtsname.Text;
            obj.StateCode = txtcode.Text;
            int result = obj.Execute();
            if (result > 0)
            {
                msg.ShowAlertMessage("Updated Successfully");
                BindGrid();
                txtsname.Text = "";
                txtcode.Text = "";
                btnsubmit.Visible = true;
                btnupdate.Visible = false;
            }
            else
            {

            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {

            try
            {
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
                {

                    Label Sno = (Label)row.FindControl("lblid");
                    id = Convert.ToInt32(Sno.Text);

                    obj.Type = 5;
                    obj.StateId = id;
                    int result = obj.Delete();
                    if (result > 0)
                    {
                        msg.ShowAlertMessage("Deleted Successfully");
                        BindGrid();
                        btnsubmit.Visible = true;
                        btnupdate.Visible = false;
                    }
                }
            }
            catch (Exception Ex)
            {
                msg.ShowAlertMessage("You cant delete this, This page inheritance to another page");

            }
        }

    }
}