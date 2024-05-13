<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="userModify.aspx.cs" Inherits="Station.admin.users.userModify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Modification",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-12 col-md-7">
            <div class="card">
                <div class="header">
                    <h4 class="title"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Modification",(Master as adminmaster_master).UserSetting.ci) %></h4>
                </div>
                <div class="content">
                    <div>
                        <div class="row">
                            <div class="col-md-5">
                                <div class="form-group">
                                    <label><%=(Master as adminmaster_master).UserSetting.rm.GetString("FullName",(Master as adminmaster_master).UserSetting.ci) %></label>
                                    <asp:TextBox ID="txtName" runat="server" type="text" class="form-control border-input" placeholder="الاسم كامل"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" ForeColor="Red" ErrorMessage="مطلوب *" ValidationGroup="vgSubmit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="form-group">
                                    <label><%=(Master as adminmaster_master).UserSetting.rm.GetString("Mobile",(Master as adminmaster_master).UserSetting.ci) %></label>
                                    <asp:TextBox ID="txtMobile" runat="server" type="number" class="form-control border-input" placeholder="الجوال"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label><%=(Master as adminmaster_master).UserSetting.rm.GetString("Email",(Master as adminmaster_master).UserSetting.ci) %></label>
                                    <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control border-input" placeholder="Email"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><%=(Master as adminmaster_master).UserSetting.rm.GetString("UserName",(Master as adminmaster_master).UserSetting.ci) %></label>
                                    <asp:TextBox ID="txtUserName" runat="server" type="text" class="form-control border-input" placeholder="إسم المستخدم"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtUserName" ForeColor="Red" ErrorMessage="مطلوب *" ValidationGroup="vgSubmit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label><%=(Master as adminmaster_master).UserSetting.rm.GetString("Password",(Master as adminmaster_master).UserSetting.ci) %></label>
                                    <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control border-input" placeholder="إسم المستخدم"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ForeColor="Red" ErrorMessage="مطلوب *" ValidationGroup="vgSubmit"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <div class="text-center">
                            <asp:Button ID="btnSave" runat="server" type="submit" class="btn btn-info btn-fill btn-wd" Text="حفظ"
                                OnClick="btnSave_Click" ValidationGroup="vgSubmit"></asp:Button>
                            <a class="btn btn-danger btn-fill btn-wd" href="../../admin/users/userList.aspx">
                                <%=(Master as adminmaster_master).UserSetting.rm.GetString("Close",(Master as adminmaster_master).UserSetting.ci) %>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
