<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Station.admin._default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Home",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-warning text-center">
                                <i class="ti-car"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <p><%=(Master as adminmaster_master).UserSetting.rm.GetString("Fleet",(Master as adminmaster_master).UserSetting.ci) %></p>
                                <asp:Label ID="lblVehicle" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="ti-eye"></i>
                            <a href="../../admin/vehicles/vehicleList.aspx"><%=(Master as adminmaster_master).UserSetting.rm.GetString("View",(Master as adminmaster_master).UserSetting.ci) %></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-info text-center">
                                <i class="ti-calendar"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <p>الرحلات القادمة</p>
                                <asp:Label ID="lblSchedule" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="ti-eye"></i>
                            <a href="../../admin/trips/schedule.aspx">View</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-success text-center">
                                <i class="ti-file"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <p><%=(Master as adminmaster_master).UserSetting.rm.GetString("Booking",(Master as adminmaster_master).UserSetting.ci) %></p>
                                <asp:Label ID="lblBooking" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="ti-eye"></i>
                            <a href="../../admin/trips/booking.aspx"><%=(Master as adminmaster_master).UserSetting.rm.GetString("View",(Master as adminmaster_master).UserSetting.ci) %></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-sm-6">
            <div class="card">
                <div class="content">
                    <div class="row">
                        <div class="col-xs-5">
                            <div class="icon-big icon-danger text-center">
                                <i class="ti-user"></i>
                            </div>
                        </div>
                        <div class="col-xs-7">
                            <div class="numbers">
                                <p><%=(Master as adminmaster_master).UserSetting.rm.GetString("Passengers",(Master as adminmaster_master).UserSetting.ci) %></p>
                                <asp:Label ID="lblPassenger" runat="server"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="footer">
                        <hr />
                        <div class="stats">
                            <i class="ti-eye"></i>
                            <a href="../../admin/trips/passengerList.aspx"><%=(Master as adminmaster_master).UserSetting.rm.GetString("View",(Master as adminmaster_master).UserSetting.ci) %></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
