<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Station.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/all.css' />
    <link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.2.0/css/fontawesome.css' />
    <link rel="stylesheet" href="<%= ResolveUrl("~") %>siteAssets/login/style.css" />
    <link href="<%= ResolveUrl("~") %>adminAssets/css/bootstrap.min.css" rel="stylesheet" />
</head>
<body>    
    <form id="form1" runat="server" defaultbutton="btnLogin">
        <!-- partial:index.partial.html -->
        <div class="container">
            <div class="screen">
                <div class="screen__content">
                    <div class="login">
                        <div id="DivAlert" runat="server" visible="false" class="alert alert-danger">
                            <asp:Label ID="AlertMsg" runat="server" Text="GHGHGH" />
                        </div>

                        <div class="login__field">
                            <i class="login__icon fas fa-user"></i>
                            <asp:TextBox ID="txtUser" runat="server" type="text" class="login__input" placeholder="User name / Mobile" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtUser" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <div class="login__field">
                            <i class="login__icon fas fa-lock"></i>
                            <asp:TextBox ID="txtPassword" runat="server" type="password" class="login__input" placeholder="Password" />
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" ErrorMessage="مطلوب *" CssClass="FieldValidator" ValidationGroup="VgSubmit"></asp:RequiredFieldValidator>
                        </div>
                        <asp:LinkButton ID="btnLogin" runat="server" class="button login__submit" OnClick="btnLogin_Click" ValidationGroup="VgSubmit">
                            <span class="button__text">Log In</span>
                            <i class="button__icon fas fa-chevron-right"></i>
                        </asp:LinkButton>
                    </div>
                    <div class="social-login">
                        <%--<h3>log in via</h3>--%>
                        <div class="social-icons">
                            <a href="../../site/index.aspx" class="fa fa-home">Home</a><i> llllllll</i>
                            <a href="../../register.aspx" class="fa fa-lock">Register</a>
                            <%--<a href="#" class="social-login__icon fab fa-instagram"></a>
                            <a href="#" class="social-login__icon fab fa-facebook"></a>
                            <a href="#" class="social-login__icon fab fa-twitter"></a>--%>
                        </div>
                    </div>
                </div>
                <div class="screen__background">
                    <span class="screen__background__shape screen__background__shape4"></span>
                    <span class="screen__background__shape screen__background__shape3"></span>
                    <span class="screen__background__shape screen__background__shape2"></span>
                    <span class="screen__background__shape screen__background__shape1"></span>
                </div>
            </div>
        </div>
        <!-- partial -->
        </form>
    </script>
</body>
</html>
