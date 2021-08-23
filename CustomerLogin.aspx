<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="CustomerLogin.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.CustomerLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script type="text/javascript">
        function SetTarget() {
            document.forms[0].target = "_blank";
        }
    </script>
    <div class="row">
        <div class="col-md-6 col-sm-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Customer Login</div>
                <div class="av_s_card_body">
                    <div class="row">
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Customer Code</label>
                                    <div class="col-md-8">                                      
                                        <asp:TextBox ID="txtcode" Text="SSA" runat="server" autocomplete="off" CssClass="form-control" OnTextChanged="Customer_OnTextChanged"
                                            AutoPostBack="true"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-12 col-sm-6 col-xs-12">
                            <div class="form-group">
                                <div class="row">
                                    <label class="col-md-4 label-control av_s_frm_inlne_lbl">Customer Name</label>
                                    <div class="col-md-8">                                       
                                        <asp:TextBox ID="txtname" runat="server" autocomplete="off" class="form-control"
                                            ReadOnly="true" ForeColor="Black"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="av_s_form_bottom">                       
                        <asp:Button ID="btncancel" runat="server" class="av_s_form_btn av_s_btn_red" OnClick="btncancel_Click" Text="Cancel" />
                        <asp:Button ID="btnsearch" runat="server" Text="View" class="av_s_form_btn av_s_btn_grn" OnClick="btnsearch_Click" ValidationGroup="vg" />                        
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-12">
            <div id="Trans" runat="server">
                <div class="av_s_card">
                    <div class="av_s_card_head">Customer Login Details</div>
                    <div class="av_s_card_body">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView1" runat="server" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="50" AllowPaging="true" AutoGenerateColumns="False" HeaderStyle-HorizontalAlign="Center"
                                GridLines="None" class="table table-bordered" OnRowCommand="GridView1_RowCommand">
                                <EmptyDataTemplate>
                                    No Data Found!!..
                                </EmptyDataTemplate>
                                <Columns>
                                    <asp:TemplateField HeaderText="SNO" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbluser_id" runat="server" Text='<%#Eval("UserId") %>' Visible="false"></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="SNO">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Code">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_intorducercode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User Name">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_customername" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact Number">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_mbl" runat="server" Text='<%#Eval("ContactNumber") %>'></asp:Label><br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Login Details">
                                        <ItemTemplate>
                                            UserCode&nbsp;:&nbsp;&nbsp<asp:Label ID="lbl_logcode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label><br />
                                            Password &nbsp;:&nbsp;&nbsp<asp:Label ID="lbl_pwd" runat="server" Text='<%#Eval("Password") %>'></asp:Label><br />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="TimeStamp" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_timestamp" runat="server" Text='<%#Eval("Timestamp") %>'></asp:Label><br />
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
</asp:Content>
