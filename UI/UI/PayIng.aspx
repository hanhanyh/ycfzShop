<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="PayIng.aspx.cs" Inherits="UI.PayIng" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
       ----- 收银台--
    </title>
    <script>
        function payedSuccess()
        {
            $.ajax({
                type: 'get',
                async: true,
                url: 'ajaxHandler.aspx?comm=PaySuccess',
                success: function (result) {
                    if (result == 1) {
                        alert("支付成功！");
                        location.href = "UserCenter.aspx";
                    }
                }

            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" panel-default panel">
       <img src="img/weChatPay.png"  />
    </div>
    <div class="panel panel-default">
        <div id="divcode" style="width:200px;margin:0 auto;margin-bottom:40px;margin-top:40px;">
            <asp:Label ID="labTopicPrice" runat="server" style="font-size:50px;" Text="Label"></asp:Label>
            <img src="img/2wcode.jpg" width="200" height="200"/>
        </div>
    </div>
      <div class=" panel-default panel">
        <table class="table table-bordered table-hover table-responsive">
            <tr>
                <td>商品名称</td>
                
                 <td>尺码</td>
                 <td>数量</td>
                 <td>地址</td>
                 <td>应付金额</td>
            
            </tr>
            <tr>
                <td>
                    <asp:Label ID="labName" runat="server" Text="Label"></asp:Label>
                </td>
                
                <td>
                    <asp:Label ID="labSize" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="labCount" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="labAddress" runat="server" Text="Label"></asp:Label>
                </td>
                <td>
                    <asp:Label ID="labWillPayMoney" runat="server" Text="Label"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="text-align:right;">
                    <asp:Button ID="btnCancel" runat="server" Text="取消订单"  CssClass="btn btn-default"  OnClientClick="history.go(-1);return false;"/>
                    <asp:Button ID="btnFinish" runat="server" Text="我已支付"  CssClass="btn btn-danger"   OnClientClick="payedSuccess();return false;"/>
                </td>
            </tr>
        </table>
  </div>
</asp:Content>
