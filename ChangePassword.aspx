<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.ChangePassword" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
     <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Change Password</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Current Password</label>
                                    <div class="col-md-8">                                      
                                        <asp:TextBox ID="txtoldpwd" runat="server"  class="form-control" autocomplete="off" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtoldpwd" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">New Password</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtnewpassword" runat="server" class="form-control"  autocomplete="off" TextMode="Password"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewpassword" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                         <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Confirm Password</label>
                                    <div class="col-md-8">                                       
                                        <asp:TextBox ID="txtconfirm" runat="server" class="form-control"  autocomplete="off" TextMode="Password"></asp:TextBox>
                                         <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtconfirm" ControlToCompare="txtnewpassword"></asp:CompareValidator>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtconfirm" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                      
                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="av_s_form_btn av_s_btn_grn" OnClick="btnchange_Click" ValidationGroup="vg" />                        
                    </div>
                </div>
            </div>
        </div>    
    </div>
</asp:Content>
