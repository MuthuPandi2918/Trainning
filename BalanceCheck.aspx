<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="BalanceCheck.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.BalanceCheck" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Label ID="lblCustomerId" runat="server" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Customer Wallet Balance</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserCode</label>
                                    <div class="col-md-8">                                      
                                        <asp:TextBox ID="txtcode" Text="SSA" runat="server" autocomplete="off" class="form-control" OnTextChanged="Customer_OnTextChanged" AutoPostBack="true"></asp:TextBox>
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
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">From Date</label>
                                    <div class="col-md-8">                                       
                                        <asp:TextBox ID="txtfdate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfdate"
                                            Format="dd/MM/yyyy">
                                        </asp:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">To Date</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txttdate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txttdate" Format="dd/MM/yyyy" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                     
                        <asp:LinkButton ID="BtnExportExcel" OnClick="BtnExportExcel_Click" runat="server" class="av_s_form_btn av_s_btn_blue"><i class="fa fa-file-excel-o"></i></asp:LinkButton>
                        <asp:LinkButton ID="BtnExportWord" OnClick="BtnExportWord_Click" runat="server" class="av_s_form_btn av_s_btngrey"><i class="fa fa-file-word-o"></i></asp:LinkButton>
                        <a href="BalancePrint.aspx" class="av_s_form_btn av_s_btn_orange" target="_blank" style="color: blue">Print</a>
                        <asp:Button ID="btnclose" runat="server" class="av_s_form_btn av_s_btn_red" Text="Close" OnClick="btnclose_Click" />
                        <asp:Button ID="btnsearch" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="btnsearch_Click" ValidationGroup="vg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Panel ID="Trans" runat="server">
                <div class="av_s_card">
                    <div class="av_s_card_head">Customer Wallet Balance</div>
                    <div class="av_s_card_body">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="50" AutoGenerateColumns="False"
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
                                    <asp:TemplateField HeaderText="CountMember">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_RoiSelf" runat="server" Text='<%#Eval("CountTotal") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </asp:Panel>
        </div>
        <br />
        <br />
        <br />
    </div>








   
</asp:Content>
