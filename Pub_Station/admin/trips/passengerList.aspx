<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="passengerList.aspx.cs" Inherits="Station.admin.trips.passengerList" %>

<%@ Register Src="~/admin/trips/tripUserControl.ascx" TagPrefix="uc" TagName="trip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Passengers",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12">
            <uc:trip ID="settingControl" runat="server" />
            <div class="card">
                <div class="header">
                    <h5><%=(Master as adminmaster_master).UserSetting.rm.GetString("Passengers",(Master as adminmaster_master).UserSetting.ci) %></h5>
                </div>
                <div class="content table-responsive table-full-width">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Passenger",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("ID Number",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Mobile",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Email",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Manage",(Master as adminmaster_master).UserSetting.ci) %></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("PassengerName") %></td>
                                        <td><%# Eval("PassengerIdNum") %></td>
                                        <td><%# Eval("PassengerMobile") %></td>
                                        <td><%# Eval("PassengerEmail") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger" CommandArgument='<%# Eval("Id") %>'
                                                OnClick="btnDelete_Click" OnClientClick="return confirm('هل تريد تأكيد حذف السجل');">
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
