<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CommissionPost.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.CommissionPost" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Label ID="lbldate" runat="server" Visible="false"></asp:Label>
      <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Post Commission</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">From Date</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>                                      
                                        <asp:TextBox ID="txtfromdate" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                    <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="txtfromdate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtfromdate" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">To Date</label>
                                    <div class="col-md-8">
                                        <%--<input type="text" class="form-control" placeholder="name">--%>

                                        <asp:TextBox ID="txttodate" runat="server" class="form-control"  autocomplete="off"></asp:TextBox>
                                           <asp:CalendarExtender ID="CalendarExtender2" runat="server" TargetControlID="txttodate" Format="dd/MM/yyyy"></asp:CalendarExtender>
                                    </div>
                                    <div class="av_s_frm_vld">
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txttodate" ErrorMessage="*" ValidationGroup="vg">
                                        </asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                 </div>
                     <div class="col-md-12 col-sm-6 col-xs-12">
                         
                            <div class="form-group">
                                <div class="row">      
                                     
                                   <label class="col-md-4 label-control av_s_frm_inlne_lbl"></label>
                                     <h3 style="color:darkred"> &nbsp;&nbsp;<asp:Label ID="lblamt" runat="server"></asp:Label></h3><br />
                                    <div class="col-md-8">                                  
                                        <%--<input type="text" class="form-control" placeholder="name">--%>                                        
                                         <asp:Button ID="btnsubmit" runat="server" Text="Post Commission" class="av_s_form_btn av_s_btn_grn" align="Right"
                                        OnClientClick="return confirm('Are You Sure want to Post Commission Amount..?')" OnClick="btnsubmit_Click" ValidationGroup="vg" />
                                       
                                         </div>                   
                                </div>
                            </div>
                        </div>               
                       
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Commission Details</div>
                <div class="av_s_card_body">
                    <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                          <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100" AllowPaging="true"
                                        AutoGenerateColumns="false" GridLines="None" class="table table-bordered">
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

                                            <asp:TemplateField HeaderText="User Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commission Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcredit" runat="server" Text='<%#Eval("CreditRS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsts" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>                     

                    </div>
                </div>
            </div>

        </div>

    </div>








    <%--  <div class="page-content">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="content-area card">
                        <div class="card-innr card-innr-fix">
                            <div class="card-head">
                                <h6 class="card-title">Payment Master</h6>
                            </div>

                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">From Date</label>
                                <div class="col-lg-7">
                                    <asp:TextBox ID="txtfromdate" runat="server" autocomplete="off" class="input-bordered"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender5" runat="server" TargetControlID="txtfromdate" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>

                                   
                                    
                                                <div class="valid2">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="txtfromdate" ErrorMessage="*"
                                                        ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>
                                </div>
                            </div>
                            <div class="row mb-2">
                                <label class="col-lg-5" for="username">To Date</label>
                                <div class="col-lg-7">

                                    <asp:TextBox ID="txttodate" runat="server" autocomplete="off" class="input-bordered"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender ID="CalendarExtender3" runat="server" TargetControlID="txttodate" Format="dd/MM/yyyy"></ajaxToolkit:CalendarExtender>
                                    
                                                <div class="valid2">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txttodate" ErrorMessage="*"
                                                        ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>

                                </div>
                            </div>

                            <div class="row mb-2">
                                <h3 style="color: white">Rs. &nbsp;<asp:Label ID="lblamt" runat="server"></asp:Label></h3>

                                <label class="col-lg-5" for="username"></label>
                                <div class="col-lg-7">

                                    <asp:Button ID="btnsubmit" runat="server" Text="Post Commission" class="btn btn-success"
                                        OnClientClick="return confirm('Are You Sure want to Post Commission Amount..?')" OnClick="btnsubmit_Click" ValidationGroup="vg" />


                                </div>
                            </div>



                        </div>
                    </div>
                </div>
                <div class="col-xl-12 col-lg-12 ">
                    <div class="token-transaction card card-full-height">
                        <div class="card-innr">
                            <div class="bt-n card-head has-aside">
                                <h4 class="card-title">Primary Wallet Details</h4>
                            </div>
                            <table class="table table-bordered">
                                <thead class="bg-primary text-white">
                                    <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="100" AllowPaging="true"
                                        AutoGenerateColumns="false" GridLines="None" class="table table-bordered">
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

                                            <asp:TemplateField HeaderText="User Name">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbldname" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="User Code">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Commission Amount">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblcredit" runat="server" Text='<%#Eval("CreditRS") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Status">
                                                <ItemTemplate>
                                                    <asp:Label ID="lblsts" runat="server" Text='<%#Eval("Status") %>'></asp:Label>
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
    </div>--%>


</asp:Content>
