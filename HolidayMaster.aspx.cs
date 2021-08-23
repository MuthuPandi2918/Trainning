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
    public partial class HolidayMaster : System.Web.UI.Page
    {
        Bal_Holiday obj = new Bal_Holiday();
        SqlDataReader dr;
        DataSet ds;
        Messageclass msg = new Messageclass();
        static int Id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }
                Bindgrid();
                btnupdate.Visible = false;
            }
        }
        public void Bindgrid()
        {
            obj.Type = 4;
            ds = obj.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            obj.Type = 1;
            obj.Date = txtdate.Text;
            obj.Description = txtdesc.Text;
            int result = obj.Execute();
            if (result > 0)
            {
                msg.ShowAlertMessage("Submitted Successfully");
                Bindgrid();
                txtdate.Text = "";
                txtdesc.Text = "";
            }

            else
            {
                msg.ShowAlertMessage("Already Submitted");
                Bindgrid();
                txtdate.Text = "";
                txtdesc.Text = "";
            }
        }

        protected void btnupdate_Click(object sender, EventArgs e)
        {
            obj.Type = 3;
            obj.Id = Id;
            obj.Date = txtdate.Text;
            obj.Description = txtdesc.Text;
            int result = obj.Execute();
            if (result > 0)
            {
                msg.ShowAlertMessage("Updated Successfully");
                Bindgrid();
                txtdate.Text = "";
                txtdesc.Text = "";
                btnupdate.Visible = false;
                btnsubmit.Visible = true;
            }
        }

        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtdate.Text = "";
            txtdesc.Text = ""; txtdate.Text = "";

            btnupdate.Visible = false;
            btnsubmit.Visible = true;

        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            btnupdate.Visible = true;
            btnsubmit.Visible = false;
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                Label Sno = (Label)row.FindControl("lblid");
                Id = Convert.ToInt32(Sno.Text);

                Label dName = (Label)row.FindControl("lbldate");
                txtdate.Text = dName.Text;

                Label DCode = (Label)row.FindControl("lbldesc");
                txtdesc.Text = DCode.Text;
            }
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {

                Label Sno = (Label)row.FindControl("lblid");
                Id = Convert.ToInt32(Sno.Text);

                obj.Type = 2;
                obj.Id = Id;
                int result = obj.Execute();
                if (result > 0)
                {
                    msg.ShowAlertMessage("Deleted Successfully");
                    Bindgrid();
                    btnupdate.Visible = false;
                    btnsubmit.Visible = true;
                }

            }



        }
    }
}