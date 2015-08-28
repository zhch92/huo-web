<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>货管家大屏幕</title>
<link href="http://192.168.2.50:8089/static/led/css/style.css" rel="stylesheet" media="screen" type="text/css">
<script type="text/javascript"  src="http://192.168.2.50:8089/static/led/js/jquery-1.7.2.min.js"></script>
<script type="text/javascript"  src="http://192.168.2.50:8089/static/led/js/jquery_public.js"></script>
<script type="text/javascript" src="http://192.168.2.50:8089/static/led/js/jquery.qrcode.min.js"></script>
</head>
<body class="hidden">

<table class="content">
	<thead>
		<tr>
			<th class="frist1">出发地　　-------　　目的地</th>
			<th class="frist2">价格</th>
			<th class="frist3">货物信息</th>
			<th class="frist4">车长</th>
			<th class="frist5 ">接货时间</th>
			<th class="frist6">扫码拉货</th>
		</tr>
	</thead>
</table>
<div id="mq">
<table class="content">
	<tbody>
	<#if cargos?? >
		<input id="rowNum" type="hidden" value="${cargos?size}" />
		<#list cargos as cargo>
        	<tr>
				<td class="frist1">
					<div class="cityBox">
						<div class="cityLeft">
								<#if cargo.city?? && (dict('citryMap',cargo.city)?trim?length gt 4)>
			                		${dict('citryMap',cargo.city)?substring(0,4)}...
			                	<#else>
			                		${dict("citryMap",cargo.city)} 
			                	</#if>
		                	<span class="ft26 ml5">
		                		<#if cargo.county?? && dict('citryMap',cargo.county)?trim?length gt 4>
			                		${dict('citryMap',cargo.county)?substring(0,4)}...
			                	<#else>
			                		${dict("citryMap",cargo.county)} 
			                	</#if>
		                	</span></div>
						<div class="cityRight">
							<#if cargo.arrivalCity?? && dict('citryMap',cargo.arrivalCity)?trim?length gt 4>
		                		${dict('citryMap',cargo.arrivalCity)?substring(0,4)}
		                	<#else>
		                		${dict('citryMap',cargo.arrivalCity)}
		                	</#if>
							<span class="ft26 ml5">
							<#if cargo.arrivalCounty?? && dict('citryMap',cargo.arrivalCounty)?trim?length gt 4>
		                		${dict('citryMap',cargo.arrivalCounty)?substring(0,4)} 
		                	<#else>
		                		${dict('citryMap',cargo.arrivalCounty)}
		                	</#if>
							</span></div>
					</div>
				</td>
				<td class="frist2"><font class="red moneyNum"><span class="font_family">${(cargo.quote/100)?string("##0.##")}</span><span class="ft26">元</span></font><span class="ft26"><font class="font_family font_xie">/</font>${dict("cargo_quote_company",cargo.quoteCompany)}</span></td>
				<td class="frist3">
						<font class="huoyuan_more">
						<span class="font_family blue numStyle">${cargo.weight}</span>
						<span class="blue dw">t</span>
						<font class="font_family font_xie">/</font>
						<span class="font_family fangSize">${cargo.square}</span>
						<span>方
						<font class="font_family font_xie">/</font>${cargo.cargoName}</span></font>
				</td>
				<td class="frist4">
					<#if cargo.carLength==''>
						<font class="font_family">不限</font>
					<#elseif cargo.carLength?? &&  (cargo.carLength)?length gt 0>
						<font class="font_family">${dict('cargo_carlength',cargo.carLength)}</font>
					</#if>
				</td>
				<td class="frist5">${cargo.sendTime?string("MM 月 dd 日")}</td>
				<td class="frist6 blue"><div class="outputqrcode" cargoid="${cargo.id}"></div></td>
			</tr>
        </#list>
        <#else>
        	<h3>暂无货源</h3>
        	<#--
        	<div style="padding-left:10px;" id="outputqrcodeApk" cargoid="http://192.168.2.50:8089/hgjapk/apk/lahuo8.apk"></div>
        	<br/>
        	<div style="padding-left:10px;" id="outputqrcodeApk1" cargoid="http://lahuo8.com/downapk.htm"></div>
        	-->
        </#if>
	</tbody>
</table></div>
<script>
	if($("#rowNum").val()>6){
		var oMarquee = document.getElementById("mq"); //滚动对象
		var iLineHeight = 222; //单行高度，像素
		var iLineCount = $("#rowNum").val()/2; //实际行数
		var iScrollAmount = 1; //每次滚动高度，像素
		function run() {
			oMarquee.scrollTop += iScrollAmount;
			if ( oMarquee.scrollTop == iLineCount * iLineHeight )
			oMarquee.scrollTop = 0;
			if ( oMarquee.scrollTop % iLineHeight == 0 ) {
			window.setTimeout( "run()", 15000 );
			} else {
			window.setTimeout( "run()", 1 );
			}
		}
		oMarquee.innerHTML += oMarquee.innerHTML;
		window.setTimeout( "run()", 15000 );
	};
	$(document).ready(function(){
 		
 		$('.outputqrcode').each(function(){
 			var cargoid = $(this).attr("cargoid");
 			$(this).qrcode({
 				render: "canvas", //canvas方式 
		    	width: 100, //宽度 
		    	height: 100, //高度
		    	correctLevel : 3,//纠错等级 
		 		text: cargoid
 			});
 		});
 		<#--
 		$('#outputqrcodeApk').qrcode({
			render: "canvas", //canvas方式 
	    	width: 108, //宽度 
	    	height: 108, //高度
	    	correctLevel : 3,//纠错等级 
	 		text: $('#outputqrcodeApk').attr("cargoid")
		});
		$('#outputqrcodeApk1').qrcode({
			render: "canvas", //canvas方式 
	    	width: 108, //宽度 
	    	height: 108, //高度
	    	correctLevel : 3,//纠错等级 
	 		text: $('#outputqrcodeApk1').attr("cargoid")
		});
 		-->
	 });
</script>
</body>
</html>