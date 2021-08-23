<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerWalletBalancePrint.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.CustomerWalletBalancePrint" %>

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
                BorderColor="Black" BorderWidth="2px" Width="100%" class="table table-bordered" ShowFooter="true">
                <FooterStyle Font-Bold="true" />
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
                </Columns>
            </asp:GridView>
                  </div>
        </div>
    </form>
</body>
</html>
