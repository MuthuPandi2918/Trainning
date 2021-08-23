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
    public partial class DistrictMaster : System.Web.UI.Page
    {
        Bal_District obj = new Bal_District();
        SqlDataReader dr;
        DataSet ds;
        Messageclass msg = new Messageclass();
        static int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }
                btnupdate.Visible = false;
                State();
                BindGrid();
            }
        }
        public void State()
        {
            obj.Type = 5;
            ds = obj.DataBind();
            ddlstate.DataTextField = "StateName";
            ddlstate.DataValueField = "StateId";
            ddlstate.DataSource = ds;
            ddlstate.DataBind();

            ddlstate.Items.Insert(0, "Select");
            ddlstate.SelectedIndex = 0;
        }

        public void BindGrid()
        {
            obj.Type = 4;
            ds = obj.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            obj.Type = 1;
            obj.DistrictName = txtdname.Text;
            obj.DistrictCode = txtcode.Text;
            obj.StateId = int.Parse(ddlstate.SelectedItem.Value);
            int result = obj.Execute();
            if (result > 0)
            {
                msg.ShowAlertMessage("Register Successfully");
                BindGrid();
                txtdname.Text = "";
                txtcode.Text = "";
                ddlstate.ClearSelection();
            }
            else
            {
                msg.ShowAlertMessage("Alredry Submitted This District");
                txtdname.Text = "";
                txtcode.Text = "";
                ddlstate.ClearSelection();
            }
        }
        protected void Edit_Click(object sender, EventArgs e)
        {
            try
            {
                ddlstate.Enabled = false;

                btncancel.Visible = true;
                btnsubmit.Visible = false;
                btnupdate.Visible = true;
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
                {

                    Label Sno = (Label)row.FindControl("lblid");
                    id = Convert.ToInt32(Sno.Text);

                    Label dName = (Label)row.FindControl("lbldname");
                    txtdname.Text = dName.Text;

                    Label DCode = (Label)row.FindControl("lblcode");
                    txtcode.Text = DCode.Text;

                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        protected void btnupdate_Click(object sender, EventArgs e)
        {

            obj.Type = 2;
            obj.DistrictId = id;
            obj.DistrictName = txtdname.Text;
            obj.DistrictCode = txtcode.Text;
            if (ddlstate.SelectedIndex != 0)
            {
                obj.StateId = int.Parse(ddlstate.SelectedItem.Value);
            }
            int result = obj.Execute();
            if (result > 0)
            {
                msg.ShowAlertMessage("Updated Successfully");
                BindGrid();
                txtdname.Text = "";
                txtcode.Text = "";
                ddlstate.ClearSelection();
                btnsubmit.Visible = true;
                btnupdate.Visible = false;
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

                    obj.Type = 3;
                    obj.DistrictId = id;
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
        protected void btncancel_Click(object sender, EventArgs e)
        {
            txtdname.Text = "";
            txtcode.Text = "";

            ddlstate.ClearSelection();
            btnupdate.Visible = false;
            btnsubmit.Visible = true;
        }

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindGrid();
        }
    }
}