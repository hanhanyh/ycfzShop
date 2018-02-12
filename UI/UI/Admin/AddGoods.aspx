<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="AddGoods.aspx.cs" Inherits="UI.Admin.AddGoods" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>新增商品</title>
     <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script>
        function warningDesPic()
        {
            alert("必须上传三个描述图片！");
        }
        function warningEmpty()
        {
            alert("没有填写完整！");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <table class="table table-responsive">
      <tr>
          <td>
              <label>商品名称：</label>
          </td>
          <td>
               <asp:TextBox ID="txtName" runat="server" CssClass="input-sm form-control"></asp:TextBox>
          </td>
          
      </tr>
        <tr>
            <td>
                <label>商品分类</label>
            </td>
            <td>
                <asp:DropDownList runat="server" ID="ddlType">

                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td>
                 <label> 市场价格：</label>
            </td>
            <td>
                  <asp:TextBox ID="txtSCPrice" runat="server" CssClass="input-sm" ></asp:TextBox>
            </td>
        </tr>
     <tr>
         <td>
               <label>  促销价格：</label>
         </td>
         <td>
              <asp:TextBox ID="txtCXPrice" runat="server" CssClass="input-sm"></asp:TextBox>
         </td>
     </tr>
    <tr>
        <td>
             <label>  可选尺码：</label>
        </td>
        <td>
            <asp:TextBox ID="txtSize" runat="server" CssClass="input-sm"></asp:TextBox>
        </td>
    </tr>
        <tr>
            <td>
                <label> 描述图片1：</label>
            </td>
            <td>
                <asp:FileUpload ID="FileUpload1" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                 <label> 描述图片2：</label>
            </td>
            <td>
                 <asp:FileUpload ID="FileUpload2" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                 <label> 描述图片3：</label>
            </td>
            <td>
                  <asp:FileUpload ID="FileUpload3" runat="server" />
            </td>
        </tr>
        <tr>
            <td>
                  <label> 详细描述:</label>
            </td>
            <td>
                 <FCKeditorV2:FCKeditor ID="FCKeditor1" runat="server" Width="600" Height="400"></FCKeditorV2:FCKeditor>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                 <asp:Button ID="btnSubmit" runat="server" Text="确认添加" CssClass="btn btn-default"  style="float:right;" OnClick="btnSubmit_Click" />
            </td>
        </tr>
      </table>
       
    
</asp:Content>
