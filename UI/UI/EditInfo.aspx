<%@ Page Title="修改用户信息" Language="C#" MasterPageFile="~/UserCenter.Master" AutoEventWireup="true" CodeBehind="EditInfo.aspx.cs" Inherits="UI.EditInfo" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>修改用户信息</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <table class="table table-hover table-bordered table-responsive" style="margin-top:60px;">
        <tr>
            <td><label>用户名：</label></td>
            <td> <asp:Label runat="server" Text=""  ID="labName"></asp:Label></td>
        </tr>
         <tr>
            <td><label>昵称：</label></td>
            <td> <asp:TextBox runat="server" Text=""  CssClass="input-sm" ID="labNick"></asp:TextBox></td>
        </tr>
          <tr>
              <td>
               <label> 性别：</label>
              </td>
              <td>
                  <asp:DropDownList runat="server"  ID="ddlsex">
                      <asp:ListItem Text="女"></asp:ListItem>
                      <asp:ListItem Text="男"></asp:ListItem>
                      
                  </asp:DropDownList>
              </td>
          </tr>
       
        <tr>
            <td><label>QQ：</label></td>
            <td><asp:TextBox runat="server" Text=""  CssClass="input-sm" ID="labQQ"></asp:TextBox></td>
        </tr>
        <tr>
           <td><label>手机号码：</label></td>
            <td><asp:TextBox runat="server" Text="" CssClass="input-sm"  ID="labPhone"></asp:TextBox></td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button ID="btnUpdate" runat="server" Text="修改"  CssClass="btn btn-warning" OnClick="btnUpdate_Click" />
            </td>
        </tr>
    </table>
</asp:Content>
