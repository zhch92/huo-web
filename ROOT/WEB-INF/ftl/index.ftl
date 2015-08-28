<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>货管家-唯有可靠</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/index.css">
        <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/laydate.js"></script>
    <script type="text/javascript"  src="http://192.168.2.50:8089/static/js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/index.js"></script>
    <script>
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?39f1eef3f577e574e809dcb29d873fd2";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
</script>
    
</head>
<body>
     <#include "common/head.ftl"/>

 <div class="arrived">
        <div class="arrive clearfix">
            <div class="logo">
                <a href="/index.htm"><img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
            </div>
            <div class="site">
                <div class="choose">
                    <ul class="clearfix">
                        <li class="item li_1">出发</li>
                        <li class="item li_6 js_select">
                         <select id="province" onchange="setCityGB2260(this.value);" name="province" ><option selected="selected" value="0"></option></select>
                        </li>
                        <li class="item li_6 js_select">
                         <!--  <select id="outhead">
                                 <option value="0">无</option>
                             <option value="510100">成都</option>
                             </select> -->
                           <select id="city" onchange="setCountyGB2260(this.value);" name="city"><option  selected="selected"  value="0"></option></select>   
                        </li>
                         <li class="item li_2 li_3"><input id="start"  ></li>
                    </ul>
                </div>
                <div class="choose">
                    <ul class="clearfix">
                        <li class="item li_1">到达</li>
                        <li class="item li_6 js_select">
                         <select id="province1" onchange="setCityGB22601(this.value);" name="province1" ><option selected="selected" value="0"></option></select>
                        <!-- <select>
                             <option value="0">无</option>
                             <option value="310000">上海</option>
                             </select> -->
                        </li>
                        <li class="item li_6 js_select">
                         <select id="city1" onchange="setCountyGB22601(this.value);" name="city1"><option  selected="selected"  value="0"></option></select>  
                           <!--  <select id="arrivehead">
                                 <option value="0">无</option>
                             <option value="310000">上海市</option>
                             </select> -->
                        </li>
                    </ul>
                </div>
                <div class="choose">
                    <ul class="clearfix">
                        <li class="item li_1">运量</li>
                        <li class="item li_2">
                          <input type="text" id="weighthead">
                        <li class="item li_4">
                          <select id="weightheadtype">
                                    <option value="2">吨</option>
                                    <option value="1">立方</option>
                                </select>
                        </li>
                        <li class="item li_5">
                             <input class="btn" type="button" onClick="searchhead();"  value="搜 索">
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
            
    <script>
