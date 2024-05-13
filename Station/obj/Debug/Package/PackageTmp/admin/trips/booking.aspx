<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="booking.aspx.cs" Inherits="Station.admin.trips.booking" %>

<%@ Register Src="~/admin/trips/tripUserControl.ascx" TagPrefix="uc" TagName="trip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Booking",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12">
            <uc:trip ID="settingControl" runat="server" />
            <div class="card">
                <div class="header">
                    <h5><%=(Master as adminmaster_master).UserSetting.rm.GetString("Booking",(Master as adminmaster_master).UserSetting.ci) %></h5>
                </div>
                <div class="content table-responsive table-full-width">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Booking Ref.",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Passenger",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Mobile",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Destination",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Date",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Time",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Status",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Regsiteration Date",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Manage",(Master as adminmaster_master).UserSetting.ci) %></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("BookingRef") %></td>
                                        <td><%# Eval("PassengerName") %></td>
                                        <td><%# Eval("PassengerMobile") %></td>
                                        <td><%# Eval("FromStation")+"_"+Eval("ToStation") %></td>
                                        <td><%# Eval("TravelDate","{0:yyyy/MM/dd}") %></td>
                                        <td><%# Eval("StringTime") %></td>
                                        <td><%# Convert.ToInt32(Eval("BookStatus")) == 1 ? "مؤكد" : "ملغي" %></td>
                                        <td><%# Eval("RegistDate") %></td>
                                        <td>
                                            <asp:LinkButton ID="btnUpdate" runat="server" CssClass="btn btn-primary" CommandArgument='<%# Eval("Id") %>' OnClick="btnUpdate_Click">
                                                <%=(Master as adminmaster_master).UserSetting.rm.GetString("Update",(Master as adminmaster_master).UserSetting.ci) %>
                                            </asp:LinkButton>
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
    <!--  MODAL -->
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title" id="myModalLabel"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Modification",(Master as adminmaster_master).UserSetting.ci) %></h4>
                        </div>
                        <div class="modal-body">
                            <asp:HiddenField ID="ElementId" runat="server"></asp:HiddenField>
                            <div id="DivAlert" runat="server" visible="true" class="alert">
                                <asp:Label ID="AlertMsg" runat="server" Text="GHGHGH" />
                            </div>
                            <br />
                            <div class="form-horizontal style-form">
                                <div class="form-group">
                                    <div class="col-lg-12">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Status",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                            <asp:ListItem Value="1">تأكيد</asp:ListItem>
                                            <asp:ListItem Value="2">إلغاء</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlStatus" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btnSave" runat="server" class="btn btn-primary" OnClick="btnSave_Click" ValidationGroup="VgSubmit" Text="حفظ" />
                            <button class="btn btn-danger" data-dismiss="modal" type="button"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Close",(Master as adminmaster_master).UserSetting.ci) %></button>
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
