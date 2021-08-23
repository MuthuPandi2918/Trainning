<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="DistrictMaster.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.DistrictMaster" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">District Master</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">State </label>
                                    <div class="col-md-8">                                       
                                        <asp:DropDownList ID="ddlstate" class="form-control" runat="server">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlstate" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">District Name</label>
                                    <div class="col-md-8">                                     
                                        <asp:TextBox ID="txtdname" runat="server" class="form-control" placeholder="District Name" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdname" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">District Code</label>
                                    <div class="col-md-8">                                        
                                        <asp:TextBox ID="txtcode" runat="server" class="form-control" placeholder="District Code" autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="txtcode" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                 
                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />
                        <asp:Button ID="btnupdate" runat="server" class="av_s_form_btn av_s_btn_orange" Text="Update" OnClick="btnupdate_Click" />
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="av_s_form_btn av_s_btn_grn" OnClick="btnsubmit_Click" ValidationGroup="vg" />
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div class="av_s_card">
                <div class="av_s_card_head">District Details</div>
                <div class="av_s_card_body">
                    <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                        <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="true" PageSize="50" AutoGenerateColumns="false" class="table table-bordered">
                            <HeaderStyle />
                            <RowStyle />
                            <EmptyDataTemplate>
                                No Data Bound...!
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:TemplateField HeaderText="S.No">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="ID" Visible="false">
                                    <ItemTemplate>
                                        <asp:Label ID="lblid" runat="server" Text='<%#Eval("DistrictId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="State Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lblsname" runat="server" Text='<%#Eval("StateName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="District Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblcode" runat="server" Text='<%#Eval("DistrictCode") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="District Name">
                                    <ItemTemplate>
                                        <asp:Label ID="lbldname" runat="server" Text='<%#Eval("DistrictName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Edit">
                                    <ItemTemplate>                                        
                                        <asp:LinkButton ID="Edit" runat="server" OnClick="Edit_Click" class="av_s_tbl_edit_ico av_s_tbl_grn" data-toggle="White" data-original-title="Edit"><i class="ft-edit-2"></i></asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Delete">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="Delete" runat="server" OnClientClick="return confirm('Are You Sure want to Delete Product Details?..')" OnClick="Delete_Click" class="av_s_tbl_edit_ico av_s_tbl_red" data-toggle="White" data-original-title="Close"><i class="ft-trash-2" aria-hidden="true"></i></i></asp:LinkButton>                                       
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>  
</asp:Content>
