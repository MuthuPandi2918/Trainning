<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="HolidayMaster.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.HolidayMaster" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <ajaxToolkit:ToolkitScriptManager runat="server"></ajaxToolkit:ToolkitScriptManager>


     <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Holiday Master</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Date</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>
                                        <asp:TextBox ID="txtdate" runat="server" placeholder="Date" class="form-control" autocomplete="off"></asp:TextBox>
                                          <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txtdate" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtdate" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Description</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>

                                        <asp:TextBox ID="txtdesc" runat="server" class="form-control"  autocomplete="off"></asp:TextBox>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtdesc" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="av_s_form_bottom">


                        <%--  <a class="av_s_form_btn av_s_btn_grn" href="#">Done</a>  
                  <a class="av_s_form_btn av_s_btn_orange" href="#">Done</a> --%>
                        <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="av_s_form_btn av_s_btn_grn" OnClick="btnsubmit_Click" ValidationGroup="vg" />
                        <asp:Button ID="btnupdate" runat="server" class="av_s_form_btn av_s_btn_orange" Text="Update" OnClick="btnupdate_Click" />

                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />
                    </div>

                </div>
            </div>
        </div>
         

        <div class="col-md-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Holiday Details</div>
                <div class="av_s_card_body">
                    <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">

                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" class="table table-bordered" >
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
                                                    <asp:Label ID="lblid" runat="server" Text='<%#Eval("Id") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Date">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldate" runat="server" Text='<%#Eval("Date") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Description">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldesc" runat="server" Text='<%#Eval("Description") %>'></asp:Label>
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
