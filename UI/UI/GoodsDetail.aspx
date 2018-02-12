<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="GoodsDetail.aspx.cs" Inherits="UI.GoodsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title><%=_Name %>--商品详情</title>
    <script type="text/javascript" src="js/global.js" ></script>

<link rel="stylesheet" href="css/global.css" />
    <link href="css/product/productdetail0.css" rel="stylesheet" type="text/css" />
    <style>
	#picShow2{
		display: none;
	}
	#picShow3{
		display: none;
	}
</style>
    <script>
        function ffrequest()
        {
            alert("非法请求！");
        }
        function submitOrder()
        {
            //var checkValue=$("#select_id").val(); //获取选择项
        }
        //获取登录状态  打开订单Dlg
        function getGoodsInfo()
        {
            //  $('#ContactModal').modal('show');
            ///判断是否登录
            $.ajax({
                type: 'get',
                url: 'ajaxHandler.aspx?comm=isLogined',
                async:true,
                success: function (result) {
                    if (result == "1") {

                        $('#ContactModal').modal('show');
                    } else {
                        alert("您没登录！");
                    }
                }
            })
          
           
        }
          //异步获取数据给订单表单
        function getDlgData(gid)
        {
            $.ajax({
                type: 'get',
                url: 'ajaxHandler.aspx?comm=getGoods&GID=' + gid,
                async: true,
                // data: { Name: oNameText.value, Pwd: oPassText.value },
                success: function (result) {
                    var jsonObj = eval('(' + result + ')');
                    // alert(jsonObj);
                    var allsize = jsonObj.allsize;
                    var arrSizes = allsize.split("|");
                    for (i = 0; i < arrSizes.length; i++) {
                        // alert(arrSizes[i]);
                        //为select动态增加option
                        $('#selectSize').append($("<option/>", {
                            value: arrSizes[i],
                            text: arrSizes[i]
                        }));
                    }
                },
                error: function () {
                    alert('ERROR!');
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--
    	置顶按钮开始
    -->
    <a name="topname"> </a>
	<div id="divtop"style="position: fixed;right:50px;top:80%;border:0;width:60px;height:60px;text-align: center;padding-top:20px;">
		<a href="#top" id="topa">
			<img src="../img/index/chevron-up.png" style="color:white;width:20px;"/>	
		</a>
	</div>
    <!--
    	置顶按钮结束
    -->
     <!--
    	联系购买对话框开始
    -->
    <div class="modal fade" id="ContactModal" role="dialog" aria-hidden="true" >
    	<div class="modal-dialog">
    		<div class="modal-content">
    			<div class="modal-header">
    				<button class="close" data-dismiss="modal" aria-hidden="true" type="button">
    					&times;
    				</button>
    				<h4 class="modal-title">
    					<img src="../img/1hycz.png" /> &nbsp;&nbsp;确认订单信息
    				</h4>
    			</div>
    			<!---中间开始--->
    			<div class="modal-body" >
    				<table class="table table-hover table-responsive table-bordered">
                        <tr>
                            <td>
                                商品名称：
                            </td>
                            <td>
                                <label>steelsir 时尚长袖拼接宽松衬衫</label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                尺码：
                             </td>
                            <td>
                                <select id="selectSize">
                                    
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                数量：
                            </td>
                            <td>
                                <input type="text" id="inputCount" />
                            </td>
                        </tr>
                        <tr>
                         <td>
                            邮编：
                        </td>
                        <td>
                            <input type="text" id="emailnum"/>
                        </td>
                            </tr>
                         <tr>
                            <td>
                                收件人：
                            </td>
                            <td>
                                <input type="text" id="inPeople" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                手机号码：
                            </td>
                            <td>
                                <input type="text" id="inphone" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                收货地址：
                            </td>
                            <td>
                                <textarea id="addressarea" ></textarea>
                            </td>
                        </tr>
                       
    				</table>
    			</div><!---中间结束----->
    			
    			<div class="modal-footer">
    			  <button class="btn btn-danger" id="btnGenerateOrder" onclick="return false;<%/*所有btn默认会回传 这里取消回传*/ %>" >提交订单</button> 	<button class="btn btn-default" data-dismiss="modal">关闭</button>
    			</div>
    			<!----->
    		</div>
    	</div>
    </div>
    <script>
        var obtnGenerateOrder = document.getElementById("btnGenerateOrder");
        obtnGenerateOrder.onclick = function ()
        {
            var gid =<%=_GID%>; //这里直接替换后台属性
            var selectSize = $("#selectSize").val();
            var inputcount = document.getElementById("inputCount").value;
            var emailnum = document.getElementById("emailnum").value;
            var peoplename = document.getElementById("inPeople").value; 
            var inphone = document.getElementById("inphone").value;
            var address = $("#addressarea").val();
            var totaladdress = address +"    "+ peoplename +"    "+ inphone+"    "+ emailnum;
            var payd =<%=_CXPrice%> * inputcount;
            // alert(address);
            $.ajax({
                url: "ajaxHandler.aspx?comm=generateOrder",
                type: 'post',
                data: {
                    GID: gid,
                    UID:<%=_UID%>,
                    Payed: payd,
                    count: inputcount,
                    Address: totaladdress,
                    Size: selectSize,
                  },
                success: function (result)
                {
                    //alert(result);
                    location.href = "Paying.aspx";
                }
            })
           // alert("点击了这里");
     

            return false;//禁止回传(非常重要)
        }
    </script>
    <!--
    	联系购买对话框结束
    -->
    
        	<div style="width:950px;margin:0 auto;">
            	<div id="ling01">
            		<div style="width:420px;height:560px;overflow: hidden;">
            			<img id="picShow1"  src="productImg/<%=_DesImg1Url %>"" />
            			<img id="picShow2"  src="productImg/<%=_DesImg2Url %>" />
            			<img id="picShow3" src="productImg/<%=_DesImg3Url %>" />
            		</div>
            			
            	</div>
              <div id="ling02">  
                <div id="ling03"><img id="picChange1"src="productImg/<%=_DesImg1Url %>""   width="45" height="60"/></div>
                <div id="ling03"><img id="picChange2"src="productImg/<%=_DesImg2Url %>""  width="45" height="60" /></div>
                <div id="ling03"><img id="picChange3" src="productImg/<%=_DesImg3Url %>""  width="45" height="60"/></div>
              </div>
              <script>
                  //1031893464@qq.com
                  var oPicC1 = document.getElementById("picChange1");
                  var oPicC2 = document.getElementById("picChange2");
                  var oPicC3 = document.getElementById("picChange3");
                  var oPicShow = document.getElementById("picShow");
                  oPicC1.onmouseover = function () {
                      $("#picShow3").fadeOut();
                      $("#picShow2").fadeOut();
                      $("#picShow1").fadeIn('slow');
                  };
                  oPicC2.onmouseover = function () {
                      $("#picShow1").fadeOut();
                      $("#picShow3").fadeOut();
                      $("#picShow2").fadeIn('slow');
                  };
                  oPicC3.onmouseover = function () {
                      $("#picShow1").fadeOut();
                      $("#picShow2").fadeOut();
                      $("#picShow3").fadeIn('slow');
                  };
              </script>
           </div>
          <div id="ling12">
            	<div id="ling04"><%=_Name %></div>
                <div id="ling05">THETHING</div>
                <div id="ling06">市场价: ¥<%=_SCPrice %></div>
                <div id="ling07">促销价：<label id="heiti">¥<%=_CXPrice %></label></div>
                <div id="ling08"></div>
              <div id="ling09"><img src="../img/product/productdetail0/ad0.png" /></div>
             <!-- <div id="ling16"></div>-->
              <div>
                  <a href="#" onclick="javascript:getDlgData(<%=_GID %>);getGoodsInfo();"><img src="img/product/productdetail0/lijigoumai.jpg"  /></a>
              </div>
    <!---->         <!-- <div id="ling14" ><a href="#" id="btnliji" onclick="javascript:$('#ContactModal').modal('show');"><img src="../img/product/productdetail0/lijigoumai.jpg"  /></a></div>-->
            <!--  <div id="ling15"><img src="img/product/productdetail0/collect.png" /></div>-->
            <!--<div id="ling13">分享到：</div>-->
            <div id="ling17">
            	<ul id="ling10">
                 	<li id="ling11"><img src="../img/product/productdetail0/qq-icon.png" /></li>
                    <li id="ling11"><img src="../img/product/productdetail0/weibo.png" /></li>
                    <li id="ling11"><img src="../img/product/productdetail0/weixin.png" /></li>
                    <li id="ling12"><img src="../img/product/productdetail0/dou.png" /></li>
                    <li id="ling11"><img src="../img/product/productdetail0/txweibo.png" style="position:relative ;top:1px;"/></li>
                    <li id="ling11"><img src="../img/product/productdetail0/kongjian.png" style="position:relative ;top:-3px;"/></li>
                    <li id="ling12"><img src="../img/product/productdetail0/renren.png" style="position:relative ;top:3px;"/></li>                
                 </ul>
            </div> 
    </div>
         <div>
         <div id="ling19">尺码信息SIZE INFO</div>
         <div id="ling20"><table>
         	<tr id="ling21">
            	<td>吊牌尺码</td>
                <td>参考尺码</td>
                <td>肩宽</td>
                <td>胸围</td>
                <td>袖长</td>
                <td>前衣长</td>
                <td>后衣长</td>
            </tr>
            <tr>
            	<td>S</td>
                <td>155/80A</td>
                <td>51</td>
                <td>112</td>
                <td>47</td>
                <td>89</td>
                <td>96</td>
            </tr>
         	<tr>
            	<td>M</td>
                <td>160/84A</td>
                <td>52</td>
                <td>116</td>
                <td>49</td>
                <td>91</td>
                <td>98</td>
            </tr>
            <tr>
            	<td>L</td>
                <td>165/88A</td>
                <td>54</td>
                <td>124</td>
                <td>50</td>
                <td>94</td>
                <td>101</td>
            </tr>
         </table></div>
         <div id="ling22">※ 以上尺寸为实物人工测量，因测量方式不同会有1-2CM误差，相关数据仅作参考，以收到实物为准。 单位：CM</div>
         <div id="ling23">※ 参考尺码因衣服版型、剪裁不同会有误差，仅供参考</div>
         <div id="ling24"><img src="../img/product/productdetail0/1.jpg" /></div>
      <%--   <div id="ling25"></div>
         <div id="ling26">商品详情 DETAILS</div>
         <div id="ling27">THETHING 成立于2005年上海，品牌标签：独立态度、好玩、graphic&design... “THETHING”解释为“这东西”。没有所谓具体的含义，街头服饰的产品结构，玩乐、戏谑的精神在开发中一脉相承。生活中有好东西，太贵；也有便宜货，却太随便。把“THETHING”磨合的又讲究价格又亲和是我们追寻的目标。</div>
       <div id="ling28">
		<ul id="ling29">
        	<li><img src="../img/product/productdetail0/p1.jpg" /></li>
            <li><img src="../img/product/productdetail0/p2.jpg" /></li>
            <li><img src="../img/product/productdetail0/p3.jpg" /></li>
            <li><img src="../img/product/productdetail0/p4.jpg" /></li>
            <li><img src="../img/product/productdetail0/p5.jpg" /></li>
            <li><img src="../img/product/productdetail0/p6.jpg" /></li>
            <li ><img src="../img/product/productdetail0/p7.jpg" /></li>
            <li><img src="../img/product/productdetail0/p8.jpg" /></li>
            <li><img src="../img/product/productdetail0/p9.jpg" /></li>
            <li><img src="../img/product/productdetail0/p10.jpg" /></li>
            <li><img src="../img/product/productdetail0/p11.jpg" /></li>
            <li><img src="../img/product/productdetail0/p12.jpg" /></li>
            <li><img src="../img/product/productdetail0/p13.jpg" /></li>
            <li><img src="../img/product/productdetail0/p14.jpg" /></li>
            <li><img src="../img/product/productdetail0/p15.jpg" /></li>
            <li><img src="../img/product/productdetail0/p16.jpg" /></li>
        </ul>--%>
             <%=_Detail %>
       </div>
       <div id="ling30"><img src="../img/product/productdetail0/l123.png" /></div>
       <div id="ling31"></div>
         


 <div style="clear:both;"></div>
               
</asp:Content>
