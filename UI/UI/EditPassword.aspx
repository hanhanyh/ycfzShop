<%@ Page Title="" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="EditPassword.aspx.cs" Inherits="UI.EditPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>修改密码</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-hover table-responsive  table-bordered" style="margin-top:60px;">
        <tr>
            <td>
                输入原密码：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtOriPwD" type="password" ></asp:TextBox>
            </td>
            </tr>
          <tr>
             <td>
                输入新密码：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtNewPwd" type="password"></asp:TextBox>
            </td>
              </tr>
        <tr>
             <td>
                重复新密码：
            </td>
            <td>
                <asp:TextBox runat="server" ID="txtRepPwd" type="password" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button runat="server" ID="btnEditPwd" Text="修改密码" CssClass="btn btn-danger" OnClick="btnEditPwd_Click"/>
            </td>
        </tr>
    </table>
</asp:Content>
