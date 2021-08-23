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
    public partial class CommissionPost : System.Web.UI.Page
    {
        private Bal_commissionWallet obj = new Bal_commissionWallet();
        private Messageclass msg = new Messageclass();
        private SqlDataReader dr;
        private DataSet ds;
        private System.Globalization.CultureInfo Cul1 = new System.Globalization.CultureInfo("hi-IN", true);
        private DateTime datefrom, dateto;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("../Login.aspx");
                }
                Bindgrid();
                PostAmount();
                DateBind();
            }
        }
        public void PostAmount()
        {
            obj.Type = 15;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                if (dr[0].ToString() != "")
                {
                    lblamt.Text = dr[0].ToString();

                    dr.Close();
                }
                else
                {
                    lblamt.Text = "0";
                    dr.Close();
                }
            }
            dr.Close();
        }

        public void Bindgrid()
        {
            obj.Type = 10;
            ds = obj.DataBind();
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }

        public void DateBind()
        {
            obj.Type = 28;
            dr = obj.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lbldate.Text = dr[0].ToString();
                txtfromdate.Text = lbldate.Text;
                txtfromdate.Enabled = false;
                dr.Close();
            }
            else
            {
                dr.Close();
            }
        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {

            //string Query = " ";
            //if (txtfromdate.Text == "" || txttodate.Text == "")
            //{
            //    using (SqlCommand cmd1 = new SqlCommand(Query + " order by Timestamp asc  option (maxrecursion 0)", con))
            //    {
            //        SqlDataAdapter da = new SqlDataAdapter(cmd1);
            //        cmd1.CommandTimeout = 500;
            //        ds = new DataSet();
            //        da.Fill(ds);
            //        if (ds.Tables[0].Rows.Count > 0)
            //        {
            //            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            //            {
            //                obj.Type = 12;
            //                obj.UserId = int.Parse(ds.Tables[0].Rows[i]["UserId"].ToString());
            //                obj.AdvisorId = int.Parse(ds.Tables[0].Rows[i]["Advisior"].ToString());
            //                obj.CreditRs = float.Parse(ds.Tables[0].Rows[i]["CreditRs"].ToString());
            //                obj.DebitRs = float.Parse(ds.Tables[0].Rows[i]["DebitRs"].ToString());
            //                obj.Status = int.Parse(ds.Tables[0].Rows[i]["Status"].ToString());
            //                obj.Date = ds.Tables[0].Rows[i]["Date"].ToString();
            //                int result = obj.Execute();
            //                if (result > 0)
            //                {
            //                    msg.ShowAlertMessage("Successfully Commission Posted");
            //                    txtfromdate.Text = "";
            //                    txttodate.Text = "";
            //                }
            //            }
            //            obj.Type = 27;
            //            int res = obj.Execute();
            //            PostAmount();
            //            Bindgrid();
            //            DateBind();
            //        }
            //        else
            //        {
            //            msg.ShowAlertMessage("Insufficient Amount");
            //            txtfromdate.Text = "";
            //            txttodate.Text = "";
            //        }
            //    }
            //}
            if (txtfromdate.Text != "" && txttodate.Text != "")
            {
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString))
                {
                    datefrom = DateTime.Parse(txtfromdate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);
                    dateto = DateTime.Parse(txttodate.Text.Trim(), Cul1, System.Globalization.DateTimeStyles.NoCurrentDateDefault);

                    string Query = "insert into Wallet select UserId ,Advisior ,TransactionId ,CreditRs ,DebitRs ,Status,Timestamp as Date,Getdate()  from PrimaryWallet  where PostStatus =1 and CAST( Timestamp as Date  ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "' ";
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    using (SqlCommand cmd = new SqlCommand(Query, con))
                    {
                        int r = cmd.ExecuteNonQuery();
                    }
                    using (SqlCommand cmd = new SqlCommand("Update primarywallet set PostStatus = 2  where PostStatus =1 and CAST( Timestamp as Date  ) between '" + datefrom.ToShortDateString() + "' and '" + dateto.ToShortDateString() + "'", con))
                    {
                        cmd.ExecuteNonQuery();
                    }
                    if (con.State == ConnectionState.Open)
                        con.Close();
                }

                //SqlDataAdapter da = new SqlDataAdapter(cmd1);
                //cmd1.CommandTimeout = 500;
                //ds = new DataSet();
                //da.Fill(ds);

                // if (ds.Tables[0].Rows.Count > 0)
                //{
                //    for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                //    {
                //        obj.Type = 12;
                //        obj.UserId = int.Parse(ds.Tables[0].Rows[i]["UserId"].ToString());
                //        obj.AdvisorId = int.Parse(ds.Tables[0].Rows[i]["Advisior"].ToString());
                //        obj.CreditRs = float.Parse(ds.Tables[0].Rows[i]["CreditRs"].ToString());
                //        obj.DebitRs = float.Parse(ds.Tables[0].Rows[i]["DebitRs"].ToString());
                //        obj.Status = int.Parse(ds.Tables[0].Rows[i]["Status"].ToString());
                //        obj.Date = ds.Tables[0].Rows[i]["Date"].ToString();
                //        int result = obj.Execute();
                //        if (result > 0)
                //        {
                //            msg.ShowAlertMessage("Successfully Commission Posted");
                //            txtfromdate.Text = "";
                //            txttodate.Text = "";
                //        }

                //        obj.Type = 13;
                //        obj.Date = ds.Tables[0].Rows[i]["Date"].ToString();
                //        int res = obj.Execute();

                //    }
                //}
                //else
                //{
                //    msg.ShowAlertMessage("Insufficient Amount");
                //    txtfromdate.Text = "";
                //    txttodate.Text = "";
                //}
                msg.ShowAlertMessage("Commission Posted successfully");
                txtfromdate.Text = "";
                txttodate.Text = "";
                PostAmount();
                Bindgrid();
                DateBind();
            }

        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            Bindgrid();
        }

    }
}