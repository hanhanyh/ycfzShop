<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="UI.Admin.Login" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>
        管理员登录
    </title>
      <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <style>
        #formform {
            width:400px;
            height:350px;
            position:relative;
            top:-200px;
            margin:0 auto;
            padding-left:50px;
            padding-right:50px;
        }
        #bkg {
            width:400px;
            height:350px;
            background:white;
            opacity:0.5;
            margin:0 auto;
            z-index:-1;
             position:relative;
            top:125px;
        }
        #btnLogin {
            width:250px;
            margin-left:25px;
        }
    </style>
    <script>
        function loginfail()
        {
            alert("登录失败！账号或密码错误！");
        }
    </script>
</head>
<body style="background-image:url(../img/admin/loginbkg.jpg)">
    <form id="form1" runat="server">
        <div  id="bkg">

        </div>
        <div class="form-group" id="formform">
            
            <label style="font-size:30px;font-weight:bold;margin-left:60px;">管理员登录</label>
            <img src="../img/admin/loginhead.png"  style="margin-left:85px;"/>
              <br />
            <asp:TextBox ID="txtUname" runat="server"  CssClass="form-control" placeholder="请输入用户名"></asp:TextBox>
             <br />
            <asp:TextBox ID="txtPwd" runat="server" type="password" CssClass="form-control" placeholder="请输入密码"></asp:TextBox><br />
            
            <asp:Button ID="btnLogin" runat="server" Text="登录" OnClick="btnLogin_Click"  CssClass="btn btn-primary"/>
        </div>
    </form>
</body>
</html>
