<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ListCollection.aspx.cs" Inherits="RentACar.ListCollection" MasterPageFile="~/Site.Master" %>
<%@ Import Namespace="RentACar.Models" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceholderID="MainContent">

    <div class="container mt-4">
        <div class="row">
            <div class="col-12">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h2>
                        <asp:Literal runat="server" Text="<%$ Resources: Resource, ListCollection %>" />
                    </h2>

                    <div class="d-flex gap-2">
                        <asp:Button runat="server" ID="ListButton" Text="<%$ Resources: Resource, RefreshList %>" CssClass="btn btn-outline-primary" OnClick="ListButton_Click" />
                        <a href="/ReqCollection.aspx" class="btn btn-primary">
                            <asp:Literal runat="server" Text="<%$ Resources: Resource, NewRequest %>" />
                        </a>
                    </div>
                </div>

                <div class="table-container">
                    <asp:GridView runat="server" ID="RequestGrid" AutoGenerateColumns="false" CssClass="table table-hover" EmptyDataText="<%$ Resources: Resource, NoRequests %>">
                        <Columns>
                            <asp:BoundField DataField="StartDate" HeaderText="<%$ Resources: Resource, StartDate_Label %>" DataFormatString="{0:dd.MM.yyyy}" />
                            <asp:BoundField DataField="EndDate" HeaderText="<%$ Resources: Resource, EndDate_Label %>" DataFormatString="{0:dd.MM.yyyy}" />
                            <asp:BoundField DataField="CarType" HeaderText="<%$ Resources: Resource, CarType_Label %>" />
                            <asp:BoundField DataField="CarModel" HeaderText="<%$ Resources: Resource, CarModel_Label %>" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <style>
        .table-container {
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            border: 1px solid #e9ecef;
            overflow: hidden;
        }
        
        .table {
            margin-bottom: 0;
        }
        
        .table th {
            background-color: #f8f9fa;
            border-bottom: 2px solid #dee2e6;
            font-weight: 600;
            color: #495057;
            padding: 1rem;
        }
        
        .table td {
            padding: 1rem;
            vertical-align: middle;
            border-bottom: 1px solid #dee2e6;
        }
        
        .table-hover tbody tr:hover {
            background-color: #f8f9fa;
        }
        
        .btn {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-weight: 500;
            transition: all 0.15s ease-in-out;
        }
        
        .btn:hover {
            transform: translateY(-1px);
        }
        
        .gap-2 {
            gap: 0.5rem !important;
        }
        
        @media (max-width: 768px) {
            .container {
                padding: 0 1rem;
            }
            
            .d-flex.justify-content-between {
                flex-direction: column;
                align-items: flex-start !important;
                gap: 1rem;
            }
            
            .d-flex.gap-2 {
                width: 100%;
                justify-content: stretch;
                gap: 0.75rem;
            }
            
            .btn {
                flex: 1;
                padding: 0.75rem 1rem;
                font-size: 0.9rem;
            }
            
            .table-container {
                overflow-x: auto;
                border-radius: 8px;
                margin: 0;
            }
            
            .table {
                min-width: 500px;
                font-size: 0.9rem;
            }
            
            .table th,
            .table td {
                padding: 0.75rem 0.5rem;
                white-space: nowrap;
            }
            
            h2 {
                font-size: 1.5rem;
                margin-bottom: 0;
            }
        }
        
        @media (max-width: 576px) {
            .container {
                padding: 0 0.75rem;
            }
            
            .d-flex.gap-2 {
                flex-direction: column;
                gap: 0.5rem;
            }
            
            .btn {
                width: 100%;
                padding: 0.75rem;
                font-size: 0.85rem;
            }
            
            .table-container {
                margin: 0 -0.75rem;
                border-radius: 0;
                border-left: none;
                border-right: none;
                box-shadow: none;
            }
            
            h2 {
                font-size: 1.25rem;
                text-align: center;
                width: 100%;
            }
            
            .table {
                min-width: 400px;
                font-size: 0.8rem;
            }
            
            .table th,
            .table td {
                padding: 0.5rem 0.25rem;
                font-size: 0.8rem;
            }
            
            .table th {
                font-size: 0.75rem;
                font-weight: 600;
            }
        }
        
        @media (max-width: 400px) {
            .container {
                padding: 0 0.5rem;
            }
            
            .table-container {
                margin: 0 -0.5rem;
            }
            
            .table {
                min-width: 350px;
                font-size: 0.75rem;
            }
            
            .table th,
            .table td {
                padding: 0.4rem 0.2rem;
                font-size: 0.75rem;
            }
            
            .btn {
                padding: 0.6rem;
                font-size: 0.8rem;
            }
        }
        
        .table tbody tr td[colspan] {
            text-align: center;
            padding: 3rem 1rem;
            color: #6c757d;
            font-style: italic;
        }
    </style>

</asp:Content>