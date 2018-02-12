<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="UI.Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>搜索</title>
       <link rel="stylesheet" href="css/global.css" />
<link rel="stylesheet" href="css/goodslistview0.css" />
    <style>
        .typeul {
            list-style:none;
        }
            .typeul li {
                float:left;
                margin-left:20px;
                margin-right:20px;
                padding-left:15px;
            }
        .smallTxtBox {
            width:50px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <!--
    	置顶按钮开始
    -->
    <a name="topname"> </a>
	<div id="divtop"style="position: fixed;right:50px;top:80%;border:0;width:60px;height:60px;text-align: center;padding-top:20px;">
		<a href="#top" id="topa">
			<img src="img/index/chevron-up.png" style="color:white;width:20px;"/>	
		</a>
	</div>
    <!--
    	置顶按钮结束
    -->
       <!---center -->
<div class="container">
	<ol class="breadcrumb"  class="mbxnav" style="margin-bottom: 0;margin-left:0;padding-left:0;background: transparent;">
    		<li><a href="index.aspx" style="color:black;text-decoration: none;">首页</a></li>
    		<li class="active">商品搜索</li>
    </ol>
    <div>
    	<img src="img/searchtopic.jpg" width="100%" /> 
    </div>

	<div id="divtable" style="width:1038px;margin:0 auto;"><!--table div--->
	<div id="oumei"><!---oumei-->
        <%/*第一行*/ %>
         <asp:Repeater ID="Repeater1row" runat="server">
            <ItemTemplate>
                <div class="tddiv">
				    <div class="divnnew">NEW</div>
				    <div><a href="GoodsDetail.aspx?GID=<%#Eval("商品ID") %>"><img src='productImg/<%#Eval("描述图片") %>'   width="235"/> </a></div>
				    <div style="color:#D73737;font-size: 12px;margin-top:20px;"><%#Eval("商品名称") %></div>
				    <div style="color:#666666;font-size: 12px;line-height: 150%;;"><%#Eval("小标题") %></div>
				    <div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥<%#Eval("市场价") %></span><span style="font-size:12px;">￥<%#Eval("促销价") %></span></div>
			    </div>
            </ItemTemplate>
        </asp:Repeater>
			
			<div style="clear:both;"></div>
			
        	<!---第二行--->
        <asp:Repeater ID="Repeater2row" runat="server">
            <ItemTemplate>
            <div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="GoodsDetail.aspx?GID=<%#Eval("商品ID") %>"><img src='productImg/<%#Eval("描述图片") %>'   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;"><%#Eval("商品名称") %></div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;"><%#Eval("小标题") %></div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥<%#Eval("市场价") %></span><span style="font-size:12px;">￥<%#Eval("促销价") %></span></div>
			</div>
            </ItemTemplate>
        </asp:Repeater>
			
	
			<div style="clear:both;"></div>
			<!----->
				<!---第三行--->
        <asp:Repeater ID="Repeater3row" runat="server">
            <ItemTemplate>
            <div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="GoodsDetail.aspx?GID=<%#Eval("商品ID") %>"><img src='productImg/<%#Eval("描述图片") %>'   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;"><%#Eval("商品名称") %></div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;"><%#Eval("小标题") %></div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥<%#Eval("市场价") %></span><span style="font-size:12px;">￥<%#Eval("促销价") %></span></div>
			</div>
            </ItemTemplate>
        </asp:Repeater>
			
			<div style="clear:both;"></div>
		
	</div><!---oumei end--->
	
	
	
	
	
</div><!--table div-->

<div style="margin-top:50px;border-bottom: 1px solid #DBDBDB;">
	
</div>
<div style="margin-top:12px;font-size:12px;color:#666666;margin-bottom: 12px;">
	共<%=_allcount %>件商品<asp:Button ID="btnprePage" runat="server" Text="上一页" CssClass="btn btn-default btn-sm" OnClick="btnprePage_Click"/>第<asp:TextBox ID="txtPage" CssClass="input-sm smallTxtBox" Text='' runat="server"></asp:TextBox>/<%=_allPages %>页<asp:Button ID="btnNavgator"  CssClass="btn btn-default btn-sm" runat="server" Text="跳"  OnClick="btnNavgator_Click"/><asp:Button ID="btnNextPage" runat="server" Text="下一页" CssClass="btn btn-default btn-sm" OnClick="btnNextPage_Click"/>
	<div style="float:right;background: black;color:white;height:24px;width:24px;text-align: center;padding-top:5px;"><%=_page %></div>
	<div style="clear:both;"></div>
</div>
</div><!--center end---->
    <script>
        var oSearchTxt = document.getElementById("searchTxt");
        oSearchTxt.value = "<%=_key%>";
    </script>
</asp:Content>
