<#compress >
    <#escape x as x?html>
   <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>修改货源-货管家</title>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/reset.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/statics/js/laydate.js"></script>
    <link rel="stylesheet" href="http://192.168.2.50:8089/statics/css/info.css">
    <script type="text/javascript"  src="http://192.168.2.50:8089/static/js/jquery-1.7.2.min.js"></script>
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
    <div class="content">
        <div class="logo">
           <a href="/index.htm"> <img src="http://192.168.2.50:8089/statics/images/logo.png" alt=""></a>
        </div>
        <div class="main">
            <h3>修改货源</h3>
            <div class="basic_info">
                <ul>
                    <li>货物类型
                        <input class="mold" type="text"  maxlength="4" name="cargoName" id="cargoName"  placeholder="少于4个字" value="${cargo.cargoName}">
                    </li>
                    <li>货物价格
                          <input type="text" id="quote" name="quote" class="f_text" onblur="countTotal();"  onkeyup="this.value=this.value.replace(/\D/g,'');isMmoney(this);" 
                           onafterpaste="this.value=this.value.replace(/\D/g,'')">元/吨</li>
                    <li>货物重量
                          <input type="text" id="weight" name="weight" class="f_text" onblur="countTotal();" onkeyup="istnum(this);"  value="${cargo.weight}" onafterpaste="istnum(this);">吨
                         <input type="text" id="square" name="square" class="f_text" onblur="istnum(this);" onkeyup="istnum(this);" value="${cargo.square}"  onafterpaste="istnum(this);">立方</li>
                         <li class="introduce_color" style="padding-left:75px">总价：<span id="totalprice"></span>元</li>
                    <li>车长要求
                        <select name="carLength" id="carLength">
                            <option value="0">不限</option>
                            <option value="1">9.6m</option>
                            <option value="2">12m</option>
                            <option value="3">17.5m</option>
                            <option value="4">其它</option>
                        </select>
                    </li>
                    <li>车型要求
                        <select name="carType" id="carType">
                            <option value="0">不限</option>
                            <option value="7">箱式车</option>
                            <option value="11">高栏车</option>
                            <option value="1">平板车</option>
                            <option value="4">其它</option>
                        </select>
                    </li>
                </ul>
            </div>
            <div class="adress_info">
                <ul>
                    <li class="date id="start" ">接货日期
                         <input class="inline laydate-icon" id="start" value="${cargo.sendTime}"   type="text" >
                    </li>
                    <input id="area1" name="area1" value="" type="hidden">
                    <input id="area" name="area" value="" type="hidden">
                    <li class="adress">接货地址&nbsp;&nbsp;&nbsp;&nbsp;
                          <span id="adrsssend"></span>
                        <br>
                        <input type="text" class="l_text" id="startAdd" name="startAdd" maxlength="60" value="${cargo.startAdd}">
                    </li>
                    <li class="date">到货日期
                         <input class="inline laydate-icon" id="end"  value="${cargo.arrivalTime}"  type="text" >
                    </li>
                    <li class="adress">到货地址 &nbsp;&nbsp;&nbsp;&nbsp;
                          <span id="adrssarrd"></span>
                        <br>
                       <input type="text" class="l_text" id="arrivalAdd" name="arrivalAdd" maxlength="60" value="${cargo.arrivalAdd}">
                    </li>
                </ul>
                <p class="bttn">
                    <button class="cancel" onclick="javascript:history.back(-1);">取消</button>
                    <button class="sure" style="margin-right:32px" onclick="saveCargo();">确定</button>
                </p>
            </div>
            <input type="hidden" id="province1" value="${cargo.arrivalProvince}">
            <input type="hidden" id="city1" value="${cargo.arrivalCity}">
            <input type="hidden" id="county1" value="${cargo.arrivalCounty}">
            <input type="hidden" id="province" value="${cargo.province}">
            <input type="hidden" id="city" value="${cargo.city}">
            <input type="hidden" id="county" value="${cargo.county}">
        </div>
    </div>
    <div class="footer">
        <div class="foot">
            <p><img src="http://192.168.2.50:8089/statics/images/logo_1.png" alt="">© 2014 HUO68.COM 成都星期五科技有限公司 版本所有 蜀ICP备15006511号-1</p>
        </div>
    </div>
    <script type="text/javascript" src="http://192.168.2.50:8089/static/js/dq.js"></script>