var start = {
    elem: '#start',
    format: 'YYYY-MM-DD',
    min: laydate.now(),
    max: '2099-06-16', 
    istime: false,
    istoday: false,

};
laydate(start);

    </script>
    <div class="screen_b">
        <div class="screen">
            <h3>快速筛选</h3>
            <div class="screen_item clearfix">
                <dl>
                    <dt><b class="b_1">	</b>目的地</dt>
                    <dd style="width: 220px;">
                        <a class="tap" href="javascript:;" onClick="searcharrivecity(this,'0');return false;">不限</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'510100');return false;">成都</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'610100');return false;">西安</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'330100');return false;">杭州</a>
                        <a href="javascript:;" onClick="searcharrivecity(this,'310000');return false;">上海</a></dd>
                </dl>
                <dl>
                    <dt><b class="b_2">	</b>车型</dt>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarlen(this,'0');return false;">不限车长</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'1');return false;">9.6米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'3');return false;">12米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'4');return false;">17.5米</a>
                        <a href="javascript:;" onClick="searchcarlen(this,'-1');return false;">其它</a>
                    </dd>
                    <dd>
                        <a class="tap"  href="javascript:;" onClick="searchcarstyle(this,'0');return false;">不限车型</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'7');return false;">箱式</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'11');return false;">高栏</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'1');return false;">平板</a>
                        <a  href="javascript:;" onClick="searchcarstyle(this,'-1');return false;">其它</a>
                    </dd>
                </dl>
                <dl>
                    <dt><b class="b_3">	</b>运量</dt>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarweight(this,'0');return false;">不限</a> 
                        <a href="javascript:;" onClick="searchcarweight(this,'10');return false;">10吨以下</a>
                        <a href="javascript:;" onClick="searchcarweight(this,'10-20');return false;">10-20吨</a>
                        <a href="javascript:;" onClick="searchcarweight(this,'20-999999');return false;">20吨以上</a>
                    </dd>
                    <dd>
                        <a class="tap" href="javascript:;" onClick="searchcarsquare(this,'0');return false;">不限</a> 
                        <a href="javascript:;" onClick="searchcarsquare(this,'10-30');return false;">10-30立方</a>
                        <a href="javascript:;" onClick="searchcarsquare(this,'30-80');return false;">30-80立方</a>
                        <a href="javascript:;" onClick="searchcarsquare(this,'80-999999');return false;">80立方以上</a>
                    </dd>
                </dl>
                <dl class="dl_r">
                    <dt><b class="b_4">	</b>其它</dt>
                    <dd>
                        <input type="checkbox"   onclick="searchcheck(this,'1');">装货可靠
                        <input type="checkbox" style="margin-left: 33px;" onclick="searchcheck(this,'2');">结款准时 </dd>
                </dl>
            </div>
        </div>
    </div>
    <div class="main_b">
        <div class="main">
            <h3><a class="mr active" href="javascript:;" onClick="recomcargo('1');return false;">推荐货源</a>
                <a href="javascript:;" onClick="recomcargo('2');return false;">最新货源</a></h3>
            <div id="content">
          </div>
            <div class="page" id="pagebar">
            </div>
        </div>
    </div>
    <div class="footer" >
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
     <input type="hidden" id="outhead">
    <input type="hidden" id="arrivehead">
      <input id="area1" name="area1" value="" type="hidden">
      <input id="area" name="area" value="" type="hidden">
      <select id="county" name="county" style="display: none;"><option selected="selected"></option></select>
      <select id="county1" name="county1" style="display: none;"><option selected="selected"></option></select>
     <script type="text/javascript" src="http://192.168.2.50:8089/static/js/location.js"></script>
     <script type="text/javascript" src="http://192.168.2.50:8089/static/js/location1.js"></script>   
    <script type="text/javascript">		
      var outstr=0;
      var arrivestr=0;
      var whichstr=0;
      var whichNostr=0;
      var charlengthstr=0;
      var cartypestr=0;
      var orderstr=0;
      var attributestr=0;
      var sendtimestr=0;
      var chargeModestr=0;
      var pagevar=0;
      var sizeval=-6;
      var whichSqu=0;
      var zhstr=0;
      var jkstr=0;
      var tjcx=2;
      
      var carlengh;
      var cartype;
      var carnumber;
      var fhbs;
      var jkl;
      var zhl;
     
      $(document).ready(function () {
    	  if('${headweight}'!==""){
    		  outstr='${goCity}';
    		  arrivestr='${toCity}';
    		  sendtimestr='${sendTime}';
    		  if('${goCity}'!=""){
    			  $("#outhead").val('${goCity}');
    		  }
              if('${toCity}'!=""){
            	  $("#arrivehead").val('${toCity}');
    		  }
              if('${sendTime}'!=""){
            	  $("#start").val('${sendTime}');
    		  }
              $("#weightheadtype").val('${weightheadtype}');
              $("#weighthead").val('${headweight}');
    		  if('${weightheadtype}'==="1"){
    	     		whichNostr=0;
    	     		whichSqu='${headweight}';
    	     	}else if('${weightheadtype}'==="2"){
    	     		whichSqu=0;
    	     		whichNostr='${headweight}';
    	     	}
    	  }
    	  carlengh=carlengthstrfc('${carlengthstr}');
    	  cartype=cartypestrfc('${cartypestr}');
    		       carnumber='${carnumberstr}';
    		       fhbs='${fhbs}';
    		       jkl='${jkl}';
    		       zhl='${zhl}';
      getCargo();
      $(".screen_item dd a").click(function() {
          $(this).addClass("chose").siblings().removeClass("chose");
      })
      });
      //首页搜索
      function searchhead(){
    	  
    	  outstr=$("#city").val()!=""?$("#city").val():0;
     	  arrivestr=$("#city1").val()!=""?$("#city1").val():0;
     	  sendtimestr=$("#start").val()!=""?$("#start").val():0;
     	if($("#weightheadtype").val()==="1"){
     		whichNostr=0;
     		whichSqu=$("#weighthead").val()!=""?$("#weighthead").val():0;
     	}else if($("#weightheadtype").val()==="2"){
     		whichSqu=0;
     		whichNostr=$("#weighthead").val()!=""?$("#weighthead").val():0;
     	}
     	getCargo();
      }
      function carlengthstrfc(val){
    	  var carlengh="";
    	 if(val==0){
    		 carlengh="其它车长";
    	 }else if(val==1){
    		 carlengh="9.6米";
    	 }else if(val==2){
    		 carlengh="12米";
    	 }else if(val==3){
    		 carlengh="17.5米"; 
    	 }else if(val==4){
    		 carlengh="不限车长"; 
    	 }
    	 return carlengh;
      }
      function cartypestrfc(val){
    	  var cartype="";
    	  if(val==0){
     		 cartype="其它车型";
     	 }else if(val==7){
     		 cartype="箱式车";
     	 }else if(val==1){
     		 cartype="平板车";
     	 }else if(val==4){
     		 cartype="不限车型"; 
     	 } else if(val==11){
     		 cartype="高栏车"; 
     	 }   
    	  return cartype;
      }
      //推荐货源
     function recomcargo(val){
    	 pagevar=0
    	 whichSqu=0;
    	  if(val==="1"){
    		  tjcx=2; 
    	  }else{
    		  tjcx=4;
    	  }
    		 getCargo();  
      }
      
      //get货物
      function getCargo(){
    	  var paras= {go:outstr, to:arrivestr, which:whichstr, whichNo:whichNostr, carlength:charlengthstr, cartype:cartypestr,
    			      order:orderstr, attribute:attributestr,sendTime:sendtimestr,chargeMode:chargeModestr,page:pagevar,whichSqu:whichSqu,tjcx:tjcx};
    	  $.ajax({
              type: "POST",
              url: "/ajax/cagolist.htm",
              data:paras,
              datatype:"json",
              success: function(msg)
              {
            	  var obj=eval('('+msg+')'); 
            	  if(obj.data!=null && obj.data!=""){
            	 if(zhstr==1 && jkstr==0){
            		  getCargoList(JsonSortzhl(obj.data));
            	 }else if(jkstr==1  && zhstr==0){
            		  getCargoList(JsonSortjkl(obj.data));
            	 }else if(jkstr==1  && zhstr==1){
            		 //双向选择未作
            	 }else{
            		  getCargoList(obj.data);
            	 }
            	// getCargoList(obj.data);
            	  getPageList(obj.msg);
              }else{
            	  $('#content').empty();
            	  $("#content").append("<div class=\"reminder\">暂无货源</div>");
            	  getPageList(0);
              }
              }
              });
      }
      //可靠性选择
      function searchcheck(obj,val){
    	  if(obj.checked==true && val==="1"){//装货
    		  tjcx=0; 
    		  if(jkstr==1){
    	    	  tjcx=2  
    	      }
    		 zhstr=1;
    	  }else if(obj.checked==false && val==="1"){
    		  if(jkstr==1){
    			  tjcx=1; 
    		  }else{
    			  tjcx=4;  
    		  }
    		  zhstr=0;
    	  }
    	  if(obj.checked==true && val==="2"){//结款率
    		  tjcx=1; 
    	      if(zhstr==1){
    	    	  tjcx=2  
    	      }
    		  jkstr=1;
    	  }else if(obj.checked==false && val==="2"){
    		  if(zhstr==1){
    			  tjcx=0; 
    		  }else{
    			  tjcx=4;  
    		  }
    		  jkstr=0;
    	  }
    	  getCargo();
      }
      
      //按装货率排序
      function JsonSortzhl(obj) {  
    	obj.sort(function (a, b) {
    		return b.zhlStr-a.zhlStr;
    	}); 
        return obj;
    	}
      //按结款率排序
      function JsonSortjkl(obj) {  
    	obj.sort(function (a, b) {
    		return b.jklStr-a.jklStr;
    	});            
        return obj;
    	}
      //货物单
      function getCargoList(obj) {
          if (obj) {
             $('#content').empty();
              if (obj.length > 0) {
            	  var addhtml="";
                  for (var i = 0; i < obj.length; i++) {
                     var cargo = obj[i];
                     var citystr=cargo.cityStr.substr(0,5);
                     var arrivalcitystr=cargo.arrivalCityStr.substr(0,5);
                     var countrystr=cargo.countyStr.substr(0,7);
                     var arrivalcountrystr=cargo.arrivalCountyStr.substr(0,7);
                     var sendtime=cargo.sendTimeStr;
                     var arrivaltime=cargo.arrivalTimeStr;
                     var contentvar="<div class=\"show js_show\"><div class=\"table clearfix\"><table><tr><td  class=\"title\">"+citystr+"</td>"
               	  +"<td width=\"55\"><img src=\"http://192.168.2.50:8089/statics/images/r1.png\" alt=\"\"></td><td  class=\"title\">"+arrivalcitystr+"</td></tr><tr>"
               	  +"<td>"+countrystr+"</td><td></td><td>"+arrivalcountrystr+"</td></tr><tr><td>"+sendtime+"</td><td></td><td>"+arrivaltime+"</td></tr></table>"
               	  +"<div class=\"rside\"><p class=\"price\">RMB&nbsp;&nbsp;"+(cargo.quote/100)+"/<b>"+cargo.quoteCompanyStr+"</b></p><p class=\"introduce\">"
               	  +(cargo.cargoName?(cargo.cargoName).substr(0,2):"&nbsp;")+"/"+cargo.weight+"吨/"+cargo.square+"立方</p>"
               	  +"<a id='bt_"+cargo.id +"'  class=\"js_AppleBtn\" href='javascript:void(0);' onclick=\"checksq('"+cargo.weight+"','"+cargo.square+"','"+cargo.id+"');\">申   请</a></div>"
               	  +"</div><div class=\"text\"><p>车辆要求："+carlengthset(cargo.carLength)+"&nbsp;&nbsp;&nbsp;&nbsp;"+cartypeset(cargo.carType) 
               	  + "</p><p>发货"+cargo.fhdsStr+"笔&nbsp;&nbsp;装货率"+cargo.zhlStr+"% &nbsp;&nbsp;结款率"+cargo.jklStr+"%&nbsp;&nbsp;</p></div>"+
               	"<div id=\""+cargo.id+"\" class=\"hidden_3 hidden js_hidden_3\"><div class=\"hide amend\"><ul class=\"clearfix\"><li class=\"li_1\"> "
               	+"我的申请:</li><li class=\"li_2\">"+carnumber+"</li><li class=\"li_3\">"+carlengh+"</li><li class=\"li_4\">"+cartype+"</li><li class=\"li_2\">接货"+fhbs+"笔"
               	+"</li><li class=\"li_6\"> 接货率<span>"+zhl+"% </span> </li>&nbsp;<li class=\"li_7\">交付率<span>"+jkl+"%</span></li></ul><p>"
               	+"价格<input onafterpaste=\"this.value=this.value.replace(/\/\/D/g,\'\')\" class=\"price\" id=\"danjia"+cargo.id+"\" type=\"text\">"+
               	"元/吨</p><p>数量<input   onblur=\"istnum(this);\" onafterpaste=\"istnum(this);\" class=\"number\" id=\"dun"+cargo.id+"\" type=\"text\">吨&nbsp;&nbsp;&nbsp;<span id=\"lifang"+cargo.id+"\"></span><span>立方</span><p class=\"total\">总价 "
               	+"<strong>RMB&nbsp;&nbsp;<span id=\"totle"+cargo.id+"\"></span></strong></p><div class=\"bttn\"><button class=\"sure js_sure\" onclick=\"applyorder('"+cargo.id+"','"+cargo.operateTime+"');\">确认申请</button><button class=\"cancel js_cancel\""+
               	"onclick=\"cancelchecksq(this,'"+cargo.id+"')\";>取消申请</button></div></div></div></div>"
               	  +"</div>";

                      if(chk(i)==="1"){
                    	  if(i+2< obj.length==false){
                    		  addhtml+="<div class=\"floor clearfix\" style=\"border-bottom:none;\"><div class=\"padd padd_r\">"+contentvar;
                    	  }else{
                    		  addhtml+="<div class=\"floor clearfix\"><div class=\"padd padd_r\">"+contentvar; 
                    	  }
                      }else if(chk(i)==="2"){
                    	  addhtml+="<div class=\"padd padd_l\">"+contentvar+"</div>";
                      }
                      if(i+1< obj.length==false && chk(i)==="1"){
                    	  addhtml+="</div>";
                      }
                  	}
                  $("#content").append(addhtml);
              } else {
                  //todo 没数据
              }
          } else {
              //todo 没数据
          }
      }

      function cartypeset(val){
      	  var cartype="";
      	  if(val==0){
      		     cartype="其它车型";
        	  }else if(val==7){
        		 cartype="箱式车";
        	  }else if(val==11){
        		 cartype="高栏车";
        	  }else if(val==4){
        		 cartype="不限车型";
        	  }else{
        		 cartype="平板、车";  
        	  }
      	 return cartype;
    }
    function carlengthset(val){
    	  var carlength="";
    	  if(val==0){
    	  		carlength="其它车长";
    	  	  }else if(val==1){
    	  		carlength="9.6米";
    	  	  }else if(val==2){
    	  		carlength="12米";
    	  	  }else if(val==4){
    	  		carlength="不限车长";
        	  }else{
    	  		carlength="17.5米";  
    	  	  }
    	  return carlength;
    }
      function checksq(weight,square,val){
    	  $(".hidden_3").hide();
    	  $("#danjia"+val).val("");
    	  $("#dun"+val).val("");
    	  $("#lifang"+val).html("");
    	  $("#totle"+val).html("");
    	    if('${jkl}'!=null && '${jkl}'!=""){
                $.post("/ajax/isCanPayCargoApplyIntegral.htm", {cargoId:val},
                       function (data) {
                           if (data.flag == 1 || data.flag == 2) {
                         	  //价格
                         	  $("#danjia"+val).bind("keyup",function(){
                         		 isMmoney( $("#danjia"+val).val());
                         		$("#danjia"+val).val($("#danjia"+val).val().replace(/\D/g,'')); 
                         		 
                         		  if($("#dun"+val).val()!=0){
                         			  $("#lifang"+val).html(((square/weight)*($("#dun"+val).val())).toFixed(0));   //10:5---2:1
                         			  $("#totle"+val).html(($("#dun"+val).val())*($("#danjia"+val).val()));
                         			  
                         			  $("#lifang"+val).val(((square/weight)*($("#dun"+val).val())).toFixed(2));
                         			  $("#totle"+val).val(($("#dun"+val).val())*($("#danjia"+val).val()));
                         		  }
                         		 
                            	 });
                          	  //数量
                         	  $("#dun"+val).bind("keyup",function(){
                         		  istnum(this);
                         		  if(Number($("#dun"+val).val())>Number(weight)){
                         			  alert("吨数超出货方的重量!");
                         			 $("#dun"+val).val("");
                         		  }else{
                             		  if($("#danjia"+val).val()!=0){
                             			  $("#lifang"+val).html(((square/weight)*($("#dun"+val).val())).toFixed(0));   //10:5---2:1
                             			  $("#totle"+val).html(($("#dun"+val).val())*($("#danjia"+val).val()));
                             			  
                             			  $("#lifang"+val).val(((square/weight)*($("#dun"+val).val())).toFixed(2));
                             			 $("#totle"+val).val(($("#dun"+val).val())*($("#danjia"+val).val()));
                             		  }  
                         		  }
                            	 });
                         	  
                         	  $("#"+val+"").show(400);
                         	  
                           } else if(data.msg == '请上传证件并等待通过审核!') {
                        	   alert('请上传证件并等待通过审核!');
                        	   window.location.href="/driver/getDriverInfo.htm";
                           }else{
                           	alert(data.msg);
                           }
                       },"json");
                return false;
            }else{
            	alert('请先登录');
            	  window.location.href="/login.htm";
                return false;
            }
    
      }
      
      function applyorder(val,optime){
    	  var paras= {cargoId:val, operateTime:optime, unitPrice:$("#danjia"+val).val(), count:$("#dun"+val).val(), totalPrice:$("#totle"+val).val()};
	  $.ajax({
          type: "POST",
          url: "/orders/driverEnsureApplyTrade.htm",
          data:paras,
          datatype:"json",
          success: function(msg)
          {
        	  var obj=eval('('+msg+')'); 
        	  if(obj.flag==1){
        		  alert("申请成功!");
        		  window.location.href="/orders/driverOrdersList.htm";
        		  //getCargo();
        	  }else if(obj.flag == -10){
        		  alert("该货源信息发生变化，请点击刷新获得最新信息");
        	  }else{
        		alert(obj.msg);  
        	  }
          }
          });
      }
      
      function cancelchecksq(obj,val){
    	  $("#"+val+"").hide(400);
      }
     	function isMmoney(obj){
    		if(obj.value>9999){
    			obj.value=obj.value.substr(0,obj.value.length-1);
    		}
    	}
    	function istnum(obj){
    		var reg =  /^\d{0,9}.\d{0,2}$/;
    		if(!reg.test(obj.value)){
    			obj.value=obj.value.substr(0,obj.value.length-1);
    		}
    		var values=obj.value.replace(/(.)(?=[^$])/g,"$1,").split(","); 
    		for(var c=0;c<values.length;c++){
    			var idReg=/^[0-9][0-9]*$/; 
    			 if (!idReg.test(values[c])&&values[c]!="."){
    			 	obj.value=obj.value.substr(0,obj.value.length-1);
    			 }
    			 if(c>0&&values[0]==0&&values.indexOf(".") == -1){
    			 	obj.value=obj.value.substr(0,0);
    			 }else if(values[0]==0&&values[1]==0){
    			 	obj.value=obj.value.substr(0,0);
    			 }else if(values.indexOf(".") != -1 && values[0]=="."){
    			 	obj.value="";
    			 }
    		}
    		 if(obj.value>999999999.99){
    			obj.value='';
    		}
    	}
      //奇偶结果
      function chk(num){ 
    	  return num?num%2?"2":"1":"1" 
    	} 
      //车长选择
     function searchcarlen(obj,val){
    	  sizeval=0;
    	 charlengthstr=val;
    	 getCargo();
      }
      //车型选择
     function searchcarstyle(obj,val){
    	  sizeval=0;
    	 cartypestr=val;
         getCargo();
      }
      //选择载重量
     function searchcarweight(obj,val){
    	  sizeval=0;
    	 whichstr="2";
    	 whichNostr=val;
         getCargo();
      } 
     //选择方量
     function searchcarsquare(obj,val){
    	  sizeval=0;
    	 whichstr="1";
    	 whichSqu=val;
         getCargo();
      } 
     //选择城市
     function searcharrivecity(obj,val){
    	  sizeval=0;
    	 arrivestr=val;
         getCargo();
     }
     //翻页
     function pagechange(obj,val,sizevals){
    	 pagevar=val;
    	 sizeval=sizevals;
         getCargo();
     }
     //pagediv
     function getPageList(pagesizemy){
    	 $('#pagebar').empty();
    	 //-4:首页;-1:上一页；-2：下一页；-3：尾页
    	 var addhtmlpage="";
    	 var pagevarInt=Number(pagevar);
    	 if(pagesizemy>5){
    	  // if(sizeval==-1){}else 
    		/*if(sizeval==3){//准备换页数字
    			 if()
    		 }else if(sizeval==4){//省略号后面的..
    			 
    		 }*/
    		 if(pagevarInt!=0){
    			    addhtmlpage+="<ul><li class=\"home p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+0+"\',\'"+0+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">&nbsp&nbsp</a></li>";//黑色todo:还未做
    				}else{
    			    addhtmlpage+="<ul><li class=\"home\"><a href=\"javascript:;\" ></a></li><li class=\"pgup\"><a href=\"javascript:;\" ></a></li>";//不是黑色	
    				}

    		 if(pagevarInt>=3 && (pagevarInt+2)<pagesizemy){
    			//中部
    			for (var i = 0; i <5; i++) {
    				 if(i==0){
    					  addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-2)+"\',\'"+(pagevarInt-2)+"\');return false;\">"+(pagevarInt-1)+"</a></li>";   
    				 }else if(i==1){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">"+(pagevarInt)+"</a></li>";  
    				 }else if(i==2){
    						 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+(pagevarInt+1)+"</a></li>";  
    				 }else if(i==3){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">"+(pagevarInt+2)
    						      +"</a></li><li class=\"excessive\"></li>";
    				 }else{
    					 if(pagesizemy>pagevarInt+7){
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+6)+"\',\'"+(pagevarInt+6)+"\');return false;\">"+(pagevarInt+7)+"</a></li>";  
    					 }else{
    						 addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(Number(pagesizemy)-1)+"\',\'"+(Number(pagesizemy)-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 
    					 }
    				 }
    			}
    			}else if(pagevarInt<3){
    				for (var i = 0; i <5; i++) {
    					 if(i==4){
    						 if(pagesizemy>10){
        						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+10+"\',\'"+10+"\');return false;\">"+10+"</a></li>";  
        					 }else{
        						 addhtmlpage+="<li class=\"excessive\"></li><li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 
        					 } 
    					 }else{
    					 if(i==sizeval || sizeval==-6){
    	    				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
    	    				 sizeval=-1;
    	    			 }else{
    	    				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
    	    			 }
    					 }
       			}
    			}else{//尾页
    				if(pagevarInt-4<=0){
    					addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+0+"\',\'"+0+"\');return false;\">"+1+"</a></li>"+"<li class=\"excessive\"></li>"; 		
    				}else{
    					addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt-5)+"\',\'"+(pagevarInt-5)+"\');return false;\">"+(pagevarInt-4)+"</a></li>"+"<li class=\"excessive\"></li>"; 	
    				}
    				
    				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-4)+"\',\'"+(pagesizemy-4)+"\');return false;\">"+(pagesizemy-3)+"</a></li>"; 	
    				addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-3)+"\',\'"+(pagesizemy-3)+"\');return false;\">"+(pagesizemy-2)+"</a></li>"; 	
    			    if((pagevarInt+1)==Number(pagesizemy)){
    			    	addhtmlpage+="<li ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
    			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+pagevarInt+"\',\'"+pagevarInt+"\');return false;\">"+pagesizemy+"</a></li>"; 	
    			    }else{
    			    	addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-2)+"\',\'"+(pagesizemy-2)+"\');return false;\">"+(pagesizemy-1)+"</a></li>";
    			    	addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">"+pagesizemy+"</a></li>"; 	
    			    }
    			}
    		 if(pagesizemy!=(pagevarInt+1)){
    			 addhtmlpage+="<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">&nbsp&nbsp</a></li></ul>";//不是黑色	
    			}else{
    				 addhtmlpage+="<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\"></a></li></ul>";//黑色todo:还未做	
    			}
    	 }else{//少于5页
    		 if(pagevarInt==0){
    			 addhtmlpage+="<ul><li class=\"home \"><a href=\"javascript:;\" ></a></li><li class=\"pgup \"><a href=\"javascript:;\"  ></a></li>"; 
    		 }else{
    			 addhtmlpage+="<ul><li class=\"home  p_active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+0+"\',\'"+0+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgup p_active\"><a href=\"javascript:;\"  onClick=\"pagechange(this,\'"+(pagevarInt-1)+"\',\'"+(pagevarInt-1)+"\');return false;\">&nbsp&nbsp</a></li>";  
    		 }
    		 for (var i = 0; i < pagesizemy; i++) {
    			 if(i==sizeval || sizeval==-6){
    				 addhtmlpage+="<li class=\"active\"><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>"; 
    				 sizeval=-1;
    			 }else{
    				 addhtmlpage+="<li><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+i+"\',\'"+i+"\');return false;\">"+(i+1)+"</a></li>";
    			 }
			}
    		 if(pagesizemy==(pagevarInt+1)){
    			 addhtmlpage+="<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\" ></a></li></ul>";
    		 }else{
    			 if(pagesizemy==0){
    				 addhtmlpage+="<li class=\"end \" ><a href=\"javascript:;\" ></a></li><li class=\"pgdn \"><a  href=\"javascript:;\" ></a></li></ul>"; 
    			 }else{
    				 addhtmlpage+="<li class=\"end p_active\" ><a href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagevarInt+1)+"\',\'"+(pagevarInt+1)+"\');return false;\">&nbsp&nbsp</a></li><li class=\"pgdn p_active\"><a  href=\"javascript:;\" onClick=\"pagechange(this,\'"+(pagesizemy-1)+"\',\'"+(pagesizemy-1)+"\');return false;\">&nbsp&nbsp</a></li></ul>"; 
    			 }
    		 }
    	 }
    	 $("#pagebar").append(addhtmlpage);
    	 
     }
      
</script>
    
</body>
</html>


</#escape> </#compress>
