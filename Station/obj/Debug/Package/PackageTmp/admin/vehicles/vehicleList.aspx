<%@ Page Title="" Language="C#" MasterPageFile="~/adminMaster.Master" AutoEventWireup="true" CodeBehind="vehicleList.aspx.cs" Inherits="Station.admin.vehicles.vehicleList" %>

<%@ Register Src="~/admin/vehicles/vehicleUserControl.ascx" TagPrefix="uc" TagName="vehicle" %>

<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
    <%=(Master as adminmaster_master).UserSetting.rm.GetString("Vehicles",(Master as adminmaster_master).UserSetting.ci) %>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div class="row">
        <div class="col-md-12">
            <uc:vehicle ID="settingControl" runat="server" />
            <div class="card">
                <div class="header">
                    <h5><%=(Master as adminmaster_master).UserSetting.rm.GetString("Vehicles",(Master as adminmaster_master).UserSetting.ci) %></h5>
                    <asp:LinkButton ID="btnAddNew" runat="server" CssClass="btn btn-Info" OnClick="btnAddNew_Click">
                        <%=(Master as adminmaster_master).UserSetting.rm.GetString("Add New",(Master as adminmaster_master).UserSetting.ci) %>
                    </asp:LinkButton>
                </div>
                <div class="content table-responsive table-full-width">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Plate Number",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Vehicle Type",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Model",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Color",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Seats Count",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Photo",(Master as adminmaster_master).UserSetting.ci) %></td>
                                <td><%=(Master as adminmaster_master).UserSetting.rm.GetString("Manage",(Master as adminmaster_master).UserSetting.ci) %></td>
                            </tr>
                        </thead>
                        <tbody>
                            <asp:ListView ID="lvData" runat="server">
                                <ItemTemplate>
                                    <tr>
                                        <td><%# Eval("VehiclePlate") %></td>
                                        <td><%# Eval("VehicleType") %></td>
                                        <td><%# Eval("VehicleModel") %></td>
                                        <td><%# Eval("VehicleColor") %></td>
                                        <td><%# Eval("SeatCount") %></td>
                                        <td>
                                            <img src='<%# "../../uploads/vehicles/"+ Eval("VehicleImage") %>' style="width: 100px; height: 80px;">
                                        </td>
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
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Vehicle Type",(Master as adminmaster_master).UserSetting.ci) %> (*)</label>
                                        <asp:DropDownList ID="ddlType" runat="server" class="form-control" AppendDataBoundItems="true">
                                            <asp:ListItem Value="-1">...إختر...</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ddlType" InitialValue="-1" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Plate Number",(Master as adminmaster_master).UserSetting.ci) %> (*)</label>
                                        <asp:TextBox ID="txtPlateNo" runat="server" class="form-control" placeholder="رقم اللوحة" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPlateNo" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Model",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtModel" runat="server" class="form-control" placeholder="الموديل" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Serial No.",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtSerial" runat="server" class="form-control" placeholder="رقم التسلسلي" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Color",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtColor" runat="server" class="form-control" placeholder="اللون" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                    <div class="col-lg-4">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Seats Count",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:TextBox ID="txtSeatCount" runat="server" class="form-control" placeholder="عدد المقاعد" autofocus="on" AutoCompleteType="Disabled"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-6">
                                        <label class="control-label"><%=(Master as adminmaster_master).UserSetting.rm.GetString("Photo",(Master as adminmaster_master).UserSetting.ci) %></label>
                                        <asp:FileUpload ID="fileUplaod1" runat="server" class="form-control" placeholder="الصورة"></asp:FileUpload>
                                        <div class="fileupload-new thumbnail" style="width: 200px; height: 150px;">
                                            <asp:Image ID="ProdImg" runat="server" />
                                        </div>
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
