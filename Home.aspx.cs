using Seenu_Sport_Academy.Bal;
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
    public partial class Home : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["SeenuSports"].ConnectionString);
        Bal_Registration obj1 = new Bal_Registration();
        Bal_commissionWallet obj2 = new Bal_commissionWallet();
        SqlCommand cmd;
        SqlDataReader dr;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["username"] == null)
            {
                Response.Redirect("../Login.aspx");
            }
            //  LevelCommission();
            TotCustomer();
            TodayRegisterCustomers();
            CusWallletPrimary();
        }
        public void TotCustomer()
        {
            obj1.Type = 13;
            dr = obj1.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                string TotCust = dr[0].ToString();
                if (TotCust != "")
                {
                    lblnoofcustomer.Text = TotCust;
                    dr.Close();
                }
                else
                {
                    lblnoofcustomer.Text = "0";
                    dr.Close();
                }
            }
            else
            {
                dr.Close();
            }
        }
        public void TodayRegisterCustomers()
        {
            obj1.Type = 24;
            obj1.PanNumber = DateTime.Now.ToShortDateString();
            dr = obj1.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                lbltodaycust.Text = dr[0].ToString();
                if (lbltodaycust.Text != "0")
                {
                    lbltodaycus.Text = lbltodaycust.Text;
                    dr.Close();
                }
                else
                {
                    lbltodaycus.Text = "0";
                    dr.Close();
                }
            }
            else
            {
                dr.Close();
            }
        }
        public void CusWallletPrimary()
        {
            obj2.Type = 22;
            dr = obj2.DataRead();
            dr.Read();
            if (dr.HasRows)
            {
                string lblcustomer = dr[0].ToString();
                if (lblcustomer != "")
                {
                    LblPrimaryIncome.Text = lblcustomer;
                    dr.Close();
                }
                else
                {
                    LblPrimaryIncome.Text = "0";
                    dr.Close();
                }
            }
            else
            {
                dr.Close();
            }
        }

        //private void LevelCommission()
        //{
        //    if (con.State == ConnectionState.Closed)
        //        con.Open();
        //    if (!new Wallet().CommissionInsertCheck())
        //    {
        //        var ResultRoi = new Wallet().RoiDate();
        //        if (ResultRoi.Rows.Count > 0)
        //        {
        //            cmd = new SqlCommand("USP_level_commission", con)
        //            {
        //                CommandTimeout = 48000,
        //                CommandType = CommandType.StoredProcedure
        //            };
        //            if (con.State == ConnectionState.Closed)
        //                con.Open();
        //            SqlDataAdapter da = new SqlDataAdapter(cmd);
        //            DataTable dt = new DataTable();
        //            da.Fill(dt);
        //            if (con.State == ConnectionState.Open)
        //                con.Close();
        //        }
        //    }
        //}

        //private void LevelCommission1()
        //{
        //    if (con.State == ConnectionState.Closed)
        //    {
        //        con.Open();
        //    }

        //    SqlCommand cmd = new SqlCommand("USP_level_commission", con);
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    cmd.CommandTimeout = 48000;
        //    int ap = cmd.ExecuteNonQuery();
        //    if (con.State == ConnectionState.Closed)
        //    {
        //        con.Close();
        //    }




        //}
        private void LevelCommission()
        {
            if (con.State == ConnectionState.Closed)
                con.Open();
            if (!new Wallet().CommissionInsertCheck())
            {
                var ResultRoi = new Wallet().RoiDate();
                if (ResultRoi.Rows.Count > 0)
                {
                    cmd = new SqlCommand("USP_level_commission", con)
                    {
                        CommandTimeout = 48000,
                        CommandType = CommandType.StoredProcedure
                    };
                    if (con.State == ConnectionState.Closed)
                        con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    if (con.State == ConnectionState.Open)
                        con.Close();
                }
            }
        }
    }
}