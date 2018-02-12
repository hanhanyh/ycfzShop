<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite1.Master" AutoEventWireup="true" CodeBehind="Panel.aspx.cs" Inherits="UI.Admin.Panel" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>
        --后台管理首页
    </title>
    <script src="../js/jquery2.1.1.min.js" ></script>
    <script src="../bootstrap-3.3.7-dist/js/bootstrap.min.js" ></script>
    <link rel="stylesheet" type="text/css" href="../bootstrap-3.3.7-dist/css/bootstrap.min.css" />
    <script src="../js/echarts-3.8.5/dist/echarts.min.js" ></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     管理员：<asp:Label ID="labuname" runat="server" Text="Label"></asp:Label><br />欢迎回来！<%--<asp:Button ID="btnLogout" runat="server" Text="注销" OnClick="btnLogout_Click" CssClass="btn btn-primary"/>--%>

            当前时间：<asp:Label ID="labnow" runat="server" Text="0000-00-00 00:00:00"></asp:Label><br />
    
    <!--分类销量统计-->
     <div id="main" style="width: 600px;height:400px;"></div>
     <script type="text/javascript">
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));

        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '销量最多统计'
            },
            tooltip: {},
            legend: {
                data:['销量']
            },
            xAxis: {
                data: ["<%=_goodsnames[0]%>","<%=_goodsnames[1]%>","<%=_goodsnames[2]%>","<%=_goodsnames[3]%>","<%=_goodsnames[4]%>","<%=_goodsnames[5]%>"]
            },
            yAxis: {},
            series: [{
                name: '销量',
                type: 'bar',
                data: [<%=_goodxl[0]%>, <%=_goodxl[1]%>, <%=_goodxl[2]%>, <%=_goodxl[3]%>,<%=_goodxl[4]%>, <%=_goodxl[5]%>]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);
    </script>
  <div id="main2" style="width: 600px;height:400px;"></div>
    <script>
        // 绘制图表。
        echarts.init(document.getElementById('main2')).setOption({
            title: {
                text: '销量分布'
            },
            series: {
                type: 'pie',
                data: [
                    <%
                            for (int i = 0; i < _pieName.Length; i++)
                            {
                                Response.Write("{ name: '"+_pieName[i]+"', value: "+_pieXl[i]+" },");
                            }
                        %>
                   
                   // { name: 'C', value: 1 }
                ]
            }
        });
    </script>
    <%/*这里取消掉了一个用户注册量统计*/ %>
    <%--<div id="RegCount" style="width: 600px;height:400px;"></div>
    <script type="text/javascript">  
        //指定图标的配置和数据  
        var option = {
            title: {
                text: '用户注册量'
            },
            tooltip: {},
            legend: {
                data: ['用户来源']
            },
            xAxis: {
                data: ["9月", "10月","11月", "12月", ]
            },
            yAxis: {

            },
            series: [{
                name: '注册量',
                type: 'line',
                data: [500, 200, 360, 100]
            }]
        };
        //初始化echarts实例  
        var myChart = echarts.init(document.getElementById('RegCount'));

        //使用制定的配置项和数据显示图表  
        myChart.setOption(option);
    </script>  --%>
    </asp:Content>
