$(document).ready(
			function(){
				$(window).scroll(function(){
					//alert("开始滑动");
					if($(document).scrollTop()>=100){
						 $("#divtop").show();
					}else{
						$("#divtop").hide();
					}
				});
			$("#topa").click(function () {
      		  var speed=200;//滑动的速度
       		 $('body,html').animate({ scrollTop: 0 }, speed);
      		  return false;
                });
           
			}
		);