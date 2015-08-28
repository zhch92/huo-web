<#compress > <#escape x as x?html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>货管家-唯有可靠-门店</title>
     <link rel="stylesheet" href="http://192.168.2.50:8089/staticstop/css/reset.css">
    <link rel="stylesheet" href="http://192.168.2.50:8089/staticstop/css/style.css">
    <script type="text/javascript" src="http://192.168.2.50:8089/staticstop/js/jquery.js"></script>
    
</head>

<body>
    <div class="header">
        <div class="head clearfix">
            <div class="logo"><img src="http://192.168.2.50:8089/staticstop/images/logo.png" alt=""></div>
            <div class="code">
                把可靠货源装进口袋
            </div>
        </div>
    </div>
    <div class="content">
        <div id="demo">
            <div id="demo1" class="main">
            
            <#list cargoList as cargo>
              <#if cargo_index==0 || cargo_index==3 || cargo_index==6 || cargo_index==9 || cargo_index==12 || cargo_index=15
                       || cargo_index==18  || cargo_index==21  || cargo_index==24  || cargo_index==27 || cargo_index==30 || cargo_index==33>
               <div class="floor clearfix">
               </#if>
               
                <div class="item clearfix">
                        <div class="lside">
                            <table>
                                <tr class="tr_1">
                                    <td width="125"><span>${cargo.cityStr}</span> </td>
                                    <td width="90"><img src="http://192.168.2.50:8089/staticstop/images/r.png" alt=""></td>
                                    <td width="125"><span>${cargo.arrivalCityStr}</span> </td>
                                </tr>
                                <tr class="tr_2">
                                    <td>${dict("citryMap",cargo.county)} </td>
                                    <td></td>
                                    <td>${dict("citryMap",cargo.county)}</td>
                                </tr>
                                <tr class="tr_3">
                                    <td>${cargo.sendTimeStr}</td>
                                    <td></td>
                                    <td>${cargo.arrivalTimeStr}</td>
                                </tr>
                            </table>
                            <div class="text">
                                <p>车型要求<span>
                                 <#if cargo.carLength==0>其它车长
                                  <#elseif cargo.carLength==1>9.6米
                                   <#elseif cargo.carLength==2>12米
                                    <#elseif cargo.carLength==3>17.5米
                                     <#elseif cargo.carLength==4>不限车长
                                 <#else></#if>
                                 <#if cargo.carType==0>其它车型
                                  <#elseif cargo.carType==7>箱式车
                                   <#elseif cargo.carType==1>平板车
                                    <#elseif cargo.carType==4>不限车型
                                     <#elseif cargo.carType==11>高栏车
                                 <#else></#if></span> </p>
                                <p>发货${cargo.fhdsStr}笔 &nbsp;装货率${cargo.zhlStr}% &nbsp;结款率 ${cargo.jklStr}%</p>
                            </div>
                        </div>
                        <div class="introduce">
                            <p class="price"> <span>RMB ${cargo.quote}</span>/吨 </p>
                            <p class="kind">${cargo.cargoName}/${cargo.weight}吨/${cargo.square}立方</p>
                            <p class="number">编号&nbsp;${cargo.cargoNo}</p>
                        </div>
                    </div>
               
              <#if cargo_index==2 || cargo_index==5 || cargo_index==8 || cargo_index==11 || cargo_index==14 || cargo_index==17 
                || cargo_index==20 || cargo_index==23 || cargo_index==26 || cargo_index==29 || cargo_index==32|| cargo_index==35>
              </div> 
              </#if>
                </#list>
                
            </div>
            <div class="main" id="demo2"></div>
        </div>
    </div>
    <script>
    $(document).ready(function() {
        var speed = 8000;

        var h = $("#demo1").height();
        var box = $("#demo").height();

        if (h > box) {


            function autPlay() {
                var top = Math.abs($("#demo1").position().top);
                top += 552;
                if (top >= h) {
                    $("#demo1").animate({
                        top: "0"
                    }, 1)
                } else {
                    $("#demo1").animate({
                        top: "-=226px"
                    }, 380)

                }

            }
            var MyMar = setInterval(autPlay, speed)
        }
    })
    
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
    </script>
</body>

</html>
</#escape> </#compress>