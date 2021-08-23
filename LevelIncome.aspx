<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="LevelIncome.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.LevelIncome" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Level Income</div>
                <div class="av_s_card_body">
                    <div id="search" runat="server">
                        <div class="row">
                            <div class="col-md-12 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <div class="row">
                                        <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserCode</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtucode" Text="SSA" runat="server" autocomplete="off"
                                                class="form-control" OnTextChanged="UserCodeOnTextChanged" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                        <div class="av_s_frm_vld">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtucode" ErrorMessage="*" ValidationGroup="vg">
                                            </asp:RequiredFieldValidator>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-sm-6 col-xs-12">
                                <div class="form-group">
                                    <div class="row">
                                        <asp:Label ID="lblCustomerId" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="Label1" runat="server" Visible="false"></asp:Label>
                                        <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserName</label>
                                        <div class="col-md-8">
                                            <asp:TextBox ID="txtuname" runat="server" autocomplete="off" class="form-control" ReadOnly="true" ForeColor="Black"></asp:TextBox>
                                        </div>
                                        <div class="av_s_frm_vld">
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtuname" ErrorMessage="*" ValidationGroup="vg">
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
                                            <asp:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txtfromdate"
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
                                            <asp:TextBox ID="txttodate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                            <asp:CalendarExtender ID="CalendarExtender4" runat="server" TargetControlID="txttodate" Format="dd/MM/yyyy" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="av_s_form_bottom">
                            <asp:Button ID="btncancel" runat="server" Text="Clear" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" />
                            <asp:Button ID="btnsubmit" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="btnview_Click" ValidationGroup="vg" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <asp:Panel ID="grid" runat="server">
                <div class="av_s_card">
                    <div class="av_s_card_head">Level Income Details</div>
                    <div class="av_s_card_body">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView2" OnPageIndexChanging="GridView2_PageIndexChanging" runat="server" ShowFooter="true" PageSize="50" AllowPaging="true" AutoGenerateColumns="false"
                                class="table table-bordered"
                                GridLines="None">
                                <FooterStyle Font-Bold="true" />
                                <HeaderStyle />
                                <EmptyDataTemplate>
                                    No Data Found!!..
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="S.NO" Visible="false">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex +1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
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
                                    <asp:TemplateField HeaderText="User Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_refcode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_rfrname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="CommissionAmount">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_pvalue" runat="server" Text='<%#Eval("CreditRs","{0:n2}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Level">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_level" runat="server" Text='<%#Eval("Level") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Date">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_date" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
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
</asp:Content>
