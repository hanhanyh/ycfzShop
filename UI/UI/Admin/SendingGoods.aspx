<%@ Page Title="发货" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="SendingGoods.aspx.cs" Inherits="UI.Admin.SendingGoods" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script>
  function sendSucc()
{
    alert("发货成功！");
}
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    
    <table  class="table  table-hover table-bordered table-responsive" style="float:left;">
        <tr>
            <td>商品名称：</td>
           <td>
               <asp:Label ID="LabelGName" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td>图片：</td>
            <td>
                <asp:Label ID="LabelPic" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>已付款：</td>
            <td>
                <asp:Label ID="LabelPayedMoney" runat="server" Text="Label"></asp:Label></td>
        </tr>
        <tr>
            <td>数量：</td>
            <td>
                <asp:Label ID="LabelAmount" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                尺寸：
            </td>
            <td>
                <asp:Label ID="LabelSize" runat="server" Text="Label"></asp:Label>
              </td>
        </tr>
        <tr>
            <td>收货地址：</td>
            <td> <asp:Label ID="LabelAddress" runat="server" Text="Label"></asp:Label>
                </td>
        </tr>
        <tr>
            <td>订单生成时间</td>
            <td>
                <asp:Label ID="LabelBuyTime" runat="server" Text="Label"></asp:Label>
            </td>
        </tr>
    </table>
    <table style="float:left" class="table table-hover table-responsive table-bordered">
        <tr>
            <td>
                发货方式
            </td>
            <td>
                <asp:TextBox  runat="server" Text="韵达" ID="labSendType" CssClass="input-sm"></asp:TextBox>
            </td>
            <td>
                运单号
            </td>
            <td>
                <asp:TextBox  runat="server" Text="8888888" ID="labYunDan" CssClass="input-sm"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Button runat="server"  Text="确认发货" ID="btnSubmit" OnClick="btnSubmit_Click" CssClass="btn btn-warning"/>
            </td>
        </tr>
    </table>
</asp:Content>
