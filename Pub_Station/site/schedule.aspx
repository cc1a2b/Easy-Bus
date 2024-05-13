<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="Station.site.schedule" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
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
                        <h2 class="page-title">جدول الرحلات</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../../site/index.aspx">الرئيسية</a></li>
                                <li class="breadcrumb-item active" aria-current="page">جدول الرحلات</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Breadcrumb Area End -->

    <!-- Blog Area Start -->
    <section class="roberto-blog-area section-padding-100-0">
        <div class="container">
            <div class="row">
                <!-- Section Heading -->
                <div class="col-12">
                    <div class="section-heading text-center wow fadeInUp" data-wow-delay="100ms">
                        <h2>جدول الرحلات</h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <!-- Single Post Area -->
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="single-post-area mb-100 wow fadeInUp" data-wow-delay="300ms">
                        <p class="post-title">الفيصلية_العريسة</p>
                        <p class="post-title">السبت 2022-10-15</p>
                        <p class="post-title">10.35 am</p>
                        <p class="post-title">45 ريال</p>
                        <a href="../../site/booking.aspx" class="btn roberto-btn mt-15">احجز الان</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Blog Area End -->

</asp:Content>
