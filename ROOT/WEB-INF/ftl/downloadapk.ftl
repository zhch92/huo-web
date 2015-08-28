<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
     <script type="text/javascript"  src="http://192.168.2.50:8089/static/js/jquery-1.7.2.min.js"></script>
    <title>点击下载货管家APP</title>
</head>
<body>
   <p style=" text-align: center;padding-top: 100px;" id="wizard"><img src="http://192.168.2.50:8089/statics/images/wx.png" alt=""></p>
   <script type="text/javascript">
   $(document).ready(function(){
	     var ua = navigator.userAgent.toLowerCase();
	     if(ua.match(/MicroMessenger/i)=="micromessenger") {
	       return true;
	    	} else {
	    	 $("#wizard").hide();
	    	 window.location.href="http://192.168.2.50:8089:8089/apk/huo68.apk";
	       return false;
	     }
		 });
   </script>
</body>
</html>