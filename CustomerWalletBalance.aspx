<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerWalletBalance.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.CustomerWalletBalance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
      <asp:Label ID="lblCustomerId" runat="server" Visible="false"></asp:Label>

       <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Customer Primary Wallet Balance</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserCode</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>                                      
                                     <asp:TextBox ID="txtcode" Text="SSA" runat="server" autocomplete="off" CssClass="form-control" OnTextChanged="Customer_OnTextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcode" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserName</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>
                                          <asp:TextBox ID="txtname" runat="server" autocomplete="off" class="form-control" ReadOnly="true" AutoPostBack="true"></asp:TextBox>

                                       
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtname" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                           <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Balance Type</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>
                                             <asp:DropDownList ID="DdlType" runat="server" autocomplete="off" class="form-control">
                                        <asp:ListItem>All</asp:ListItem>
                                        <asp:ListItem>Balance</asp:ListItem>
                                        <asp:ListItem>Zero</asp:ListItem>
                                    </asp:DropDownList>
                                         
                                       
                                    </div>
                                   
                                </div>
                            </div>
                        </div>
                           <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Date</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>
                                     
                                           <asp:TextBox ID="txtfdate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfdate" Format="dd/MM/yyyy" />
                                       
                                    </div>
                                  
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="av_s_form_bottom">


                        <%--  <a class="av_s_form_btn av_s_btn_grn" href="#">Done</a>  
                  <a class="av_s_form_btn av_s_btn_orange" href="#">Done</a> --%>
                       <%-- <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="av_s_form_btn av_s_btn_grn" OnClick="btnsubmit_Click" ValidationGroup="vg" />
                        <asp:Button ID="btnupdate" runat="server" class="av_s_form_btn av_s_btn_orange" Text="Update" OnClick="btnupdate_Click" />

                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />--%>

                          <asp:Button ID="btnsearch" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="btnsearch_Click" ValidationGroup="vg" />
                                <asp:Button ID="btnclose" runat="server" class="av_s_form_btn av_s_btn_red" Text="Close" OnClick="btnclose_Click" />

                                <asp:LinkButton ID="BtnExportExcel" OnClick="BtnExportExcel_Click" runat="server"  class="av_s_form_btn av_s_btn_blue"><i class="fa fa-file-excel-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="BtnExportWord" OnClick="BtnExportWord_Click" runat="server"  class="av_s_form_btn av_s_btngrey"><i class="fa fa-file-word-o"></i></asp:LinkButton>
                                <a href="CustomerWalletBalancePrint.aspx"  class="av_s_form_btn av_s_btn_orange" target="_blank" style="color: blue">Print</a>

                        
                    </div>

                </div>
            </div>
        </div>

        <div class="col-md-12">
             <asp:Panel ID="Trans" runat="server">
            <div class="av_s_card">
                <div class="av_s_card_head">Customer Primary Wallet Balance</div>
                <div class="av_s_card_body">
                    <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">                   

                         <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                                                GridLines="None" class="table table-bordered" ShowFooter="true">
                                                <EmptyDataTemplate>
                                                    No Data Found!!..
                                                </EmptyDataTemplate>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbluser_id" runat="server" Text='<%#Eval("UserId") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User Code ">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_usercode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_customername" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_directcount" runat="server" Text='<%#Eval("Balance","{0:n2}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>


                   

                    </div>
                </div>
            </div>
                 </asp:Panel>
        </div>

    </div>





  <%--  <div class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="content-area card">
                        <div class="card-innr card-innr-fix">
                            <div class="card-head">
                                <h6 class="card-title">Customer  Wallet Balance</h6>
                            </div>
                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">User Code</label>
                                <div class="col-lg-7">

                                    <asp:TextBox ID="txtcode" Text="EEJ" runat="server" autocomplete="off" CssClass="form-control" OnTextChanged="Customer_OnTextChanged" AutoPostBack="true"></asp:TextBox>


                                </div>
                            </div>
                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">User Name</label>
                                <div class="col-lg-7">
                                    <asp:TextBox ID="txtname" runat="server" autocomplete="off" class="input-bordered" ReadOnly="true"></asp:TextBox>

                                </div>
                            </div>

                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">Balance Type</label>
                                <div class="col-lg-7">

                                    <%--  <asp:TextBox ID="txttalukname" runat="server" autocomplete="off"class="input-bordered"></asp:TextBox>--%>
                                   <%-- <asp:DropDownList ID="DdlType" runat="server" autocomplete="off" class="input-bordered">
                                        <asp:ListItem>All</asp:ListItem>
                                        <asp:ListItem>Balance</asp:ListItem>
                                        <asp:ListItem>Zero</asp:ListItem>
                                    </asp:DropDownList>

                                </div>
                            </div>

                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">Date</label>
                                <div class="col-lg-7">

                                    <%--<asp:TextBox ID="TextBox1" runat="server" autocomplete="off" class="input-bordered"></asp:TextBox>--%>
                           <%--         <asp:TextBox ID="txtfdate" runat="server" autocomplete="off" class="input-bordered"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtfdate"
                                        Format="dd/MM/yyyy">
                                    </ajaxToolkit:CalendarExtender>


                                </div>
                            </div>
                            <div class="gaps-1x"></div>
                            <div class="col-lg-12" align="center">
                                <%--  <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success" OnClick="btnsubmit_Click" ValidationGroup="vg" />
                                <asp:Button ID="btnupdate" runat="server" class="btn btn-dark" Text="Update" OnClick="btnupdate_Click" />

                                <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" class="btn btn-danger" Text="Cancel" />--%>

                              <%--  <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-success" OnClick="btnsearch_Click" ValidationGroup="vg" />
                                <asp:Button ID="btnclose" runat="server" Text="Cancel" class="btn btn-danger" OnClick="btnclose_Click" />
                                <asp:LinkButton ID="BtnExportExcel" OnClick="BtnExportExcel_Click" runat="server" Visible="false" class="btn btn-dark"><i class="fa fa-file-excel-o"></i></asp:LinkButton>
                                <asp:LinkButton ID="BtnExportWord" OnClick="BtnExportWord_Click" runat="server" Visible="false" class="btn btn-dark"><i class="fa fa-file-word-o"></i></asp:LinkButton>
                                <a href="BalanceWalletPrint.aspx" class="btn btn-info" target="_blank" style="color: blue">Print</a>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-xl-12 col-lg-12 ">
                    <div id="Trans" runat="server">
                        <div class="token-transaction card card-full-height">
                            <div class="card-innr">
                                <div class="bt-n card-head has-aside">
                                    <h4 class="card-title">Customer  Wallet Balance Details</h4>
                                </div>
                                <div>
                                    <table class="table table-bordered">
                                        <thead class="bg-primary text-white">
                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center"
                                                GridLines="None" class="table table-bordered" ShowFooter="true">
                                                <EmptyDataTemplate>
                                                    No Data Found!!..
                                                </EmptyDataTemplate>
                                                <Columns>
                                                    <asp:TemplateField HeaderText="Id" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbluser_id" runat="server" Text='<%#Eval("UserId") %>' Visible="false"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="S.No">
                                                        <ItemTemplate>
                                                            <%#Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User Code ">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_usercode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="User Name">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_customername" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="Balance">
                                                        <ItemTemplate>
                                                            <asp:Label ID="lbl_directcount" runat="server" Text='<%#Eval("Balance","{0:n2}") %>'></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </asp:GridView>
                                        </thead>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>



        </div>
    </div>--%>



</asp:Content>
