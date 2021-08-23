<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Seenu_Sport_Academy.Login" %>


<!DOCTYPE html>
<html class="loading" lang="en" data-textdirection="ltr">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
    <title>Admin Panel</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Quicksand:300,400,500,700"
        rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/custom.css">
    <link rel="stylesheet" type="text/css" href="assets/css/bootstrap-extended.min.css">
    <link rel="stylesheet" type="text/css" href="assets/css/av_s_main.css">
    <link rel="stylesheet" type="text/css" href="assets/css/jquery-ui.min.css">
    <!-- END Custom CSS-->
</head>
<body class="pv_log_form_bg" style="background-color: #eee !important">
    <form id="form2" runat="server">
        <div class="app-content content">
            <div class="content-wrapper">
                <div class="content-body" style="margin-top: 19vh">
                    <section class="flexbox-container">
                        <div class="col-12 d-flex align-items-center justify-content-center">
                            <div class="col-md-4 col-12  p-0">
                                <div class="av_s_log_form_out box-shadow-2">
                                    <img src="assets/img/logo.png" class="av_s_log_form_img">
                                    <div class="av_s_log_form_bdy">
                                        <div class="av_s_log_form_set">
                                            <i class="fa fa-user-o av_s_log_form_ico"></i>
                                           
                                            <asp:TextBox ID="txtusername" runat="server" class="av_s_log_form_txtbx" autocomplete="off" placeholder="UserName"></asp:TextBox>
                                        </div>
                                        <div class="av_s_log_form_set">
                                            <i class="fa fa-key av_s_log_form_ico"></i>
                                            
                                            <asp:TextBox ID="txtpwd" runat="server" class="av_s_log_form_txtbx" TextMode="Password" placeholder="Password"></asp:TextBox>
                                        </div>
                                        
                                        <asp:Button ID="Button2" runat="server" class="av_s_log_form_submit" Text="Login" OnClick="btnlogin_Click" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            </div>
        </div>
        <script src="assets/js/vendors.min.js" type="text/javascript"></script>
        <script type="text/javascript" src="assets/js/jquery.sticky.js"></script>
        <script src="assets/js/app-menu.min.js" type="text/javascript"></script>
        <script src="assets/js/app.min.js" type="text/javascript"></script>
        <script src="assets/js/custom.js" type="text/javascript"></script>
        <script src="assets/js/jquery-ui.min.js" type="text/javascript"></script>
    </form>
</body>
</html>









