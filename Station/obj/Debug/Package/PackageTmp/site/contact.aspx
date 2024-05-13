<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="Station.site.contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as sitemaster_master).UserSetting.rm.GetString("Contact Us",(Master as sitemaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <!-- Breadcrumb Area Start -->
    <div class="breadcrumb-area contact-breadcrumb bg-img bg-overlay jarallax" style="background-image: url(../../siteAssets/img/bg-img/1.jpg);">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content text-center mt-100">
                        <h2 class="page-title"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Contact Us",(Master as sitemaster_master).UserSetting.ci) %></h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../../site/index.aspx"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Home",(Master as sitemaster_master).UserSetting.ci) %></a></li>
                                <li class="breadcrumb-item active" aria-current="page"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Contact Us",(Master as sitemaster_master).UserSetting.ci) %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Google Maps & Contact Info Area Start -->
    <section class="google-maps-contact-info">
        <div class="container-fluid">
            <div class="google-maps-contact-content">
                <div class="row">
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Mobile",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p><%= (Master as sitemaster_master).companyInfo.CompanyMobile %></p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-map-marker" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Address",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p><%= (Master as sitemaster_master).companyInfo.CompanyAddress %></p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-clock-o" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Open Time",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p>10:00 am to 23:00 pm</p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Email",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p><%= (Master as sitemaster_master).companyInfo.CompanyEmail %></p>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
    <!-- Google Maps & Contact Info Area End -->

    <!-- Contact Form Area Start -->
    <div class="roberto-contact-form-area section-padding-100">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h6><%=(Master as sitemaster_master).UserSetting.rm.GetString("Contact Us",(Master as sitemaster_master).UserSetting.ci) %></h6>
                        <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("Leave Message",(Master as sitemaster_master).UserSetting.ci) %></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-6">
                    <!-- Form -->
                    <div class="roberto-contact-form">
                        <div action="#" method="post">
                            <div class="row">
                                <div class="col-12 col-lg-6 wow fadeInUp" data-wow-delay="100ms">
                                    <input type="text" name="message-name" class="form-control mb-30" placeholder="Your Name">
                                </div>
                                <div class="col-12 col-lg-6 wow fadeInUp" data-wow-delay="100ms">
                                    <input type="email" name="message-email" class="form-control mb-30" placeholder="Your Email">
                                </div>
                                <div class="col-12 wow fadeInUp" data-wow-delay="100ms">
                                    <textarea name="message" class="form-control mb-30" placeholder="Your Message"></textarea>
                                </div>
                                <div class="col-12 text-center wow fadeInUp" data-wow-delay="100ms">
                                    <button type="submit" class="btn roberto-btn mt-15"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Send Message",(Master as sitemaster_master).UserSetting.ci) %></button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Google Map Section -->
                <div class="col-lg-6">
                    <div class="contact-map">
                        <span id="loc_Latitude" style="display: none;"><%= (Master as sitemaster_master).companyInfo.Latitude %></span>
                        <sapn id="loc_Longitude" style="display: none;"><%= (Master as sitemaster_master).companyInfo.Longitude %></sapn>
                        <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyBhDfFvTabUD_K1Ev2ujmYuYnmM4WBdMDo"></script>
                        <div id="map_div" style="height: 400px;"></div>
                    </div>
                </div>
                <!-- End Google Map Section -->
            </div>
        </div>
    </div>
    <!-- Contact Form Area End -->

    <script src="<%= ResolveUrl("~")%>siteAssets/js/jsCompLocation.js"></script>

</asp:Content>
