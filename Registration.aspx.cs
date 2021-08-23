using Seenu_Sport_Academy.Bal;
using Seenu_Sport_Academy.Dal;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Seenu_Sport_Academy.Admin
{
    public partial class Registration : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString);
        Bal_Registration obj = new Bal_Registration();
        Bal_state obj2 = new Bal_state();
        Bal_District obj3 = new Bal_District();
        TalukMaster obj4 = new TalukMaster();
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        SqlCommand cmd;
        DataSet ds;
        string Mode;
        int Node = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }
                edit.Visible = true;
                Btnupdate.Visible = false;

                Bindgrid();
                state();
            }
        }
        public void state()
        {
            obj2.Type = 2;
            ds = obj2.DataBind();
            ddlstate.DataTextField = "StateName";
            ddlstate.DataValueField = "StateId";
            ddlstate.DataSource = ds;
            ddlstate.DataBind();

            ddlstate.Items.Insert(00, "Select");
            ddlstate.SelectedIndex = 0;

            ddldistrict.Items.Insert(00, "Select");
            ddldistrict.SelectedIndex = 0;
        }

        protected void OnStateSelectedIndexChanged(object sender, EventArgs e)
        {
            District();
        }

        public void District()
        {
            obj3.Type = 6;
            obj3.StateId = int.Parse(ddlstate.SelectedItem.Value);
            ds = obj3.DataBind();
            ddldistrict.DataTextField = "DistrictName";
            ddldistrict.DataValueField = "DistrictId";
            ddldistrict.DataSource = ds;
            ddldistrict.DataBind();

            ddldistrict.Items.Insert(00, "Select");
            ddldistrict.SelectedIndex = 0;
        }
        //public void Product()
        //{
        //    obj1.Type = 2;
        //    ds = obj1.DataBind();
        //    ddlproduct.DataTextField = "ProductName";
        //    ddlproduct.DataValueField = "ProductId";
        //    ddlproduct.DataSource = ds;
        //    ddlproduct.DataBind();

        //    ddlproduct.Items.Insert(00, "Select");
        //    ddlproduct.SelectedIndex = 0;

        //}

        public void Bindgrid()
        {
            obj.Type = 4;
            ds = obj.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        protected void ReferelOnTextChanged(object sender, EventArgs e)
        {
            if (txtrcode.Text == "0")
            {
                txtrname.Text = "Admin";
            }
            else

            {
                obj.Type = 2;
                obj.UserCode = txtrcode.Text;
                dr = obj.DataRead();
                dr.Read();
                if (dr.HasRows == true)
                {
                    lblid.Text = dr[0].ToString();
                    txtrname.Text = dr[1].ToString();
                    dr.Close();
                }
                else
                {
                    msg.ShowAlertMessage("Invalid Referel Code");
                    txtrcode.Text = "SSA";
                    txtrname.Text = "";
                    dr.Close();
                }
            }

            obj.Type = 3;
            obj.ReferalCode = lblid.Text;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                Node = Convert.ToInt32(dr[0].ToString());
                dr.Close();

                if (Node == 5)
                {
                    msg.ShowAlertMessage("YOU ARE NOT ABLE TO PLACE IDs UNDER THIS CUSTOMER");
                    txtrcode.Text = "";
                    txtrname.Text = "";
                    dr.Close();
                }
                else
                {
                    //msg.ShowAlertMessage("AVAILABLE TO PLACE IDs UNDER THIS CUSTOMER");
                    dr.Close();
                }
            }
        }

        //protected void MobileNoOnTextChanged(object sender,EventArgs e)
        //{
        //    try
        //    {
        //        obj.Type = 16;
        //        obj.ContactNumber = txtconact.Text;
        //        dr = obj.DataRead();              
        //        dr.Read();
        //        if(dr.HasRows)
        //        {
        //            msg.ShowAlertMessage(" Mobile Number Already Exists..Try Others");
        //            txtconact.Text = "";
        //            dr.Close();
        //        } 
        //        else
        //        {
        //            dr.Close();
        //        }                            
        //    }
        //    catch (Exception Ex)
        //    {
        //        throw (Ex);
        //    }
        //}

        protected void Btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Type = 1;
                obj.UserName = txtuname.Text;
                if (txtrcode.Text == "0")
                {
                    obj.ReferalCode = "0";
                    obj.ReferalName = "Admin";
                }
                else if (txtrcode.Text != "0")
                {
                    obj.ReferalCode = lblid.Text;
                    obj.ReferalName = txtrname.Text;
                }
                obj.EmployeeId = "0";
                obj.ContactNumber = txtconact.Text;
                //obj.ProductId = int.Parse(ddlproduct.SelectedItem.Value);
                if (radio.SelectedItem.Text == "Male")
                    obj.Gender = "Male";
                else if (radio.SelectedItem.Text == "FeMale")
                    obj.Gender = "FeMale";
                obj.Address = txtadd.Text;
                obj.StateId = int.Parse(ddlstate.SelectedItem.Value);
                obj.District = int.Parse(ddldistrict.SelectedItem.Value);
                obj.NomineeName = txtnname.Text;
                System.Globalization.CultureInfo Cul1 = new System.Globalization.CultureInfo("hi-IN", true);
                DateTime fromdate = new DateTime();
                if (TxtDob.Text != "")
                    fromdate = DateTime.Parse(TxtDob.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                obj.Dob = fromdate.ToString("yyyy/MM/dd");
                obj.EMail = txtmail.Text;
                obj.NomineeName = txtnname.Text;
                obj.Relationship = txtrelation.Text;
                obj.BankName = txtbankname.Text;
                //obj.BankBranch = txtbankbr.Text;
                obj.AccountNumber = txtac.Text;
                obj.Ifsc = txtifsc.Text;
                obj.PanNumber = txtpanno.Text;
                string Pwd = new Random().Next(1, 999999).ToString("D6");
                obj.Password = Pwd;
                dr = obj.DataRead();
                dr.Read();
                if (dr.HasRows)
                {
                    LblSUserId.Text = dr[0].ToString();
                    dr.Close();
                    cmd = new SqlCommand("USP_level_commission", con)
                    {
                        CommandTimeout = 48000,
                        CommandType = CommandType.StoredProcedure,
                    };
                    cmd.Parameters.AddWithValue("UserId", LblSUserId.Text);
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (con.State == ConnectionState.Open)
                        con.Close();
                    Session["IdUser"] = LblSUserId.Text;
                    Session["UserName"] = txtuname.Text;
                    Session["contact_no"] = txtconact.Text;
                    string UserCode = "";
                    obj.Type = 7;
                    obj.UserId = int.Parse(LblSUserId.Text);
                    dr = obj.DataRead();
                    dr.Read();
                    if (dr.HasRows)
                    {
                        UserCode = dr[1].ToString();
                        dr.Close();
                    }
                    dr.Close();
                    GetCustomercode();
                    //GetUserCode();
                    new SmsCall().SendSmsBulkSms("Welcome to Seenu Sports Academy!, Dear " + Session["UserName"].ToString() + ", you are successfully registered with us.Your UserID : " + lblusercode.Text + "," + "Password : " + Pwd + ".for more info log on to :  http://www.seenuacademy.com", base.Session["contact_no"].ToString());
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('User Details Saved Successfully, Your User Code : " + lblusercode.Text + ".');", true);
                    Bindgrid();
                    //Topupdetails();
                    Clear();
                }
            }
            catch (Exception Ex)
            {
                throw (Ex);
            }
        }

        //public void Topupdetails()
        //{
        //    try
        //    {
        //        obj.Type = 31;
        //        obj.UserId = int.Parse(LblSUserId.Text);
        //        dr = obj.DataRead();
        //        dr.Read();
        //        if (dr.HasRows)
        //        {
        //            LblReferralId.Text = dr[0].ToString();
        //            dr.Close();
        //        }
        //        else
        //        {
        //            msg.ShowAlertMessage("Invalid Distributor Code");
        //            txtrcode.Text = "";
        //            dr.Close();
        //        }

        //        obj1.Type = 5;
        //        obj1.ProductId = int.Parse(ddlproduct.SelectedItem.Value);
        //        dr = obj1.DataRead();
        //        dr.Read();
        //        if (dr.HasRows)
        //        {
        //            lblprice.Text = dr[0].ToString();
        //            dr.Close();
        //        }
        //        else
        //        {
        //            dr.Close();
        //        }
        //        dr.Close();



        //        obj5.Type = 1;
        //        obj5.UserId = int.Parse(LblSUserId.Text);
        //        obj5.AdvisorId = int.Parse(LblReferralId.Text);
        //        obj5.ProductId = int.Parse(ddlproduct.SelectedItem.Value);
        //        obj5.Quantity = 1;
        //        obj5.Price = int.Parse(lblprice.Text);
        //        obj5.TotalPrice = int.Parse(lblprice.Text);
        //        obj5.ModeOfPayment = "Cash";
        //        obj5.Due = 1;
        //        int result = obj5.Execute();
        //    }
        //    catch (Exception Ex)
        //    {
        //        throw (Ex);
        //    }
        //}

        protected void Btnupdate_Click(object sender, EventArgs e)
        {
            try
            {
                obj.Type = 6;
                obj.UserId = Convert.ToInt32(LblSUserId.Text);
                obj.UserName = txtuname.Text;
                obj.Address = txtadd.Text;
                if (txtrcode.Text == "0")
                {
                    obj.ReferalCode = "0";
                    obj.ReferalName = "Admin";
                }
                else if (txtrcode.Text != "0")
                {
                    obj.ReferalCode = lblid.Text;
                    obj.ReferalName = txtrname.Text;
                }
                if (radio.SelectedItem.Text == "Male")
                    obj.Gender = "Male";
                else if (radio.SelectedItem.Text == "FeMale")
                    obj.Gender = "FeMale";
                obj.NomineeName = txtnname.Text;
                obj.ContactNumber = txtconact.Text;
                obj.Relationship = txtrelation.Text;
                obj.BankName = txtbankname.Text;
                obj.EMail = txtmail.Text;
                //obj.BankBranch = txtbankbr.Text;
                obj.AccountNumber = txtac.Text;
                obj.StateId = int.Parse(ddlstate.SelectedItem.Value);
                obj.District = int.Parse(ddldistrict.SelectedItem.Value);
                obj.Ifsc = txtifsc.Text;
                obj.Dob = TxtDob.Text;
                //obj.ProductId = int.Parse(ddlproduct.SelectedItem.Value);
                //obj.Password = ddlproduct.SelectedItem.Text;
                obj.PanNumber = txtpanno.Text;
                int res = obj.Execut();
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alert", "alert('Updated!');window.location ='" + Request.RawUrl + "';", true);
                    //msg.ShowAlertMessage("Successfully Updated");

                    //Btnupdate.Visible = false;
                    //Btnsubmit.Visible = true;
                    //adv.Visible = true;
                    //Bindgrid();
                    //Clear();
                }

            }
            catch (Exception Ex)
            {
                throw (Ex);
            }
        }

        protected void Edit_Click(object sender, EventArgs e)
        {
            edit.Visible = true;
            try
            {
                Btnupdate.Visible = true;
                Btnsubmit.Visible = false;
                adv.Visible = true;
                using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
                {
                    LblSUserId.Text = ((Label)row.FindControl("lbl_id")).Text;

                    txtuname.Text = ((Label)row.FindControl("lbl_name")).Text;

                    txtadd.Text = ((Label)row.FindControl("lbl_address")).Text;

                    txtbankname.Text = ((Label)row.FindControl("lbl_bankname")).Text;

                    //txtbankbr.Text = ((Label)row.FindControl("lbl_bankbranch")).Text;

                    txtac.Text = ((Label)row.FindControl("lbl_accountno")).Text;

                    txtifsc.Text = ((Label)row.FindControl("lbl_ifsc")).Text;

                    txtpanno.Text = ((Label)row.FindControl("lbl_panno")).Text;

                    TxtDob.Text = ((Label)row.FindControl("lbl_Dob")).Text;

                    txtnname.Text = ((Label)row.FindControl("lbl_nomname")).Text;

                    txtconact.Text = ((Label)row.FindControl("lbl_contact")).Text;

                    txtrelation.Text = ((Label)row.FindControl("lbl_relation")).Text;

                    txtrcode.Text = ((Label)row.FindControl("lbl_advisor_code")).Text;
                    txtrcode.ReadOnly = true;
                    txtrname.Text = ((Label)row.FindControl("lbl_advisor_name")).Text;
                    txtrname.ReadOnly = true;
                    Label lblGender = ((Label)row.FindControl("lblGender"));

                    //ddlstate.Text = ((Label)row.FindControl("lbl_state")).Text;
                    state();
                    ddlstate.ClearSelection();
                    ddlstate.Items.FindByValue(((Label)row.FindControl("lblstateId")).Text).Selected = true;

                    District();
                    ddldistrict.ClearSelection();
                    ddldistrict.Items.FindByValue(((Label)row.FindControl("lbldistId")).Text).Selected = true;

                    radio.ClearSelection();
                    radio.Items.FindByText((lblGender.Text)).Selected = true;
                    //Product();
                    //ddlproduct.ClearSelection();
                    //ddlproduct.Items.FindByValue(((Label)row.FindControl("LblProductId")).Text).Selected = true;
                }

            }
            catch (Exception Ex)
            {
                throw (Ex);
            }

        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            using (GridViewRow row = (GridViewRow)((LinkButton)sender).Parent.Parent)
            {
                LblSUserId.Text = ((Label)row.FindControl("lbl_id")).Text;

                obj.Type = 5;
                obj.UserId = Convert.ToInt32(LblSUserId.Text);
                int result = obj.Execut();
                if (result > 0)
                {
                    msg.ShowAlertMessage("Deleted Successfully");
                    Btnsubmit.Visible = true;
                    Btnupdate.Visible = false;
                }
                Bindgrid();
            }
        }

        protected void Btnclear_Click(object sender, EventArgs e)
        {
            Clear();
            Btnsubmit.Visible = true;
            Btnupdate.Visible = false;
            edit.Visible = true;
        }

        public void Clear()
        {
            txtuname.Text = "";
            txtrcode.Text = "";
            txtrname.Text = "";
            txtconact.Text = "";
            //ddlproduct.ClearSelection();
            txtadd.Text = "";
            radio.ClearSelection();
            txtnname.Text = "";
            txtbankname.Text = "";
            //txtbankbr.Text = "";
            txtac.Text = "";
            txtpanno.Text = "";
            txtifsc.Text = "";
            ddlstate.ClearSelection();
            ddldistrict.ClearSelection();
            TxtDob.Text = "";
            txtmail.Text = "";
            txtrelation.Text = "";
        }

        //#region "UserCode"
        //public void GetUserCode()
        //{
        //    try
        //    {
        //        Found:
        //        string UserCode = "ee" + new Random().Next(1, 100000).ToString("D6");
        //        if (con.State == ConnectionState.Closed)
        //            con.Open();
        //        cmd = new SqlCommand("select 1 From Registration where UserCode='" + UserCode.Trim() + "' ", con);
        //        dr = cmd.ExecuteReader();
        //        dr.Read();
        //        if (dr.HasRows)
        //        {
        //            dr.Close();
        //            goto Found;
        //        }
        //        else
        //        {
        //            dr.Close();
        //            Session["usercode"] = UserCode.Trim();
        //            if (con.State == ConnectionState.Closed)
        //                con.Open();
        //            cmd = new SqlCommand("if not exists (select 1 From Registration where UserCode='" + UserCode.Trim() + "')update Registration set UserCode='" + UserCode.Trim() + "' where UserId='" + UserId + "' ", con);
        //            int b = cmd.ExecuteNonQuery();
        //            if (con.State == ConnectionState.Open)
        //                con.Close();
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        throw ex;
        //    }
        //}
        //#endregion




        #region GetUserCode
        public void GetCustomercode()
        {
            try
            {
                Int64 MaxNo = 0;
                string last = "SSA";
                obj.Type = 17;
                dr = obj.DataRead();
                dr.Read();
                if (dr.HasRows)
                {
                    dr.Close();

                    obj.Type = 18;
                    dr = obj.DataRead();
                    dr.Read();
                    if (dr.HasRows)
                    {
                        if (dr[0].ToString() != "")
                        {
                            MaxNo = int.Parse(dr[0].ToString());
                            long b = (MaxNo + 1);
                            lblusercode.Text = last + b.ToString();
                            dr.Close();
                        }
                        else
                        {
                            lblusercode.Text = last + "10001";
                            dr.Close();
                        }
                    }
                    else
                    {

                        lblusercode.Text = last + "10001";
                        dr.Close();
                    }
                }
                else
                {
                    lblusercode.Text = last + "10001";
                    dr.Close();

                }

                obj.Type = 19;
                obj.UserCode = lblusercode.Text;
                dr = obj.DataRead();
                dr.Read();

                if (dr.HasRows == true)
                {
                    msg.ShowAlertMessage("Already Exists Customer code");
                    dr.Close();
                }

                else
                {
                    dr.Close();
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    cmd = new SqlCommand("if not exists (select 1 From Registration where UserCode in('" + lblusercode.Text + "'))update Registration set UserCode='" + lblusercode.Text + "' where UserId='" + LblSUserId.Text + "' ", con);
                    int b = cmd.ExecuteNonQuery();

                    if (con.State == ConnectionState.Open)
                    {
                        con.Close();
                    }
                }
                dr.Close();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        #endregion

        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bindgrid();
        }

        protected void BtnSearch_Click(object sender, EventArgs e)
        {
            if (TxtSearchCode.Text != "SSA")
            {
                obj.UserCode = TxtSearchCode.Text;
                obj.Type = 22;
                ds = obj.DataBind();
                GridView1.DataSource = ds;
                GridView1.DataBind();
                TxtSearchCode.Text = "SSA";
            }
            else
            {
               
                obj.Type = 35;
                ds = obj.DataBind();
                GridView1.DataSource = ds;
                GridView1.DataBind();
                TxtSearchCode.Text = "SSA";
            }
            //if (!string.IsNullOrEmpty(TxtSearchCode.Text))
            //{
            //    obj.UserCode = TxtSearchCode.Text;
            //    obj.Type = 22;
            //    ds = obj.DataBind();
            //    GridView1.DataSource = ds;
            //    GridView1.DataBind();
            //    TxtSearchCode.Text = "SSA";
            //}
        }

    }
}