<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Station.register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>register</title>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>siteAssets/login/style.css" />
    <link href="<%= ResolveUrl("~") %>adminAssets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server" defaultbutton="btnRegister">
        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="screen">
                <div class="screen__content">
                    <div class="login" style="padding-top: 15px;">
                        <div id="DivAlert" runat="server" visible="false" class="alert alert-danger">
                            <asp:Label ID="AlertMsg" runat="server" Text="GHGHGH" />
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <asp:TextBox ID="txtName" runat="server" type="text" class="login__input" placeholder="Full Name" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtName" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <asp:TextBox ID="txtID" runat="server" type="text" class="login__input" placeholder="ID Number" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="txtID" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <asp:TextBox ID="txtMobile" runat="server" type="text" class="login__input" placeholder="Mobile" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtMobile" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <asp:TextBox ID="txtEmail" runat="server" type="text" class="login__input" placeholder="Email" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-lock"></i>
                            <asp:TextBox ID="txtPassword" runat="server" type="password" class="login__input" placeholder="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtPassword" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <asp:LinkButton ID="btnRegister" runat="server" class="button login__submit" 
                            OnClick="btnRegister_Click" ValidationGroup="VgSubmit">
                            <span class="button__text">Register</span>
                            <i class="button__icon fas fa-chevron-right"></i>
                        </asp:LinkButton>
                    </div>
                    <div class="social-login">
                        <%--<h3>log in via</h3>--%>
                        <div class="social-icons">
                            <a href="../../site/index.aspx" class="fa fa-home">Home</a><i>llllllll</i>
                            <a href="../../login.aspx" class="fa fa-lock">Login</a>
                            <%--<a href="#" class="social-login__icon fab fa-instagram"></a>
                            <a href="#" class="social-login__icon fab fa-facebook"></a>
                            <a href="#" class="social-login__icon fab fa-twitter"></a>--%>
                        </div>
                    </div>
                </div>
                <div class="screen__background" style="background-color:Window;">
                    <%--<span class="screen__background__shape screen__background__shape4"></span>--%>
                    <%--<span class="screen__background__shape screen__background__shape3"></span>--%>
                    <%--<span class="screen__background__shape screen__background__shape2"></span>--%>
                    <%--<span class="screen__background__shape screen__background__shape1"></span>--%>
                </div>
            </div>
        </div>
        <!-- partial -->
    </form>
</body>
</html>
