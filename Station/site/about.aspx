<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="about.aspx.cs" Inherits="Station.site.about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as sitemaster_master).UserSetting.rm.GetString("About Us",(Master as sitemaster_master).UserSetting.ci) %>
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
                        <h2 class="page-title"><%=(Master as sitemaster_master).UserSetting.rm.GetString("About Us",(Master as sitemaster_master).UserSetting.ci) %></h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../../site/index.aspx"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Home",(Master as sitemaster_master).UserSetting.ci) %></a></li>
                                <li class="breadcrumb-item active" aria-current="page"><%=(Master as sitemaster_master).UserSetting.rm.GetString("About Us",(Master as sitemaster_master).UserSetting.ci) %></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- About Us Area Start -->
    <section class="roberto-about-us-area section-padding-100-0">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-lg-6">
                    <div class="about-thumbnail pr-lg-5 mb-100 wow fadeInUp" data-wow-delay="100ms">
                        <img src="<%= ResolveUrl("~") %>siteAssets/img/bg-img/bus1.jpg" alt="">
                    </div>
                </div>
                <div class="col-12 col-lg-6">
                    <h2>Easybus-Developers</h2>
                        <h6>We are working to help the community in developing the mobility service within cities, which helps in the progress of the country and to provide a service that helps people.</h6>
                    <!-- Section Heading 
                    <div class="section-heading wow fadeInUp" data-wow-delay="300ms">
                        <h6>Testimonials</h6>
                        <h2 id="lblParagTitle" runat="server"></h2>
                    </div>
                    <div class="about-content mb-100 wow fadeInUp" data-wow-delay="500ms">
                        <p id="lblParagraph" runat="server"></p>
                        <%--<img src="<%= ResolveUrl("~") %>siteAssets/img/core-img/signature.png" alt="">--%>
                        <img id="imgAbout" runat="server" src="" alt="">
                    </div>-->
                </div>
            </div>
        </div>
    </section>
    <!-- About Us Area End -->

    <!-- Service Area Start -->
    <section class="roberto-service-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <!-- Section Heading -->
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h6><%=(Master as sitemaster_master).UserSetting.rm.GetString("Ultimate Solutions",(Master as sitemaster_master).UserSetting.ci) %></h6>
                        <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("Our Fleet",(Master as sitemaster_master).UserSetting.ci) %></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <asp:ListView ID="lvData" runat="server">
                    <ItemTemplate>
                        <!-- Single Service Area -->
                        <div class="col-12 col-md-6 col-lg-4">
                            <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                                <%--<img src="<%= ResolveUrl("~") %>siteAssets/img/bg-img/bus1.jpg" alt="">--%>
                                <img src='<%# "../../uploads/vehicles/"+ Eval("VehicleImage") %>' style="max-width: 350px; max-height: 230px;" alt="">
                                <div class="service-title d-flex align-items-center justify-content-center">
                                    <h5><%# Eval("VehicleType")+" "+Eval("VehicleModel") %></h5>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:ListView>

                <%--<div class="col-12 col-md-6 col-lg-4">
                    <div class="single-service-area mb-100 wow fadeInUp" data-wow-delay="500ms">
                        <img src="<%= ResolveUrl("~") %>siteAssets/img/bg-img/bus3.jpg" alt="">
                        <div class="service-title d-flex align-items-center justify-content-center">
                            <h5>Spa &amp; Fitness</h5>
                        </div>
                    </div>
                </div>--%>
            </div>
        </div>
    </section>
    <!-- Service Area End -->
</asp:Content>
