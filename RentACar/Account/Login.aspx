<%@ Page Title="<%$ Resources: Resource, Login %>" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="RentACar.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="login-section">
                    <h2 class="text-center mb-4">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, Login %>" />
                    </h2>
                    
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <div class="alert alert-danger mb-3">
                            <asp:Literal runat="server" ID="FailureText" />
                        </div>
                    </asp:PlaceHolder>

                    <form>
                        <div class="form-group mb-3">
                            <asp:Label runat="server" AssociatedControlID="Email" CssClass="form-label">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Email %>" />
                            </asp:Label>
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" placeholder="<%$ Resources: Resource, EmailPlaceholder %>" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger small" ErrorMessage="<%$ Resources: Resource, EmailRequired %>" />
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label runat="server" AssociatedControlID="Password" CssClass="form-label">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Password %>" />
                            </asp:Label>
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" placeholder="<%$ Resources: Resource, PasswordPlaceholder %>" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" 
                                CssClass="text-danger small" ErrorMessage="<%$ Resources: Resource, PasswordRequired %>" />
                        </div>

                        <div class="d-grid mb-3">
                            <asp:Button runat="server" OnClick="LogIn" Text="<%$ Resources: Resource, Login %>" CssClass="btn btn-primary btn-lg" />
                        </div>
                    </form>

                    <div class="text-center">
                        <p class="mb-0">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, NoAccount %>" /> 
                            <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled" CssClass="text-decoration-none fw-semibold">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Register %>" />
                            </asp:HyperLink>
                        </p>
                    </div>
                      
                    <section id="socialLoginForm">
                        <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
                    </section>
                </div>
            </div>
        </div>
    </div>

    <style>
        .login-section {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border: 1px solid #e9ecef;
        }
        @media (max-width: 768px) {
            .login-section {
                padding: 1.5rem;
                margin: 0 1rem;
            }
        }
        @media (max-width: 576px) {
            .container {
                padding: 0;
            }
            
            .login-section {
                padding: 1rem;
                margin: 0 0.5rem;
                box-shadow: none;
                border: none;
            }
            
            h2 {
                font-size: 1.5rem;
            }
        }
        
        .form-label {
            font-weight: 500;
            color: #495057;
            margin-bottom: 0.5rem;
        }
        
        .form-control {
            border: 1px solid #ced4da;
            border-radius: 6px;
            padding: 0.75rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .form-control:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        
        .form-control::placeholder {
            color: #6c757d;
            opacity: 1;
        }
        
        .form-check-input {
            margin-top: 0.25rem;
        }
        
        .form-check-label {
            margin-left: 0.5rem;
            color: #495057;
        }
        
        .btn-lg {
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 500;
        }
        
        .alert {
            border-radius: 6px;
            border: none;
        }
        
        .fw-semibold {
            color: #0d6efd;
        }
        
        .fw-semibold:hover {
            color: #0b5ed7;
        }
        
    </style>
</asp:Content>
