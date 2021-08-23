<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerDetails.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.CustomerDetails" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">User Details</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserCode</label>
                                    <asp:Label ID="lblPId" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblUId" runat="server" Visible="false"></asp:Label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtucode" Text="SSA" runat="server" class="form-control" autocomplete="off"
                                            OnTextChanged="UserCodeOnTextChanged" AutoPostBack="true"></asp:TextBox>
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
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserName</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtuname" runat="server" autocomplete="off" class="form-control" ReadOnly="true" ForeColor="Black"></asp:TextBox>
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
                                        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfromdate" Format="dd/MM/yyyy" />
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
                                        <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txttodate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                       
                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />
                        <asp:LinkButton ID="BtnExport" runat="server" class="av_s_form_btn av_s_btn_orange" OnClick="BtnExport_Click"><i class="fa fa-file-excel-o"></i></asp:LinkButton>
                        <asp:Button ID="btnsubmit" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="btnview_Click" ValidationGroup="vg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div id="grid" runat="server">
                <div class="av_s_card">
                    <div class="av_s_card_head">User Details</div>
                    <div class="av_s_card_body">
                        <div class="table-responsive">
                            <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                                <asp:GridView ID="GridView2" runat="server" ShowFooter="false" PageSize="50" AllowPaging="true"
                                    OnPageIndexChanging="GridView2_PageIndexChanging" AutoGenerateColumns="false" class="table table-bordered" OnRowCommand="GridView2_RowCommand">
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
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_id" runat="server" Text='<%#Eval ("UserId") %>'></asp:Label>
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
                                        <asp:TemplateField HeaderText="DOJ" ItemStyle-Width="100px">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_doj" runat="server" Text='<%#Eval ("Timestamp") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_address" runat="server" Text='<%#Eval ("Address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Age" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_age" runat="server" Text='<%#Eval ("Age") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nominee Name" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_nomname" runat="server" Text='<%#Eval ("NomineeName") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Nominee Age" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_nomnage" runat="server" Text='<%#Eval ("NomineeAge") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact Number">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_contact" runat="server" Text='<%#Eval ("ContactNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Relationship" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_relation" runat="server" Text='<%#Eval ("Relationship") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password" Visible="false">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_pwd" runat="server" Text='<%#Eval ("Password") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>                                      
                                        <asp:TemplateField HeaderText="Advisor Details">
                                            <ItemTemplate>
                                                Name:<asp:Label ID="lbl_advisor_name" runat="server" Text='<%#Eval ("AdvisorName") %>'></asp:Label>
                                                <br />
                                                Code:<asp:Label ID="lbl_advisor_code" runat="server" Text='<%#Eval ("AdvisorCode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Bank Details">
                                            <ItemTemplate>
                                                Bank :<asp:Label ID="lbl_bankname" runat="server" Text='<%#Eval ("BankName") %>'></asp:Label>
                                                <br />
                                                Branch :<asp:Label ID="lbl_bankbranch" runat="server" Text='<%#Eval ("BranchName") %>'></asp:Label>
                                                <br />
                                                A/c No :<asp:Label ID="lbl_accountno" runat="server" Text='<%#Eval ("AccountNumber") %>'></asp:Label>
                                                <br />
                                                IFSC :
                                                                <asp:Label ID="lbl_ifsc" runat="server" Text='<%#Eval ("IfscCode") %>'></asp:Label>
                                                <br />
                                                PanNumber :<asp:Label ID="lbl_panno" runat="server" Text='<%#Eval ("PanNumber") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText=" Login">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="linkbtn" runat="server" Text="Login" Style="color: #fff;" class="av_s_form_btn av_s_btn_grn" CommandName="Login" OnClientClick="SetTarget();"></asp:LinkButton>
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
    </div>
</asp:Content>
