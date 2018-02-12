<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="UI.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery2.1.1.min.js">
    </script>
    <script>
        window.onload = function()
        {
            document.getElementById("btn").onclick = function () {
                $.ajax({
                    type: 'post',
                    url: 'ajaxHandler.aspx?comm=Reg',
                    async: true,
                    data: { Name: "name1", Pwd: "name1" },
                    success: function (result) {
                        if (result == "1") {
                            alert("注册成功");
                        } else {
                            alert("失败");
                        }
                    },
                    error: function () {
                        alert('ERROR!');
                    }
                });
                return false;//禁止asp.net回传
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <button id="btn">注册</button>
        </div>
    </form>
</body>
</html>
