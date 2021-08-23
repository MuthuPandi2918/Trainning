<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Seenu_Sport_Academy.Admin.Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server"></asp:ToolkitScriptManager>
    <asp:Label ID="LblSUserId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="LblSId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="LblReferralId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="LblUserId" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblprice" runat="server" Text="" Visible="false"></asp:Label>
    <asp:Label ID="lblusercode" runat="server" Text="" Visible="false"></asp:Label>
    <div class="row">
        <div class="col-md-12">
            <div class="av_s_card">
                <asp:Label ID="lblid" runat="server" Visible="false"></asp:Label>
                <asp:Label ID="Label2" runat="server"></asp:Label>
                <div class="av_s_card_head">Registration</div>
                <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                    <ContentTemplate>
                        <div class="av_s_card_body">
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12 pull-right ">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl"></label>
                                            <div class="col-md-8">                                                
                                                <asp:TextBox ID="TextBox1" Text="SSA" autocomplete="off" runat="server" Visible="false"></asp:TextBox>
                                            </div>
                                            <div class="av_s_frm_vld"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12 pull-right ">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">CustomerCode</label>
                                            <div class="col-md-8">                                                
                                                <asp:TextBox ID="TxtSearchCode" Text="SSA" Height="39" autocomplete="off" runat="server"></asp:TextBox>
                                                <asp:Button ID="BtnSearch" OnClick="BtnSearch_Click" ValidationGroup="vg1" runat="server" class="btn btn-info" Text="Search" />
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                                    ControlToValidate="TxtSearchCode" ErrorMessage="*" ValidationGroup="Vg1"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Name</label>
                                            <div class="col-md-8">                                               
                                                <asp:TextBox ID="txtuname" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtuname" ErrorMessage="*"
                                                    ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div id="adv" runat="server">
                                            <div class="row">
                                                <label class="col-md-4 label-control av_s_frm_inlne_lbl">Referal Code</label>
                                                <div class="col-md-8">                                                   
                                                    <asp:TextBox ID="txtrcode" Text="SSA" autocomplete="off" runat="server"
                                                        class="form-control" OnTextChanged="ReferelOnTextChanged" AutoPostBack="true"></asp:TextBox>
                                                </div>
                                                <div class="av_s_frm_vld">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtrcode" InitialValue="SSA" ErrorMessage="*"
                                                        ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Referal Name</label>
                                            <div class="col-md-8">                                               
                                                <asp:TextBox ID="txtrname" autocomplete="off" runat="server"
                                                    class="form-control" AutoPostBack="true" ReadOnly="true"></asp:TextBox>
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtrname" ErrorMessage="*"
                                                    ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Gender</label>
                                            <div class="col-md-8">                                              
                                                <asp:RadioButtonList ID="radio" runat="server" RepeatDirection="Horizontal">
                                                    <asp:ListItem Text="Male"></asp:ListItem>
                                                    <asp:ListItem Text="FeMale"></asp:ListItem>
                                                </asp:RadioButtonList>
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="radio" ErrorMessage="*"
                                                    ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">DOB</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="TxtDob" runat="server" autocomplete="off" class="form-control"></asp:TextBox>
                                                <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TxtDob"
                                                    Format="dd/MM/yyyy">
                                                </asp:CalendarExtender>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Address</label>
                                            <div class="col-md-8">
                                                <asp:TextBox ID="txtadd" runat="server" autocomplete="off" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div id="edit" runat="server">
                                        <div class="form-group">
                                            <div class="row">
                                                <label class="col-md-4 label-control av_s_frm_inlne_lbl">State</label>
                                                <div class="col-md-8">
                                                    <asp:DropDownList ID="ddlstate" runat="server" class="form-control" autocomplete="off" OnSelectedIndexChanged="OnStateSelectedIndexChanged" AutoPostBack="true">
                                                    </asp:DropDownList>
                                                </div>
                                                <div class="av_s_frm_vld">
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlstate" InitialValue="Select" ErrorMessage="*"
                                                        ValidationGroup="vg"></asp:RequiredFieldValidator>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">District</label>
                                            <div class="col-md-8">
                                                <asp:DropDownList ID="ddldistrict" runat="server" class="form-control">
                                                </asp:DropDownList>
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ddldistrict" InitialValue="Select" ErrorMessage="*"
                                                    ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Contact Number</label>
                                            <div class="col-md-8">                                              
                                                <asp:TextBox ID="txtconact" autocomplete="off" runat="server" MaxLength="10" class="form-control"></asp:TextBox>
                                                <asp:FilteredTextBoxExtender ID="FilteredTextBoxExtender1" runat="server" TargetControlID="txtconact" FilterType="Numbers"></asp:FilteredTextBoxExtender>
                                            </div>
                                            <div class="av_s_frm_vld">
                                                <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="txtconact" ErrorMessage="*"
                                                    ValidationGroup="vg"></asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Email</label>
                                            <div class="col-md-8">                                               
                                                <asp:TextBox ID="txtmail" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Nominee </label>
                                            <div class="col-md-8">                                            
                                                <asp:TextBox ID="txtnname" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">RelationShip </label>
                                            <div class="col-md-8">                                               
                                                <asp:TextBox ID="txtrelation" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Bank Name</label>
                                            <div class="col-md-8">                                                
                                                <asp:TextBox ID="txtbankname" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>                              
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Account Number</label>
                                            <div class="col-md-8">                                              
                                                <asp:TextBox ID="txtac" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">IFSC Code</label>
                                            <div class="col-md-8">                                                
                                                <asp:TextBox ID="txtifsc" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 col-sm-6 col-xs-12">
                                    <div class="form-group">
                                        <div class="row">
                                            <label class="col-md-4 label-control av_s_frm_inlne_lbl">Pan Number</label>
                                            <div class="col-md-8">                                                
                                                <asp:TextBox ID="txtpanno" autocomplete="off" runat="server" class="form-control"></asp:TextBox>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="av_s_form_bottom">                               
                                <asp:Button ID="Btnclear" runat="server" Text="Cancel" class="av_s_form_btn av_s_btn_red" OnClick="Btnclear_Click" />
                                <asp:Button ID="Btnsubmit" runat="server" Text="Submit" class="av_s_form_btn av_s_btn_grn" OnClick="Btnsubmit_Click" ValidationGroup="vg" />
                                <asp:Button ID="Btnupdate" runat="server" Text="Update" class="av_s_form_btn av_s_btn_orange" OnClick="Btnupdate_Click" ValidationGroup="ABCD" />
                            </div>
                        </div>
                    </ContentTemplate>
                    <Triggers>
                        <asp:PostBackTrigger ControlID="Btnsubmit" />
                        <asp:PostBackTrigger ControlID="BtnSearch" />
                    </Triggers>
                </asp:UpdatePanel>
            </div>
        </div>
        <div class="col-md-12">
            <div class="av_s_card">
                <div class="av_s_card_head">Registration Details</div>
                <div class="av_s_card_body">
                    <div class="table table-responsive">
                        <div class="table table-bordered table-hover table-responsive-lg av_mrgn_btm_0">
                            <asp:GridView ID="GridView1" runat="server" ShowFooter="false" PageSize="50" AllowPaging="true" class="table table-bordered"
                                OnPageIndexChanging="GridView1_PageIndexChanging" AutoGenerateColumns="false">
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
                                            <asp:Label ID="lbl_name" runat="server" Text='<%#Eval ("UserName") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lbl_customercode" runat="server" Text='<%#Eval ("UserCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Advisor Details">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_advisor_name" runat="server" Text='<%#Eval ("ReferalName") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lbl_advisor_code" runat="server" Text='<%#Eval ("ReferalCode") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Login Details">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_lcode" runat="server" Text='<%#Eval ("UserCode") %>'></asp:Label>
                                            <br />
                                            <asp:Label ID="lbl_password" runat="server" Text='<%#Eval ("Password") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>                                   
                                    <asp:TemplateField HeaderText="DOJ" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_doj" runat="server" Text='<%#Eval ("Timestamp","{0:dd/MM/yyyy}") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Address">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_address" runat="server" Text='<%#Eval ("Address") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="State" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_state" runat="server" Text='<%#Eval ("StateName") %>'></asp:Label>
                                            <asp:Label ID="lblstateId" runat="server" Text='<%#Eval ("StateId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="District" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_dist" runat="server" Text='<%#Eval ("DistrictName") %>'></asp:Label>
                                            <asp:Label ID="lbldistId" runat="server" Text='<%#Eval ("DistrictId") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Taluk" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_taluk" runat="server" Text='<%#Eval ("TalukName") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Dob" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_Dob" runat="server" Text='<%#Eval ("Dob") %>'></asp:Label>
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
                                    <asp:TemplateField HeaderText="Contact Number" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_contact" runat="server" Text='<%#Eval ("ContactNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Relationship" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_relation" runat="server" Text='<%#Eval ("Relationship") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Gender" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lblGender" runat="server" Text='<%#Eval ("Gender") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Bank Details">
                                        <ItemTemplate>
                                            <asp:Label ID="lbl_bankname" runat="server" Text='<%#Eval ("BankName") %>'></asp:Label>&nbsp;<br />                                            
                                            <asp:Label ID="lbl_accountno" runat="server" Text='<%#Eval ("AccountNumber") %>'></asp:Label>&nbsp;<br />
                                            <asp:Label ID="lbl_ifsc" runat="server" Text='<%#Eval ("IfscCode") %>'></asp:Label>&nbsp;<br />
                                            <asp:Label ID="lbl_panno" runat="server" Text='<%#Eval ("PanNumber") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" Edit">
                                        <ItemTemplate>                                           
                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Edit_Click" class="av_s_tbl_edit_ico av_s_tbl_grn" data-toggle="White" data-original-title="Edit"><i class="ft-edit-2"></i></asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText=" Delete">
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
    </div>   
</asp:Content>
