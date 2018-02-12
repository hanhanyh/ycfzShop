<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="siteInfoManager.aspx.cs" Inherits="UI.Admin.siteInfoManager" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        网站信息管理
    </title>
        <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-hover table-responsive table-bordered">
        <tr>
            <td>
                 网站名称：
            </td>
            <td>
                 <asp:TextBox ID="txtSiteName" runat="server" CssClass="input-sm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                 logo:
            </td>
            <td>
                <asp:FileUpload ID="fileuplogo" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                 第一张Banner图片:
            </td>
            <td>
                  <asp:FileUpload ID="filebanner1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                第二张Banner图片：
            </td>
            <td>
                  <asp:FileUpload ID="filebanner2" runat="server" />
            </td>

        </tr>
        <tr>
            <td>
                 第三张Banner图片：
            </td>
            <td>
                <asp:FileUpload ID="filebanner3" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                   公司简介：
            </td>
            <td>
                <fckeditorv2:fckeditor runat="server" Width="800" ID="fckCompanyDes" Height="800"></fckeditorv2:fckeditor>
            </td>
        </tr>
        <tr>
            <td>
                  我们团队：
            </td>
            <td>
                 <fckeditorv2:fckeditor runat="server" ID="fckAboutUs"  Height="800"></fckeditorv2:fckeditor>
            </td>
        </tr>
        <tr>
            <td>
                   联系我们：
            </td>
            <td>
                <fckeditorv2:fckeditor runat="server" ID="fckContactUs"  Height="800"></fckeditorv2:fckeditor>
            </td>
        </tr>
        <%--<tr>
            <td>
                 微信联系的图片：
            </td>
            <td>
                 <asp:FileUpload ID="filewechat" runat="server" /><br />
            </td>
        </tr>
        <tr>
            <td>
                  今日推荐视频：
            </td>
            <td>
                 <asp:FileUpload ID="filemovie" runat="server" /><br />
            </td>
        </tr>--%>
        <tr>
            <td colspan="2">
                 <asp:Button  runat="server" ID="btnSubmit" CssClass="btn btn-primary" style="float:right;" Text="确定" OnClick="btnSubmit_Click"/>
            </td>
        </tr>
    </table>
  
   
 
  
   
 
 
 
  
 
   
</asp:Content>
