<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="userList.aspx.cs" Inherits="Station.admin.users.userList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Users",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12">
            <div class="card">
                <div class="header">
                    <a class="btn btn-info" href="../../admin/users/userModify.aspx">
                        <%=(Master as adminmaster_master).UserSetting.rm.GetString("Add New",(Master as adminmaster_master).UserSetting.ci) %>
                    </a>
                </div>
                <div class="content table-responsive table-full-width">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("FullName",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Mobile",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Email",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("UserName",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Manage",(Master as adminmaster_master).UserSetting.ci) %></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("FullName") %></td>
                                        <td><%# Eval("UserMobile") %></td>
                                        <td><%# Eval("UserEmail") %></td>
                                        <td><%# Eval("UserName") %></td>
                                        <td>
                                            <asp:HyperLink runat="server" CssClass="btn btn-primary" NavigateUrl='<%#String.Format("~/admin/users/userModify.aspx?userId={0}", Eval("Id")) %>'>
                                                <%=(Master as adminmaster_master).UserSetting.rm.GetString("Update",(Master as adminmaster_master).UserSetting.ci) %>
                                            </asp:HyperLink>
                                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id") %>' OnClick="btnDelete_Click">
                                                <%=(Master as adminmaster_master).UserSetting.rm.GetString("Delete",(Master as adminmaster_master).UserSetting.ci) %>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:ListView>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
