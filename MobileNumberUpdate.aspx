<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="MobileNumberUpdate.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.MobileNumberUpdate" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Mobile Number Update</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <asp:Label ID="lbluid" runat="server" Visible="false"></asp:Label>
                                    <asp:Label ID="lblmbl" runat="server" Visible="false"></asp:Label>
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">User Code</label>
                                    <div class="col-md-8">
                                        <asp:TextBox ID="txtcode" Text="SSA" runat="server" autocomplete="off" class="form-control" OnTextChanged="NameOnTextChanged" AutoPostBack="true"></asp:TextBox>
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
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">User Name</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtname" runat="server" autocomplete="off" class="form-control" ReadOnly="true"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtname" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Mobile Number</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtmbl" runat="server" autocomplete="off" MaxLength="10" class="form-control"></asp:TextBox>
                                        <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtmbl" FilterType="Numbers"></asp:FilteredTextBoxExtender>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtmbl" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">
                        <asp:Button ID="btncancel" runat="server" OnClick="btncancel_Click" class="av_s_form_btn av_s_btn_red" Text="Cancel" />
                        <asp:Button ID="btnupdate" runat="server" class="av_s_form_btn av_s_btn_grn" ValidationGroup="vg" Text="Update" OnClick="btnupdate_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