<script type="text/javascript" src="http://192.168.2.50:8089/static/js/dqcopy.js"></script>
    <script>
    $(document).ready(function () {
    	$("#quote").val('${cargo.quote}'/100);
        $("#carLength").val('${cargo.carLength}');
        $("#carType").val('${cargo.carType}');
        $("#adrsssend").html("&nbsp;"+getSingleArea('${cargo.province}')+"&nbsp;&nbsp;"+getSingleArea('${cargo.city}')+"&nbsp;&nbsp;"+getSingleArea('${cargo.county}'));
        $("#adrssarrd").html("&nbsp;"+getSingleArea('${cargo.arrivalProvince}')+"&nbsp;&nbsp;"+getSingleArea('${cargo.arrivalCity}')+"&nbsp;&nbsp;"+getSingleArea('${cargo.arrivalCounty}'));
    });
    
    function saveCargo(){
		var cargoName=$.trim($("#cargoName").val());	
		var quote=$.trim($("#quote").val());	
		var weight=$.trim($("#weight").val());	
		var square=$.trim($("#square").val());	
		var carLength=$.trim($("#carLength").val());	
		var carType=$.trim($("#carType").val());	
		var start=$.trim($("#start").val());	
		var startAdd=$.trim($("#startAdd").val());	
		var end=$.trim($("#end").val());	
		var arrivalAdd=$.trim($("#arrivalAdd").val());	
		
		var province1=$.trim($("#province1").val());	
		var city1=$.trim($("#city1").val());	
		var county1=$.trim($("#county1").val());
		var province=$.trim($("#province").val());	
		var city=$.trim($("#city").val());	
		var county=$.trim($("#county").val());	
		
		if(cargoName=="" || cargoName==0){
			alert("货物类型不能为空或为0!");
			return;
		}
		if(quote=="" || quote==0){
			alert("货物价格不能为空或为0!");
			return;
		}
		if(weight=="" || weight==0){
			alert("货物重量不能为空或为0!");
			return;
		}
		if(square=="" || square==0){
			alert("货物方量不能为空或为0!");
			return;
		}
		if(start=="" || start==0){
			alert("接货日期不能为空!");
			return;
		}
		if(end=="" || end==0){
			alert("到货日期不能为空!");
			return;
		}
		if(!checkTwoDate( start,end )){
			return;
		}
		start=start+" 20:00:00";
		end=end+" 20:00:00";
		var paras={cargoId:'${cargo.id}',cargoName:cargoName,quote:quote,weight:weight,square:square,carLength:carLength,carType:carType,sendTime:start,arrivalTime:end,
				province:province,city:city,county:county,startAdd:startAdd,arrivalProvince:province1,arrivalCity:city1,arrivalCounty:county1,arrivalAdd:arrivalAdd,
				shelve:1,sendTimeStr:start,arrivalTimeStr:end};
	 	$.ajax({
            type: "POST",
            url: "/ajax/updateCargoByStep.htm",
            data:paras,
            datatype:"json",
            success: function(data){
            	  var obj=eval('('+data+')'); 
                if(obj.flag == 1){
			    	alert("修改货源并发布成功!");
			    	 window.location.href="/orders/cargoerOrdersList.htm"; 
			    }else{
			    	alert(obj.msg);
			    }
            }
            });
    }
    function quit(){
    	 window.location.href="/orders/cargoerOrdersList.htm";
    }
    
    //算总价
    function countTotal(){
		var wnum=$("#weight").val();
		var per=$("#quote").val();
		if(wnum!=""&&per!=""){
				$("#totalprice").html((wnum*per).toFixed(2));
		}
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
    
    	//日期比较
    	function checkTwoDate( startDate,endDate ) {
		startDate = $.trim(startDate);
		endDate = $.trim(endDate);
		var now= new Date();
		var s=now;
		if(startDate<s){
			alert("接货日期不能早于当前日期","提示");
			return false;
		}
		if(endDate<s){
			alert("到货日期不能小于当前日期!");
			return false;
		}
		if( startDate > endDate ) {
			alert("接货日期不能大于到货日期!","提示");
			return false;
		}
		return true;
	} 
    
    
       var start = {
        elem: '#start', 
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16 00:00:00',
        istime: false,
        istoday: false

    };
    laydate(start);
      var end = {
        elem: '#end',
        format: 'YYYY-MM-DD',
        min: laydate.now(),
        max: '2099-06-16 00:00:00',
        istime: false,
        istoday: false

    };
    laydate(end);
    
    </script>
</body>

</html>

    </#escape>
</#compress>