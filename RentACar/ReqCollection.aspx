<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReqCollection.aspx.cs" Inherits="RentACar.ReqCollection" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="RentACar.Models" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceholderID="MainContent">

    <div class="container mt-4">
        <div class="row">
            <div class="col-md-6">
                <h2 class="mb-4">
                    <asp:Literal runat="server" Text="<%$ Resources: Resource, ReqCollection %>" />
                </h2>
                
                <asp:ValidationSummary runat="server" CssClass="alert alert-danger mb-4" />

                <!-- Başlangıç Tarihi -->
                <div class="form-group mb-3">
                    <asp:Label runat="server" AssociatedControlID="StartDate" CssClass="form-label">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, StartDate_Label %>" />
                    </asp:Label>
                    <asp:TextBox runat="server" ID="StartDate" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="StartDate" ErrorMessage="<%$ Resources: Resource, StartDateRequired %>" CssClass="text-danger small" />
                </div>

                <!-- Bitiş Tarihi -->
                <div class="form-group mb-3">
                    <asp:Label runat="server" AssociatedControlID="EndDate" CssClass="form-label">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, EndDate_Label %>" />
                    </asp:Label>
                    <asp:TextBox runat="server" ID="EndDate" CssClass="form-control" TextMode="Date" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EndDate" ErrorMessage="<%$ Resources: Resource, EndDateRequired %>" CssClass="text-danger small" />
                </div>

                <!-- Araç Tipi -->
                <div class="form-group mb-3">
                    <asp:Label runat="server" AssociatedControlID="CarType" CssClass="form-label">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, CarType_Label %>" />
                    </asp:Label>
                    <asp:DropDownList runat="server" ID="CarType" CssClass="form-select" AutoPostBack="true" OnSelectedIndexChanged="CarType_SelectedIndexChanged">
                        <asp:ListItem Text="<%$ Resources: Resource, SelectCarType %>" Value="" />
                        <asp:ListItem Text="Sedan" Value="Sedan" />
                        <asp:ListItem Text="SUV" Value="SUV" />
                    </asp:DropDownList>
                </div>

                <!-- Araç Modeli -->
                <div class="form-group mb-4">
                    <asp:Label runat="server" AssociatedControlID="CarModel" CssClass="form-label">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, CarModel_Label %>" />
                    </asp:Label>
                    <asp:DropDownList runat="server" ID="CarModel" CssClass="form-select">
                        <asp:ListItem Text="<%$ Resources: Resource, SelectCarModel %>" Value="" />
                    </asp:DropDownList>
                </div>

                <!-- Butonlar -->
                <div class="form-actions">
                    <asp:Button runat="server" ID="SaveButton" Text="<%$ Resources: Resource, Save %>" CssClass="btn btn-primary me-2" OnClick="SaveButton_Click" />
                    <a href="/ListCollection.aspx" class="btn btn-outline-secondary">
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, List%>" />
                    </a>
                </div>
            </div>
            
            <div class="col-md-6">
                <!-- Sağ taraf boş kalabilir veya bilgi eklenebilir -->
            </div>
        </div>
    </div>

    <style>
        .form-label {
            font-weight: 600;
            color: #495057;
            margin-bottom: 0.5rem;
            display: block;
        }
        
        .form-control, .form-select {
            border: 1px solid #ced4da;
            border-radius: 6px;
            padding: 0.75rem;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }
        
        .form-control:focus, .form-select:focus {
            border-color: #86b7fe;
            outline: 0;
            box-shadow: 0 0 0 0.25rem rgba(13, 110, 253, 0.25);
        }
        
        .form-actions {
            margin-top: 1rem;
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.15s ease-in-out;
        }
        
        .btn:hover {
            transform: translateY(-1px);
        }
        
        .alert {
            border-radius: 6px;
            border: none;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .col-md-6:last-child {
                display: none;
            }
            
            .form-actions {
                display: flex;
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .btn {
                width: 100%;
            }
            
            .me-2 {
                margin-right: 0 !important;
            }
        }
        
        @media (max-width: 576px) {
            .container {
                padding: 0 1rem;
            }
            
            h2 {
                font-size: 1.5rem;
            }
        }
    </style>

</asp:Content>