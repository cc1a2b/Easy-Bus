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
                                    Text="إستعلام" OnClick="btnSearch_Click" ValidationGroup="SrchSubmit"></asp:Button>
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
                        <h6><%=(Master as sitemaster_master).UserSetting.rm.GetString("Testimonials",(Master as sitemaster_master).UserSetting.ci) %></h6>
                        <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("Our Guests Love Us",(Master as sitemaster_master).UserSetting.ci) %></h2>
                    </div>
                    <!-- Testimonial Slide -->
                    <div class="testimonial-slides owl-carousel mb-100">

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>“This can be achieved by applying search engine optimization or popularly known as SEO. This is a marketing strategy which increases the quality and quantity of traffic flow to a particular website via search engines.”</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Robert Downey <span>- CEO Deercreative</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Necessitatibus delectus facilis molestias, error vitae praesentium quos eaque qui ea, tempore blanditiis sint reprehenderit, quaerat. Commodi ab architecto sit suscipit exercitationem!”</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Akash Downey <span>- CEO Deercreative</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Dolor, ex quos. Alias a rem maiores, possimus dicta sit distinctio quis iusto!”</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Downey Sarah <span>- CEO Deercreative</span></h6>
                            </div>
                        </div>

                        <!-- Single Testimonial Slide -->
                        <div class="single-testimonial-slide">
                            <h5>“Lorem ipsum dolor sit amet, consectetur adipisicing elit. Labore sequi laboriosam fugit suscipit aspernatur, minima minus voluptatum, id ab atque similique ex earum. Magni.”</h5>
                            <div class="rating-title">
                                <div class="rating">
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                    <i class="icon_star"></i>
                                </div>
                                <h6>Robert Brown <span>- CEO Deercreative</span></h6>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Testimonials Area End -->

 <%--   <!-- Service Area Start -->
    <div class="roberto-service-area">
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
