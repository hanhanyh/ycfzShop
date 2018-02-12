<%@ Page Title="一号原创服装~" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="UI.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%=_title %></title>
    <link rel="stylesheet" href="css/goodslistview0.css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!---在线推荐 dialog--->
  
    <div class="modal fade" role="dialog" aria-hidden="true" id="recommendDlg">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					
					<h5 class="text-left modal-title"><img src="img/1hycz.png"  />在线推荐 </h5>
				    
				</div>
				<!-------->
				<div class="modal-body">
					<div style="font-size: 10px;line-height: 200%;">*请更具实际情况选择</div>
					<img src="img/recommend/recommendad0.jpg"  style="width:550px;margin:0 auto;margin-bottom: 40px;;"/>
					<table  style="font-size: 12px;color:#666666;" id="TJTable" >
							<tr>
								<td style="color:black;font-size: 12px;font-weight: bold;">身高</td>
								<td><input type="radio" name="height"  class="radioInput"/>&nbsp;&nbsp;0~164</td>
								
								<td><input type="radio" name="height"  class="radioInput"/>&nbsp;&nbsp;165~167</td>
								<td><input type="radio" name="height" class="radioInput"/>&nbsp;&nbsp;168~172</td>
								<td><input type="radio" name="height" class="radioInput"/>&nbsp;&nbsp;173~180</td>
							</tr>
							<tr>
								<td style="color:black;font-size: 12px;font-weight: bold;">年龄</td>
								<td><input type="radio" name="age" class="radioInput" id="agebtn1" value="16"/>&nbsp;&nbsp;16~18</td>
								<td><input type="radio" name="age" class="radioInput" id="agebtn2" value="19"/>&nbsp;&nbsp;19~22</td>
								<td><input type="radio" name="age" class="radioInput" id="agebtn3" value="23"/>&nbsp;&nbsp;23~26</td>
								<td><input type="radio" name="age" class="radioInput" id="agebtn4" value="27"/>&nbsp;&nbsp;27以上</td>
							</tr>
							<tr>
								<td style="color:black;font-size: 12px;font-weight: bold;">体重</td>
								<td><input type="radio" name="weight" class="radioInput"/>&nbsp;&nbsp;40kg~45kg</td>
								<td><input type="radio" name="weight"class="radioInput"/>&nbsp;&nbsp;46kg~50kg</td>
								<td><input type="radio" name="weight" class="radioInput"/>&nbsp;&nbsp;51kg~55kg</td>
								<td><input type="radio" name="weight" class="radioInput"/>&nbsp;&nbsp;55kg以上</td>
							</tr>
							<tr>
								<td style="color:black;font-size: 12px;font-weight: bold;">性格</td>
								<td><input type="checkbox" name="like"  class="CheckBoxInput"/>&nbsp;&nbsp;青春</td>
								<td><input type="checkbox" name="like" class="CheckBoxInput" />&nbsp;&nbsp;可爱</td>
								<td><input type="checkbox" name="like"class="CheckBoxInput" />&nbsp;&nbsp;稳重</td>
								<td><input type="checkbox" name="like" class="CheckBoxInput"/>&nbsp;&nbsp;奢侈</td>
							</tr>
							<tr >
								<td style="color:black;font-size: 12px;font-weight: bold;">颜色</td>
								<td><label style="width:20px;height:20px;background-color:black;position: relative;top:-2px;">&nbsp;</label>&nbsp;&nbsp;<input type="checkbox" name="color" class="CheckBoxInput" /></td>
								<td><label style="width:20px;height:20px;background-color:white;border:1px solid #DBDBDB;position: relative;top:-2px;">&nbsp;</label>&nbsp;&nbsp;<input type="checkbox" name="color" class="CheckBoxInput"/></td>
								<td><label style="width:20px;height:20px;background-color:blue;position: relative;top:-2px;">&nbsp;</label>&nbsp;&nbsp;<input type="checkbox" name="color" class="CheckBoxInput"/></td>
								<td><label style="width:20px;height:20px;background-color:lightgreen;position: relative;top:-2px;">&nbsp;</label>&nbsp;&nbsp;<input type="checkbox" name="color" class="CheckBoxInput"/></td>
							</tr>
							<tr>
								<td colspan="5" align="center">
									<button type="button" id="tjbtn">立即推荐</button>
								</td>
							</tr>
						
					</table><!--table end-->
				</div><!---modal-body end---->
			</div>
		</div>    	
    </div>
    <!------>
   <%-- <script>
    //设置按钮样式
	$('.radioInput').iCheck({   
	checkboxClass : 'icheckbox_minimal', 
	radioClass : 'iradio_minimal', 
	}); 
	
	$('.CheckBoxInput').iCheck({   
	checkboxClass : 'icheckbox_minimal', 
	radioClass : 'iradio_minimal', 
	}); 
	//---推荐事件
	document.getElementById("tjbtn").onclick=function(){
		var ageVal=$('input:radio[name="age"]:checked').val();
	//	alert(ageVal);
		if(ageVal==16)
			{
				//alert("你选了16");
				location.href="recommend/recommend1.html";
			}else if(ageVal==19)
			{
				location.href="recommend/recommend2.html";
				
			}else if(ageVal==23)
			{
				location.href="recommend/recommend3.html";
				
			}else if(ageVal==27)
			{
				location.href="recommend/recommend4.html";
			}else if(ageVal==null)
			{
				alert("你没有选择年龄");
			}
	}
	</script>--%>
    <!---在线推荐结束 dialog---->

    
    <!-- data-ride=carousel-->
