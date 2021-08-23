<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BalancePrint.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.BalancePrint" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body onload="print();">
    <form id="form1" runat="server">
        <div>
            <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                    GridLines="None" class="table table-bordered" ShowFooter="true" Width="100%">
                    <EmptyDataTemplate>
                        No Data Found!!..
                    </EmptyDataTemplate>
                    <Columns>
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
                        <asp:TemplateField HeaderText="User Code ">
                            <ItemTemplate>
                                <asp:Label ID="lbl_usercode" runat="server" Text='<%#Eval("UserCode") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="User Name">
                            <ItemTemplate>
                                <asp:Label ID="lbl_customername" runat="server" Text='<%#Eval("UserName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Balance">
                            <ItemTemplate>
                                <asp:Label ID="lbl_directcount" runat="server" Text='<%#Eval("Balance","{0:n2}") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CountMember">
                            <ItemTemplate>
                                <asp:Label ID="lbl_RoiSelf" runat="server" Text='<%#Eval("CountTotal") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--   <asp:TemplateField HeaderText="Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_RoiGroup" runat="server" Text='<%#Eval("Level","{0:n2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Topup Roi">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_Level" runat="server" Text='<%#Eval("TopupRoi","{0:n2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Topup Level">
                                                <ItemTemplate>
                                                    <asp:Label ID="lbl_TRoiSelf" runat="server" Text='<%#Eval("TopupLevel","{0:n2}") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>    --%>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>
