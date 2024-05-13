<%@ Page Title="" Language="C#" MasterPageFile="~/siteMaster.Master" AutoEventWireup="true" CodeBehind="clientProfile.aspx.cs" Inherits="Station.site.clientProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as sitemaster_master).UserSetting.rm.GetString("My Account",(Master as sitemaster_master).UserSetting.ci) %>
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
                        <h2 class="page-title"><%=(Master as sitemaster_master).UserSetting.rm.GetString("My Account",(Master as sitemaster_master).UserSetting.ci) %></h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb justify-content-center">
                                <li class="breadcrumb-item"><a href="../../site/index.aspx"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Home",(Master as sitemaster_master).UserSetting.ci) %></a></li>
                                <li class="breadcrumb-item active" aria-current="page"><%=(Master as sitemaster_master).UserSetting.rm.GetString("My Account",(Master as sitemaster_master).UserSetting.ci) %></li>
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
                            <i class="fa fa-user" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Name",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p id="lblName" runat="server"></p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-phone" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Mobile",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p id="lblMobile" runat="server"></p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-envelope-o" aria-hidden="true"></i>
                            <h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Email",(Master as sitemaster_master).UserSetting.ci) %></h4>
                            <p id="lblEmail" runat="server"></p>
                        </div>
                    </div>
                    <!-- Single Contact Info -->
                    <div class="col-6 col-lg-3">
                        <div class="single-contact-info">
                            <i class="fa fa-edit" aria-hidden="true"></i>
                            <%--<h4><%=(Master as sitemaster_master).UserSetting.rm.GetString("Update Profile",(Master as sitemaster_master).UserSetting.ci) %></h4>--%>
                            <asp:LinkButton ID="btnUpdate" runat="server" type="submit" class="form-control btn roberto-btn" OnClick="btnUpdate_Click">
                                 <%=(Master as sitemaster_master).UserSetting.rm.GetString("Update Profile",(Master as sitemaster_master).UserSetting.ci) %>
                            </asp:LinkButton>
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
                        <h2><%=(Master as sitemaster_master).UserSetting.rm.GetString("My Booking",(Master as sitemaster_master).UserSetting.ci) %></h2>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <!-- Form -->
                    <div class="roberto-contact-form">
                        <div action="#" method="post">
                            <div class="row">
                                <div class="col-12 text-right wow fadeInUp" data-wow-delay="100ms">
                                    <a href="../../site/booking.aspx" class="btn roberto-btn mt-15">
                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("New Booking",(Master as sitemaster_master).UserSetting.ci) %></a>
                                </div>
                                <div class="content table-responsive table-full-width">
                                    <table class="table table-striped">
                                        <asp:GridView ID="lvData" runat="server" class="table table-striped table-advance table-hover table-bordered Grid" OnPageIndexChanging="DataGrid_PageIndexChanging"
                                            AutoGenerateColumns="false" AllowPaging="true" Width="100%" PageSize="5" DataKeyNames="Id">
                                            <Columns>
                                                <asp:TemplateField HeaderText="#">
                                                    <ItemTemplate>
                                                        <%# Container.DataItemIndex + 1 %>
                                                    </ItemTemplate>
                                                    <ItemStyle Width="10px" />
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Booking Ref.",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Eval("BookingRef") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Destination",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Eval("FromStation")+"_"+Eval("ToStation") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Travel Date",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Eval("TravelDate","{0:yyyy/MM/dd}") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Time",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Eval("StringTime") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Status",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Convert.ToInt32(Eval("BookStatus")) == 1 ? "مؤكد" : "ملغي" %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField>
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Regsiteration Date",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:Label runat="server" Text='<%# Eval("RegistDate") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:TemplateField Visible="false">
                                                    <HeaderTemplate>
                                                        <%=(Master as sitemaster_master).UserSetting.rm.GetString("Manage",(Master as sitemaster_master).UserSetting.ci) %>
                                                    </HeaderTemplate>
                                                    <ItemTemplate>
                                                        <asp:LinkButton ID="btnPrint" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="btnPrint_Click">
                                                                 <%=(Master as sitemaster_master).UserSetting.rm.GetString("Print Ticket",(Master as sitemaster_master).UserSetting.ci) %>
                                                        </asp:LinkButton>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                            <PagerSettings Mode="NumericFirstLast" PageButtonCount="5" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />
                                            <PagerStyle HorizontalAlign="Right" CssClass="GridPager" />
                                        </asp:GridView>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Contact Form Area End -->

    <!--  MODAL -->
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Passenger",(Master as sitemaster_master).UserSetting.ci) %></h4>
                        </div>
                        <div class="modal-body">
                            <asp:HiddenField ID="elementId" runat="server"></asp:HiddenField>
                            <div id="Div1" runat="server" visible="false" class="alert">
                                <asp:Label ID="Label1" runat="server" Text="GHGHGH" />
                            </div>
                            <div class="form-horizontal style-form">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <asp:PlaceHolder runat="server"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Name",(Master as sitemaster_master).UserSetting.ci) %></asp:PlaceHolder>
                                        <asp:TextBox ID="txtName" runat="server" type="text" class="form-control" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:PlaceHolder runat="server"><%=(Master as sitemaster_master).UserSetting.rm.GetString("ID Number",(Master as sitemaster_master).UserSetting.ci) %></asp:PlaceHolder>
                                        <asp:TextBox ID="txtID" runat="server" type="number" class="form-control" MaxLength="10" />
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <asp:PlaceHolder runat="server"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Mobile",(Master as sitemaster_master).UserSetting.ci) %></asp:PlaceHolder>
                                        <asp:TextBox ID="txtMobile" runat="server" type="number" class="form-control" MaxLength="10" />
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtMobile" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:PlaceHolder runat="server"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Email",(Master as sitemaster_master).UserSetting.ci) %></asp:PlaceHolder>
                                        <asp:TextBox ID="txtEmail" runat="server" type="email" class="form-control" />
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:PlaceHolder runat="server"><%=(Master as sitemaster_master).UserSetting.rm.GetString("Password",(Master as sitemaster_master).UserSetting.ci) %></asp:PlaceHolder>
                                        <asp:TextBox ID="txtPassword" runat="server" type="password" class="form-control" />
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" class="btn btn-primary"
                                ValidationGroup="VgSubmit" Text="حفظ" OnClick="btnSavePassenger_Click" />
                            <button class="btn btn-danger" data-dismiss="modal" type="button">
                                <%=(Master as sitemaster_master).UserSetting.rm.GetString("Close",(Master as sitemaster_master).UserSetting.ci) %>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </ContentTemplate>
        <Triggers>
            <asp:PostBackTrigger ControlID="btnSave" />
        </Triggers>
    </asp:UpdatePanel>

</asp:Content>
