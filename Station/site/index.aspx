<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Station.site.index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as sitemaster_master).UserSetting.rm.GetString("Home",(Master as sitemaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area bg-img bg-overlay jarallax" style="background-image: url(../../siteAssets/img/bg-img/1.jpg);">
        <div class="container h-100">
            <div class="row h-100 align-items-center">
                <div class="col-12">
                    <div class="breadcrumb-content text-center">
                        <h2 class="page-title">EASY BUS</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <%--<li class="breadcrumb-item"><a href="../../site/index.aspx">Home</a></li>--%>
                                <li class="breadcrumb-item active" aria-current="page"><%=(Master as sitemaster_master).UserSetting.rm.GetString("YOUR BSET TRAVEL EXPERINCE",(Master as sitemaster_master).UserSetting.ci) %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- About Area Start -->
    <section class="roberto-about-area section-padding-100-0" runat="server" visible="true">
        <!-- Hotel Search Form Area -->
        <div class="hotel-search-form-area" style="padding: 0;">
            <div class="container-fluid">
                <div class="hotel-search-form">
                    <div action="#" method="post">
                        <div class="row justify-content-between align-items-end">
                            <div class="col-md-9">
                                <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Booking Ref.",(Master as sitemaster_master).UserSetting.ci) %></label>
                                <asp:TextBox ID="txtBookingRef" runat="server" class="form-control" Style="margin-bottom: 15px;" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtBookingRef" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="SrchSubmit"></asp:RequiredFieldValidator>
                            </div>
                            <div class="col-md-3">
                                <asp:Button ID="btnSearch" runat="server" type="submit" class="form-control btn roberto-btn"
                                    Text="Search" OnClick="btnSearch_Click" ValidationGroup="SrchSubmit"></asp:Button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-12">
                                <div id="DivAlert" runat="server" visible="false" class="alert alert-success">
                                    <asp:Label ID="AlertMsg" runat="server" Text="GHGHGH" />
                                </div>
                            </div>
                        </div>
                        <div id="DivBooking" runat="server" class="row" visible="false">
                            <div class="col-md-3">
                                <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Passenger",(Master as sitemaster_master).UserSetting.ci) %></label>
                                <br />
                                <hr />
                                <label id="lblPassenger" runat="server" class="label-Control"></label>
                            </div>
                            <div class="col-md-3">
                                <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Destination",(Master as sitemaster_master).UserSetting.ci) %></label>
                                <br />
                                <hr />
                                <label id="lblDistination" runat="server" class="label-Control"></label>
                            </div>
                            <div class="col-md-3">
                                <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Date",(Master as sitemaster_master).UserSetting.ci) %></label>
                                <br />
                                <hr />
                                <label id="lblDate" runat="server" class="label-Control"></label>
                            </div>
                            <div class="col-md-3">
                                <label class="label-Control"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Time",(Master as sitemaster_master).UserSetting.ci) %></label>
                                <br />
                                <hr />
                                <label id="lblTime" runat="server" class="label-Control"></label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- About Area End -->

    <!-- Testimonials Area Start -->
    <section class="roberto-testimonials-area section-padding-100-0" dir="ltr">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <div class="testimonial-thumbnail owl-carousel mb-100">
                        <img src="<%= ResolveUrl("~") %>siteAssets/img/bg-img/fleet2.jpe" alt="">
                        <img src="<%= ResolveUrl("~") %>siteAssets/img/bg-img/ReisePortal.jpg" alt="">
                    </div>
                </div>

                <div class="col-12 col-md-6">
                    <!-- Section Heading -->
                    <div class="section-heading">
                         <h6>Testimonials of team project</h6>
                        <h2>Developers Comments</h2>

                    </div>
                    <!-- Testimonial Slide -->
                    <div class="testimonial-slides owl-carousel mb-100">

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>We have created this site based on the needs of the community. Instead of wasting time searching for a trip from one service provider to another, we created a site that facilitates the matter by displaying trips from different carriers and displaying their times and prices as well as trip prices. You can compare and choose the trip from the appropriate service provider - we wish you a happy trip </h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Hussain Alsharman <span>- Student at Najran University</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>We work at Easybus with passion in order to provide a means of transportation and schedule suitable trips between the service provider and the customers. With the available technology in our hands, we have made every effort to reach an application with high efficiency to ensure comfort for the beneficiaries of the service, safety and effort for customers through many unique features.</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Mahdi Algaid <span>- Student at Najran University</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>Our goal in creating the application was to provide a service to the community and develop the region to reach the goals of our country 2030, which help in the progress of the country and provide a service that helps people to move through the application that we created</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Mohammed Algadrah<span>- Student at Najran University</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>This program offers us a lot of services and the ability to benefit from the service provided through the application, and this is a new and different thing and a fruitful experience through which we can book flights, track them and benefit from its service at any time and in a good technical way.</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Abdurahman Albahri <span>- Student at Najran University</span></h6>
                            </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials Area End -->

    <!-- Service Area Start -->
 <%--   <div class="roberto-service-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="service-content d-flex align-items-center justify-content-between">
                        <!-- Single Service Area -->
                        <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="100ms">
                            <img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/icon-1.png" alt="">
                            <h5>Transportion</h5>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="300ms">
                            <img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/icon-2.png" alt="">
                            <h5>Reiseservice</h5>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="500ms">
                            <img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/icon-3.png" alt="">
                            <h5>Spa Relaxtion</h5>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="700ms">
                            <img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/icon-4.png" alt="">
                            <h5>Restaurant</h5>
                        </div>

                        <!-- Single Service Area -->
                        <div class="single-service--area mb-100 wow fadeInUp" data-wow-delay="900ms">
                            <img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/icon-1.png" alt="">
                            <h5>Bar &amp; Drink</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Service Area End -->
--%>



</asp:Content>
