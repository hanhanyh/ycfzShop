<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="UserCenter.aspx.cs" Inherits="UI.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>用户中心</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-hover table-bordered table-responsive" style="margin-top:60px;">
        <tr>
            <td>用户名：</td>
            <td> <asp:Label runat="server" Text=""  ID="labName"></asp:Label></td>
        </tr>
         <tr>
            <td>昵称：</td>
            <td> <asp:Label runat="server" Text=""  ID="labNick"></asp:Label></td>
        </tr>
        <tr>
            <td>性别：</td>
            <td><asp:Label runat="server" Text=""  ID="labSex"></asp:Label></td>
        </tr>
        <tr>
            <td>QQ：</td>
            <td><asp:Label runat="server" Text=""  ID="labQQ"></asp:Label></td>
        </tr>
        <tr>
           <td>手机号码：</td>
            <td><asp:Label runat="server" Text=""  ID="labPhone"></asp:Label></td>
        </tr>
        <tr>
            <td>注册时间：</td>
            <td><asp:Label runat="server" Text=""  ID="labRegTime"></asp:Label></td>
        </tr>
    </table>
</asp:Content>