<div id="myCarousel" class="carousel slide" data-ride="carousel">
    <!-- 轮播carousel 按钮指针indicators -->
    <ol class="carousel-indicators">
        <li data-target="#myCarousel" data-slide-to="0" class="active" ></li>
        <li data-target="#myCarousel" data-slide-to="1"></li>
        <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>   
    <!-- 轮播（Carousel）项目 -->
    <div class="carousel-inner" >
        <div class="item active">
            <img src="img/<%=banners[0] %>" alt="First slide" class="img-responsive">
            
        </div>
        <div class="item">
            <img src="img/<%=banners[1] %>" alt="Second slide" class="img-responsive">
            
        </div>
        <div class="item">
            <img src="img/<%=banners[2] %> "alt="Third slide" class="img-responsive">
            
        </div>
    </div>
    <!-- 轮播左侧右侧切换 -->
    <a class="carousel-control left" href="#myCarousel" 
        data-slide="prev">&lsaquo;
    </a>
    <a class="carousel-control right" href="#myCarousel" 
        data-slide="next">&rsaquo;
    </a>
</div>
<script>
/********************88
 * Author：邱于涵
 * carousel轮播 
 * $("id").carousel({option:值})
 * *********************/
	$('#myCarousel').carousel({
	interval: 3000
});

</script>
<!--图片轮播结束--->

<!---中间选项开始-  栅格化系统-->
<%--<div class="row" style="margin-top:20px;margin-bottom: 35px;">
	<div class="col-md-4" >
			<div id="ling1" class="visible-lg">
    	<div id="ling11">
    		<ul id="ling2">
            	<li id="ling3"><hr/></li>
                <li id="ling4">欢迎来到&nbsp;1号原创装</li>
                <li id="ling5"><hr/></li>
            </ul>
        </div>
        <div id="ling9">
        <div id="ling6"><img src="img/1hycz.png" /></div>
        <div id="ling7">
        	<img src="img/QQ图片20161214225319.png" />
            <div id="ling8">1HYCZ.COM</div>
                </div>
        </div>
        <div id="ling17" style="position:relative;top:-1px;">温馨提示</div>
        <div id="ling10" style="position:relative;top:-30px;">还在为找不到合适的衣服而烦恼吗？还在为逛花式多样的商城眼花缭乱吗？说出您的需求，1号原创装为您独家推荐。</div>
        <div>
        	<ul id="ling12" style="position:relative;top:-10px;">
            	
                <li id="ling14"><a href="goodslistview.html">先逛逛</a></li>
            </ul>
        </div>
    </div>--%>
    <!---左侧结束--->
	<%--</div>
	<!----中间按钮-->
	<div class="col-md-3" style="text-align: center;">
		<ul id="centerbtnul">
			<li>
				<asp:LinkButton runat="server" ID="linkbtnNavGoods" CssClass="centerbtn"  OnClick="linkbtnNavGoods_Click" Width="189px" style= "line-height:48px;color:white;text-decoration:none">商品自览</asp:LinkButton> 
			</li>
			<li>
					<button  class="centerbtn" onclick="javascript:$('#recommendDlg').modal('show');">在线推荐</button>
			</li>
			<li>
					<button class="centerbtn">私人订制</button>
			</li>
		</ul>
	</div>
	<div class="col-md-5 hidden-xs">
		<ul class="nav nav-tabs " style="background-color: white;" id="tabs">
			<li class="active"><a href="#tabs1" data-toggle="tab">今日资讯</a></li>
			<li><a href="#tabs2" data-toggle="tab">最新上架</a></li>
		</ul>
		<div class="nav tab-content">
			<div class="tab-pane fade in active" id="tabs1"> 
				<video src="video/video0.mp4" controls="controls" autoplay="autoplay" preload="auto" width="455" loop="loop">
					您的浏览器不支持H5视频播放
				</video>
			</div>
			<div class="tab-pane fade" id="tabs2"> 图片页</div>
		</div>
	</div>
