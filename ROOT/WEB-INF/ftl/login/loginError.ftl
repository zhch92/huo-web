<#compress >
    <#escape x as x?html>
       	${errormsg!'用户信息错误，请稍候再试'}
        <#if Request["url"]?exists>
       		 <a href="${url}">点击返回</a>
       	<#else>
       		<a href="/login.htm">返回首页</a>
       	</#if>
    </#escape>
</#compress>