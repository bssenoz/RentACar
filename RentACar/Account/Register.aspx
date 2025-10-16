<%@ Page Title="<%$ Resources: Resource, Register %>" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RentACar.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceholderID="MainContent">
    <div class="container mt-4">
        <div class="row justify-content-center">
            <div class="col-md-6 col-lg-5">
                <div class="register-section">
                    <h2 class="text-center mb-4">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, Register %>" />
                    </h2>
                    
                    <div class="alert alert-danger mb-3" runat="server" id="ErrorMessage" visible="false">
                        <asp:Literal runat="server" ID="FailureText" />
                    </div>

                    <asp:ValidationSummary runat="server" CssClass="alert alert-danger mb-3" />
                    
                    <form>
                        <div class="form-group mb-3">
                            <asp:Label runat="server" AssociatedControlID="Name" CssClass="form-label">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Name %>" />
                            </asp:Label>
                            <asp:TextBox runat="server" ID="Name" CssClass="form-control" placeholder="<%$ Resources: Resource, NamePlaceholder %>" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Name"
                                CssClass="text-danger small" ErrorMessage="<%$ Resources: Resource, NameRequired %>" />
                        </div>

                        <div class="form-group mb-3">
                            <asp:Label runat="server" AssociatedControlID="Surname" CssClass="form-label">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Surname %>" />
                            </asp:Label>
                            <asp:TextBox runat="server" ID="Surname" CssClass="form-control" placeholder="<%$ Resources: Resource, SurnamePlaceholder %>" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Surname"
                                CssClass="text-danger small" ErrorMessage="<%$ Resources: Resource, SurnameRequired %>" />
                        </div>
                        
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

                        <div class="form-group mb-4">
                            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="form-label">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, ConfirmPassword %>" />
                            </asp:Label>
                            <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="<%$ Resources: Resource, ConfirmPasswordPlaceholder %>" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger small" Display="Dynamic" ErrorMessage="<%$ Resources: Resource, ConfirmPasswordRequired %>" />
                            <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                                CssClass="text-danger small" Display="Dynamic" ErrorMessage="<%$ Resources: Resource, PasswordMismatch %>" />
                        </div>

                     <div class="d-grid mb-3">
                            <asp:Button runat="server" OnClick="CreateUser_Click" Text="<%$ Resources: Resource, Register %>" CssClass="btn btn-primary btn-lg" />
                     </div>
                    </form>

                    <div class="text-center">
                        <p class="mb-0">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, AlreadyHaveAccount %>" /> 
                            <asp:HyperLink runat="server" NavigateUrl="~/Account/Login" CssClass="text-decoration-none fw-semibold">
                                <asp:Literal runat="server" Text="<%$ Resources: Resource, Login %>" />
                            </asp:HyperLink>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .register-section {
            background: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border: 1px solid #e9ecef;
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
        
        @media (max-width: 768px) {
            .register-section {
                padding: 1.5rem;
                margin: 0 1rem;
            }
        }
        
        @media (max-width: 576px) {
            .container {
                padding: 0;
            }
            
            .register-section {
                padding: 1rem;
                margin: 0 0.5rem;
                box-shadow: none;
                border: none;
            }
            
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</asp:Content>