</div>
<!--

-->
<div class="row">
	
</div>
<!--
	作者：1031893464@qq.com
	时间：2016-12-13
	描述：container正文结束
-->
</div>--%>
    <div>
        <div style="margin:0 auto;width:100px;margin-top:12px;margin-bottom:-20px;font-size:20px;font-weight:bold;font-family:'Microsoft YaHei';border-bottom:2px solid black;padding-bottom:2px;">
            &nbsp;最新商品
        </div>
       <div style="text-align:right;padding-right:100px;text-decoration:underline;font-weight:bold;" ><a href="GoodsList.aspx">MORE</a></div>
    </div>
  <div id="divtable" style="width:1038px;margin:0 auto;margin-bottom:50px;"><!--table div--->
	<div id="oumei"><!---oumei-->
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
			<%--<div class="tddiv">
				<div class="divnnew">NEW</div>
				<div><a href="product/productdetail0.html"><img src="img/product/productdetail0/02e93a0152f0700eb929fb3ec51760bd12.jpg"   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">THETHING涂鸦 印花邪门襟长款女风衣</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">THETHING</div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥1280.00</span><span style="font-size:12px;">￥512.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divnnew">NEW</div>
				<div><a href="product/productdetail1.html"><img src="img/goodslistview/oumei/2.jpg"   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">1steelsir 修身PU皮仿皮草短款夹克</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">steelsir</div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥998.00</span><span style="font-size:12px;">￥260.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divnnew">NEW</div>
				<div><a href="product/productdetail2.html"><img src="img/goodslistview/oumei/3.jpg"   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">steelsir 时尚黑色翻领流苏皮衣</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">THETHING</div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥798.00</span><span style="font-size:12px;">￥123.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divnnew">NEW</div>
				<div><a href="product/productdetail3.html"><img src="img/goodslistview/oumei/4.jpg"   width="235"/></a> </div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">MANGO 流苏翻领山羊皮夹克 棕色</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">MANGO</div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥1999.00</span><span style="font-size:12px;">￥990.00</span></div>
			</div>--%>
			
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
			<%--<div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="product/productdetail5.html"><img src="img/goodslistview/oumei/5.jpg"   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">JOYRICH 大力水手图案针织衫（女款）</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">THETHING</div>
				<div><span style="font-size:12px;">￥1799.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="product/productdetail6.html"><img src="img/goodslistview/oumei/6.jpg"   width="235"/> </a></div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">Dickies 女士图案提花长袖毛衫</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">Dickies</div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥399.00</span><span style="font-size:12px;">￥339.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="product/productdetail4.html"><img src="img/goodslistview/oumei/7.jpg"   width="235"/></a> </div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">Dickies 女士图案提花长袖毛衫</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">Dickies </div>
				<div><span style="text-decoration: line-through;font-size: 11px;color:#666666;">￥399.00</span><span style="font-size:12px;">￥339.00</span></div>
			</div>
			<div class="tddiv">
				<div class="divsale">SALE</div>
				<div><a href="product/productdetail7.html"><img src="img/goodslistview/oumei/8.jpg"   width="235"/></a> </div>
				<div style="color:#D73737;font-size: 12px;margin-top:20px;">JOYRICH 大力水手图案针织衫（女款</div>
				<div style="color:#666666;font-size: 12px;line-height: 150%;;">JOYRICH  </div>
				<div><span style="font-size:12px;">￥1799.00</span></div>
			</div>--%>
			
			<div style="clear:both;"></div>
			<!---第三行-->
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
 </div><!--table div end--->
    
</asp:Content>
