<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="lbltopup" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbltodaycust" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lbltodaytopup" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="topupcustomer" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="topupamounts" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-3">
            <div class="av_dash_out av_dash_red">
                <div class="av_dash_left"><i class="fa fa-trophy"></i></div>
                <div class="av_dash_top">
                    <div class="av_dash_right">
                        <div class="av_dash_right_h1">
                            <asp:Label ID="lblnoofcustomer" runat="server"></asp:Label>
                        </div>
                        <div class="av_dash_right_h2">Total Customers</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="av_dash_out av_dash_blue">
                <div class="av_dash_left"><i class="fa fa-users"></i></div>
                <div class="av_dash_top">
                    <div class="av_dash_right">
                        <div class="av_dash_right_h1">
                            <asp:Label ID="lbltodaycus" runat="server"></asp:Label></div>
                        <div class="av_dash_right_h2">Today Registered</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-3">
            <div class="av_dash_out av_dash_green">
                <div class="av_dash_left"><i class="fa fa-id-card-o"></i></div>
                <div class="av_dash_top">
                    <div class="av_dash_right">
                        <div class="av_dash_right_h1">Rs.<asp:Label ID="LblPrimaryIncome" runat="server"></asp:Label></div>
                        <div class="av_dash_right_h2">Customer Wallet Balance</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
