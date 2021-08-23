<%@ Page Title="" Language="C#" MasterPageFile="~/Customer.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="Seenu_Sport_Academy.Website.UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        @media(max-width:600px) {
        
        .reunir-navbar .right-side-box .join-btn {
        display:none !important
        }}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="ucode" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblPassword" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblMobileNo" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblName" runat="server" Visible="false"></asp:Label>
    <asp:Label ID="lblUsercode" runat="server" Visible="false"></asp:Label>
    <!-- header top end -->
    <div class="av_pg_ttl">
        Login
        <div class="av_pg_ttl_a"><a href="Home.aspx">Home</a> / <span>Login</span></div>
    </div>
    <div id="ForgetPwd" runat="server">
        <section class="contact-us-section" id="contact-us-section1" style="background-color: #F3F3F3; background-image: url(img/affiliate-bg.jpg); background-size: cover">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 av_mr_auto">
                        <div class="contact-form">
                            <div class="contact-us-text text-center">
                                <h5 class="contact-us-title">Sports academy</h5>
                                <h2 class="contact-us-subtitle">Forget Password
                                </h2>
                            </div>
                            <%--<input type="text" placeholder="User Name *" class="contact-frm ">--%>
                            <asp:TextBox ID="txtcodembl" runat="server" autocomplete="off" class="contact-frm " placeholder="Enter Mobile Number"></asp:TextBox>
                            <div class="row">
                                <div class="col-12">
                                    <%--<a href="#" class="av_login_a">Forget password ?</a>--%>
                                    <%--   <input id="form-submit" type="submit" value="Login" class="contact-btn">--%>
                                    <asp:LinkButton ID="btncnl" runat="server" Style="display: inline-block; background-color: #f00 !important; text-decoration: none; color: #fff !important; border-color: rgba(0,0,0,0.2); background: none;" Text="Cancel" CssClass="contact-btn" OnClick="btcnl_Click"></asp:LinkButton>
                                    <asp:Button ID="btnpwd" Style="display: inline-block; margin-right: 15px" runat="server" Text="Submit" class="contact-btn" OnClick="btnpwd_Click1" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <div id="UserLogin1" runat="server">
        <section class="contact-us-section" id="contact-us-section" style="background-color: #F3F3F3; background-image: url(img/affiliate-bg.jpg); background-size: cover">
            <div class="container">
                <div class="row">
                    <div class="col-lg-5 av_mr_auto">
                        <div class="contact-form">
                            <div class="contact-us-text text-center">
                                <h5 class="contact-us-title">Sports academy</h5>
                                <h2 class="contact-us-subtitle">Customer Login</h2>
                            </div>
                            <%--<input type="text" placeholder="User Name *" class="contact-frm ">--%>
                            <asp:TextBox ID="txtcode" runat="server" class="contact-frm " autocomplete="off" placeholder=" Username">
                            </asp:TextBox>
                            <%-- <input type="password" placeholder="Password *" class="contact-frm">--%>                            
                            <asp:TextBox ID="txtpwd" runat="server" class="contact-frm" TextMode="Password" placeholder=" Password">
                            </asp:TextBox>
                            <div class="row">
                                <div class="col-6">
                                    <asp:LinkButton ID="LinkButton1" runat="server" class="av_login_a" OnClick="lbtnpass_Click">Forget Password ?</asp:LinkButton>
                                    <%--<a href="#" class="av_login_a">Forget password ?</a>--%>
                                </div>
                                <div class="col-6">
                                    <%--   <input id="form-submit" type="submit" value="Login" class="contact-btn">--%>
                                    <asp:Button ID="Button1" runat="server" Text="Login" class="contact-btn" OnClick="btnlogin_Click" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <!-- footer section begin -->


</asp:Content>
