<#compress >
    <#escape x as x?html>

        <#if Request["errorinfo"]?exists>
        	${Request["errorinfo"]}
        <#else>
       		 系统繁忙，请稍候再试
        </#if>
        <#if Request["url"]?exists>
       		 <a href="${url}">点击返回</a>
       	<#else>
       		<a href="/login.htm">返回首页</a>
       	</#if>
    </#escape>
</#compress>