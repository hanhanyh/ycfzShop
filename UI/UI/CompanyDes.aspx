<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="CompanyDes.aspx.cs" Inherits="UI.CompanyDes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>关于我们公司</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="width:1000px;margin:0 auto;margin-bottom:50px;margin-top:50px;">
        <%=_des %>
    </div>
</asp:Content>
