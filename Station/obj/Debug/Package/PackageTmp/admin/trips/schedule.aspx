<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="schedule.aspx.cs" Inherits="Station.admin.trips.schedule" %>

<%@ Register Src="~/admin/trips/tripUserControl.ascx" TagPrefix="uc" TagName="trip" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Schedule",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12">
            <uc:trip ID="settingControl" runat="server" />
            <div class="card">
                <div class="header">
                    <h5><%=(Master as adminmaster_master).UserSetting.rm.GetString("Schedule",(Master as adminmaster_master).UserSetting.ci) %></h5>
                    <asp:LinkButton ID="btnAddNew" runat="server" CssClass="btn btn-Info" OnClick="btnAddNew_Click">تسجيل جديد</asp:LinkButton>
                </div>
                <div class="content table-responsive table-full-width">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Destination",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Time",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Price",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Status",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Manage",(Master as adminmaster_master).UserSetting.ci) %></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("FromStation")+"_"+Eval("ToStation") %></td>
                                        <td><%# Eval("StringTime") %></td>
                                        <td><%# Eval("TtripCost")+" ريال" %></td>
                                        <td><%# Eval("TripStatus") %></td>
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
                                    <div class="col-lg-6">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("From Station",(Master as adminmaster_master).UserSetting.ci) %> (*)</label>
                                        <asp:DropDownList ID="ddlFromStation" runat="server" class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlFromStation" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-6">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("To Station",(Master as adminmaster_master).UserSetting.ci) %> (*)</label>
                                        <asp:DropDownList ID="ddlToStation" runat="server" class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ddlToStation" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Time",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtTime" runat="server" class="form-control" placeholder="الوقت" TextMode="Time" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtTime" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Price",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtPrice" runat="server" class="form-control" placeholder="السعر" TextMode="Number" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtPrice" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <%--<div class="col-lg-4">
                                        <label class="control-label">الحالة</label>
                                        <asp:DropDownList ID="ddlStatus" runat="server" class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="ddlStatus" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>--%>
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
