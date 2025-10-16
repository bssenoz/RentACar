<%@ Page Title="RentACar - Home" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RentACar._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-lg-8 text-center">
                <h1 class="display-4 mb-4">
                    <asp:Literal runat="server" Text="<%$ Resources: Resource, WelcomeTitle %>" />
                </h1>
                <p class="lead mb-5">
                    <asp:Literal runat="server" Text="<%$ Resources: Resource, WelcomeDescription %>" />
                </p>

                <div class="d-grid gap-3 d-md-flex justify-content-md-center mb-5">
                    <a href="Account/Login" class="btn btn-primary btn-lg px-4">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, Login %>" />
                    </a>
                    <a href="Account/Register" class="btn btn-outline-primary btn-lg px-4">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, Register %>" />
                    </a>
                </div>
            </div>
        </div>

        <div class="row mt-5">
            <div class="col-md-6 mb-4">
                <div class="card h-100 shadow-sm border-1 hover-shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, CreateRequest %>" />
                        </h5>
                        <p class="card-text">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, CreateRequestDescription %>" />
                        </p>
                    </div>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="card h-100 shadow-sm border-1 hover-shadow">
                    <div class="card-body text-center">
                        <h5 class="card-title">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, ViewRequests %>" />
                        </h5>
                        <p class="card-text">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, ViewRequestsDescription %>" />
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <style>
        .hover-shadow {
            transition: transform 0.2s ease, box-shadow 0.2s ease;
        }

        .hover-shadow:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }
    </style>

</asp:Content>
