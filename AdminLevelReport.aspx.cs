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
    public partial class AdminLevelReport : System.Web.UI.Page
    {
        Bal_VoucherReport obj = new Bal_VoucherReport();
        Messageclass msg = new Messageclass();
        SqlDataReader dr;
        DataSet ds, ds1;
        System.Globalization.CultureInfo Cul1 = new System.Globalization.CultureInfo("hi-IN", true);
        SqlDataReader dr1;
        DataTable table = new DataTable();
        DataRow drow;
        string username, sponcerid;
        static int customerid;
        int count = 0;
        string levelname;
        string Sno;
        Label lbl_name = new Label();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }
                if (Session["username"] != null)
                {
                    Session["CheckRefresh"] = System.DateTime.Now.ToString();
                    txtCusName.Focus();
                    //txtCusCode.Text =  Session["CodeUser"].ToString();
                    grid.Visible = false;
                }
            }
        }
        protected void Page_PreRender(object sender, EventArgs e)
        {
            ViewState["CheckRefresh"] = Session["CheckRefresh"];
        }
        protected void View_Click(object sender, EventArgs e)
        {
            calculate();
            grid.Visible = true;
            //txtCusCode.Text = "";
            //txtCusName.Text = "";
        }
        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {

        }

        public void get_customer()
        {
            if (txtCusCode.Text.Trim() != "")
            {
                obj.UserCode = txtCusCode.Text.Trim();
                obj.Value = 1;
                dr = obj.CheckDummy();
                dr.Read();
                if (dr.HasRows == true)
                {
                    customerid = Convert.ToInt32(dr[1].ToString());
                    //lbl_na.Text = "Level For:" + dr[0].ToString();
                    txtCusName.Text = dr[0].ToString();
                    //lbl_na.Visible = true;
                    dr.Close();
                }
                else
                {
                    dr.Close();
                    txtCusCode.Text = "SSA";
                    txtCusName.Text = "";
                    msg.ShowAlertMessage("Please Enter Valid Customer Code...!");
                }

            }
            else
            {
                msg.ShowAlertMessage("Please Enter Customer Code");
            }
            if (txtCusCode.Text == "0")
            {
                txtCusName.Text = "Admin";
            }

            username = txtCusCode.Text;
        }

        public void calculate()
        {
            if (txtCusCode.Text != "SSA")
            {
                lbllevelcode.Text = txtCusCode.Text;
                string cntlevel1 = "", cntlevel2 = "";
                table.Columns.Clear();
                table.Columns.Add("sno", typeof(string));
                table.Columns.Add("customer_code", typeof(string));
                table.Columns.Add("customer_name", typeof(string));
                table.Columns.Add("date_of_join", typeof(string));
                table.Columns.Add("contact_no", typeof(string));
                table.Columns.Add("introducer_id", typeof(string));
                table.Columns.Add("introducer_code", typeof(string));
                table.Columns.Add("customer_id", typeof(string));
                table.Columns.Add("levelcount", typeof(string));
                //table.Columns.Add("productprice", typeof(string));
                //table.Columns.Add("Type", typeof(string));
                //table.Columns.Add("due", typeof(string));
                obj.AdvId = customerid;
                obj.Value = 2;
                dr1 = obj.CheckDummy();
                dr1.Read();
                if (dr1.HasRows == true)
                {
                    sponcerid = dr1[0].ToString();
                }
                dr1.Close();
                obj.IntroducerCode = Convert.ToString(sponcerid);
                obj.Value = 3;
                ds = obj.Bind();
                if (ds.Tables[0].Rows.Count > 0)
                {
                    count += 1;
                    levelname = "<b><u>" + count + "   LEVEL" + "</u></b>";
                    cntlevel1 = "<b><u> TOTAL COUNT : " + ds.Tables[0].Rows.Count.ToString() + "</u></b>";
                }
                lbl_name.Text = levelname;
                table.Rows.Add(lbl_name.Text, cntlevel1);
                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    drow = table.NewRow();
                    drow["sno"] = (i + 1).ToString();
                    drow["customer_id"] = ds.Tables[0].Rows[i]["UserId"].ToString();
                    drow["customer_code"] = ds.Tables[0].Rows[i]["UserCode"].ToString();
                    drow["customer_name"] = ds.Tables[0].Rows[i]["UserName"].ToString();
                    drow["date_of_join"] = ds.Tables[0].Rows[i]["date_Of_Join"].ToString();
                    drow["contact_no"] = ds.Tables[0].Rows[i]["ContactNumber"].ToString();
                    drow["introducer_id"] = ds.Tables[0].Rows[i]["ReferelId"].ToString();
                    drow["introducer_code"] = ds.Tables[0].Rows[i]["introcode"].ToString();
                    drow["levelcount"] = ds.Tables[0].Rows[i]["levelcount"].ToString();
                    //drow["productprice"] = ds.Tables[0].Rows[i]["Price"].ToString();
                    //drow["Type"] = ds.Tables[0].Rows[i]["Type"].ToString();
                    //drow["due"] = ds.Tables[0].Rows[i]["Due"].ToString();
                    //drow["PlanStatus"] = ds.Tables[0].Rows[i]["plan_status"].ToString();
                    //drow["Board"] = ds.Tables[0].Rows[i]["Board"].ToString();
                    //drow["mode1"] = ds.Tables[0].Rows[i]["mode"].ToString();
                    table.Rows.Add(drow);
                }
                DataTable dt = new DataTable();
                dt = ds.Tables[0];
                System.Globalization.CultureInfo culInfo = new System.Globalization.CultureInfo("hi-IN");
                //Double amo = (from b in dt.AsEnumerable()
                //              select b.Field<Double>("Price")).Sum();
                //if (amo > 0)
                //    table.Rows.Add("", "", "", "", "", "", "", "", "", "Rs. " + (from b in dt.AsEnumerable()
                //                                                                 select b.Field<Double>("Price")).Sum().ToString());
                found:
                if (count < 7)
                {
                    levelname = "";
                    cntlevel2 = "";
                    obj.IntroducerCode = Convert.ToString(sponcerid);
                    obj.Value = 4;
                    ds1 = obj.Bind();
                    DataTable dt1 = new DataTable();
                    dt1 = ds1.Tables[0];
                    if (ds1.Tables[0].Rows.Count > 0)
                    {
                        count += 1;
                        levelname = "<b><u>" + count + "   LEVEL" + "</u></b>";
                        cntlevel2 = "<b><u> TOTAL COUNT : " + ds1.Tables[0].Rows.Count.ToString() + "</u></b>";
                    }
                    lbl_name.Text = levelname;
                    this.lbl_name.ForeColor = System.Drawing.Color.Red;
                    table.Rows.Add(lbl_name.Text, cntlevel2);
                    for (int i = 0; i < ds1.Tables[0].Rows.Count; i++)
                    {
                        drow = table.NewRow();
                        drow["sno"] = (i + 1).ToString();
                        drow["customer_id"] = ds1.Tables[0].Rows[i]["UserId"].ToString();
                        drow["customer_code"] = ds1.Tables[0].Rows[i]["UserCode"].ToString();
                        drow["customer_name"] = ds1.Tables[0].Rows[i]["UserName"].ToString();
                        drow["date_of_join"] = ds1.Tables[0].Rows[i]["date_Of_Join"].ToString();
                        drow["contact_no"] = ds1.Tables[0].Rows[i]["ContactNumber"].ToString();
                        drow["introducer_id"] = ds1.Tables[0].Rows[i]["ReferelId"].ToString();
                        drow["introducer_code"] = ds1.Tables[0].Rows[i]["introcode"].ToString();
                        drow["levelcount"] = ds1.Tables[0].Rows[i]["levelcount"].ToString();
                        //drow["productprice"] = ds1.Tables[0].Rows[i]["Price"].ToString();
                        //drow["Type"] = ds1.Tables[0].Rows[i]["Type"].ToString();
                        //drow["due"] = ds1.Tables[0].Rows[i]["Due"].ToString();
                        //drow["PlanStatus"] = ds1.Tables[0].Rows[i]["plan_status"].ToString();
                        //drow["board"] = ds1.Tables[0].Rows[i]["board"].ToString();
                        // drow["mode1"] = ds1.Tables[0].Rows[i]["mode"].ToString();
                        table.Rows.Add(drow);
                    }
                    //amo = (from b in dt1.AsEnumerable()
                    //       select b.Field<Double>("Price")).Sum();
                    //if (amo > 0)
                    //    table.Rows.Add("", "", "", "", "", "", "", "", "", "Rs. " + (from b in dt1.AsEnumerable()
                    //                                                                 select b.Field<Double>("Price")).Sum().ToString());
                    obj.IntroducerCode = Convert.ToString(sponcerid);
                    obj.Value = 5;
                    dr1 = obj.CheckDummy();
                    dr1.Read();
                    // sponcerid = "";
                    if (dr1.HasRows == true)
                    {
                        if (sponcerid != "")
                        {
                            if (dr1[0].ToString() != string.Empty)
                            {
                                sponcerid = dr1[0].ToString();
                                dr1.Close();
                                goto found;
                            }
                            dr1.Close();
                        }
                    }
                    dr1.Close();
                }
                GridView1.DataSource = table;
                GridView1.DataBind();
            }
            else
            {
                msg.ShowAlertMessage("Please Enter Customer Code");
            }
        }
        protected void BtnExport_Click(object sender, EventArgs e)
        {

        }

        protected void txtCusCode_TextChanged(object sender, EventArgs e)
        {
            try
            {
                //if (Session["CheckRefresh"].ToString() == ViewState["CheckRefresh"].ToString())
                //{

                get_customer();

                //    Session["CheckRefresh"] = System.DateTime.Now.ToString();
                //}
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            txtCusCode.Text = "SSA";
            txtCusName.Text = "";
            grid.Visible = false;

        }
    }
}