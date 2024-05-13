<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Station.site.booking" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as sitemaster_master).UserSetting.rm.GetString("Booking",(Master as sitemaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
        
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(../../siteAssets/img/bg-img/1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcrumb-content text-center">
                        <h2 class="page-title"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Booking",(Master as sitemaster_master).UserSetting.ci) %></h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../../site/index.aspx"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Home",(Master as sitemaster_master).UserSetting.ci) %></a></li>
                                <li class="breadcrumb-item active" aria-current="page"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Booking",(Master as sitemaster_master).UserSetting.ci) %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Contact Form Area Start -->
    <div class="roberto-contact-form-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <%--<h6>Contact Us</h6>--%>
                        <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("Search",(Master as sitemaster_master).UserSetting.ci) %></h2>
                        <div id="DivAlert" runat="server" visible="false" class="alert alert-success">
                            <asp:Label ID="AlertMsg" runat="server" Text="GHGHGH" />
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Hotel Search Form Area -->
                    <div class="hotel-search-form-area" style="padding: 0;">
                        <div class="container-fluid">
                            <div class="hotel-search-form">
                                <div action="#" method="post">
                                    <div class="row justify-content-between align-items-end">
                                        <div class="col-md-3">
                                            <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("From Station",(Master as sitemaster_master).UserSetting.ci) %></label>
                                            <asp:DropDownList ID="ddlFromStation" runat="server" class="form-control" AppendDataBoundItems="true">
                                                <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFromStation" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="SrchSubmit"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("To Station",(Master as sitemaster_master).UserSetting.ci) %></label>
                                            <asp:DropDownList ID="ddlToStation" runat="server" class="form-control" AppendDataBoundItems="true">
                                                <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlToStation" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="SrchSubmit"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="col-md-3">
                                            <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Travel Date",(Master as sitemaster_master).UserSetting.ci) %></label>
                                            <asp:TextBox ID="txtDepartureDate" runat="server" type="date" class="form-control" Style="margin-bottom: 15px;" />
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtDepartureDate" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="SrchSubmit"></asp:RequiredFieldValidator>
                                            <%--<asp:PlaceHolder runat="server">&nbsp;</asp:PlaceHolder>--%>
                                        </div>
                                        <div class="col-md-3">
                                            <asp:Button ID="btnSearch" runat="server" type="submit" class="form-control btn roberto-btn"
                                                Text="بحث الرحلات" OnClick="btnSearch_Click" ValidationGroup="SrchSubmit"></asp:Button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Blog Area Start -->
            <section class="roberto-blog-area section-padding-100-0">
                <div class="container">
                    <div class="row">
                        <!-- Section Heading -->
                        <div class="col-12">
                            <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                                <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("Schedule",(Master as sitemaster_master).UserSetting.ci) %></h2>
                            </div>
                        </div>
                        <asp:ListView ID="lvData" runat="server">
                            <ItemTemplate>
                                <!-- Single Post Area -->
                                <div class="col-12 col-md-6 col-lg-4">
                                    <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                                        <p class="post-title"><%# Eval("FromStation")+"_"+Eval("ToStation") %></p>
                                        <%--<p class="post-title"><%# Eval("TripDay")+" "+Eval("StringDate") %></p>--%>
                                        <p class="post-title"><%# Eval("StringTime") %></p>
                                        <p class="post-title"><%# Eval("TtripCost")+" ريال" %></p>
                                        <asp:LinkButton ID="btnBook" runat="server" class="btn roberto-btn mt-15" CommandArgument='<%# Eval("Id") %>' OnClick="btnBook_Click">
                                            <%=(Master as sitemaster_master).UserSetting.rm.GetString("Book Now",(Master as sitemaster_master).UserSetting.ci) %>
                                        </asp:LinkButton>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </section>
            <!-- Blog Area End -->
        </div>
    </div>
    <!-- Contact Form Area End -->
</asp:Content>
