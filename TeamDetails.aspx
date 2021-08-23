<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="TeamDetails.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.TeamDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Team Details</div>
                <div class="av_s_card_body">
                    <asp:Label ID="lblPId" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="lblUId" runat="server" Visible="false"></asp:Label>
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">User Code</label>
                                    <div class="col-md-8">                                     
                                        <asp:TextBox ID="txtucode" Text="SSA" runat="server" autocomplete="off"
                                            class="form-control" OnTextChanged="UserCodeOnTextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtucode" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">User Name</label>
                                    <div class="col-md-8">                                      
                                        <asp:TextBox ID="txtuname" runat="server" class="form-control" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtuname" ErrorMessage="*" ValidationGroup="vg">
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
                                        <asp:TextBox ID="txtfromdate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfromdate" Format="dd/MM/yyyy" />
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">To Date</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txttodate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                        <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txttodate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>                                   
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                        
                        <asp:Button ID="btncancel" runat="server" Text="Clear" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" />
                        <asp:LinkButton ID="BtnExport" runat="server" class="av_s_form_btn av_s_btn_orange" OnClick="BtnExport_Click"><i class="fa fa-file-excel-o"></i></asp:LinkButton>
                        <asp:Button ID="btnsubmit" runat="server" Text="View" ValidationGroup="vg" class="av_s_form_btn av_s_btn_grn" OnClick="btnview_Click" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div id="grid" runat="server">
                <div class="av_s_card">
                    <div class="av_s_card_head">Team Details</div>
                    <div class="av_s_card_body">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView2" runat="server" ShowFooter="false" PageSize="50" AllowPaging="true" OnPageIndexChanging="GridView2_PageIndexChanging"
                                AutoGenerateColumns="false" class="table table-bordered"
                                GridLines="None">
                                <HeaderStyle />
                                <EmptyDataTemplate>
                                    No Data Found!!..
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="S.NO">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Details">
                                        <ItemTemplate>
                                            Name:
                                                <asp:Label ID="lbl_name" runat="server" Text='<%#Eval ("UserName") %>'></asp:Label>
                                            <br />
                                            Code:<asp:Label ID="lbl_customercode" runat="server" Text='<%#Eval ("UserCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DOJ">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_doj" runat="server" Text='<%#Eval ("Timestamp","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_contact" runat="server" Text='<%#Eval ("ContactNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                    
                                    <asp:TemplateField HeaderText="Advisor Details">
                                        <ItemTemplate>
                                            Name:<asp:Label ID="lbl_advisor_name" runat="server" Text='<%#Eval ("ReferelName") %>'></asp:Label>
                                            <br />
                                            Code:<asp:Label ID="lbl_advisor_code" runat="server" Text='<%#Eval ("ReferelCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</asp:Content>
