<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AdminLevelReport.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.AdminLevelReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Level Report</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">UserCode</label>
                                    <div class="col-md-8">                                       
                                        <asp:TextBox ID="txtCusCode" Text="SSA" runat="server" autocomplete="off" class="form-control"
                                            OnTextChanged="txtCusCode_TextChanged" AutoPostBack="true"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCusCode" ErrorMessage="*" ValidationGroup="vg">
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
                                        <asp:TextBox ID="txtCusName" runat="server" class="form-control" ReadOnly="true" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtCusName" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                     
                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="Cancel_Click" Text="Cancel" />
                        <asp:Button ID="View" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="View_Click" ValidationGroup="vg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div id="grid" runat="server" visible="false">
                <div class="av_s_card">
                    <div class="av_s_card_head">Level Wise Report :
                        <asp:Label ID="lbllevelcode" runat="server" ForeColor="RoyalBlue"></asp:Label></div>
                    <div class="av_s_card_body">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"
                                class="table table-bordered" GridLines="None">
                                <EmptyDataTemplate>
                                    <center>No Data Found!!!..</center>
                                </EmptyDataTemplate>
                                <Columns>                                   
                                    <asp:TemplateField HeaderText="SNO">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluser_id" runat="server" Text='<%#Eval("customer_id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label1" runat="server" Text='<%#Eval("sno") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_intorducercode" runat="server" Text='<%#Eval("customer_code") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_customername" runat="server" Text='<%#Eval("customer_name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="DOJ">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_doj" runat="server" Text='<%#Eval("date_of_join","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                   
                                    <asp:TemplateField HeaderText="Referal Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_advid" runat="server" Text='<%#Eval("introducer_id") %>' Visible="false"></asp:Label>
                                            <asp:Label ID="Label4" runat="server" Text='<%#Eval("introducer_code") %>'></asp:Label>
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
