<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/common/header.jspf"%>
<title>天行数科账单管理系统</title>
</head>
<body>

<div id="select">
    <div class="container_cha">
        <ul>
			<li><a href="${basePath}use.action">我要查看统计报表</a></li>
			<li><a href="${basePath}money.action">我要查看帐单详情</a></li>
		</ul>
		<a class="tx-back" href="${basePath}index.action">返回目录页</a>
        <div class="tip1 changeCol">贵公司当前余额为<span id="tip1currentBalance"><img src="img/ajax-loader.gif"/></span>元</div>
        <div class="tip2 changeCol">您当前的余额可使用<span id="tip3PredictDay" ><img src="img/ajax-loader.gif" alt=""/></span>天</div>
        <div class="tip3 changeCol">贵公司于<span id="createTimeId" ><br/><img src="img/ajax-loader.gif" alt=""/><br></span>成为天行合作伙伴</div>
    </div>
</div>

	<script type="text/javascript">
		$(function(){
			$.ajax({
		        type: "post",
		        url: "bill/getCurrentPredict.action",
		        success: function(msg) {
		        	/* $("div.tip1").children().eq(0).val(msg.currentBalance); */
		        	$("#tip1currentBalance").html(msg.currentBalance);
		        	
		        	/* $("div.tip2").children().eq(0).val(msg.currentBalance); */
		        	$("#createTimeId").html("<br/>"+msg.creatDate+"<br/>");
		        	
		        	/* $("div.tip3").children().eq(0).val(msg.predict);  */
		        	$("#tip3PredictDay").html(msg.predict);
		        }
		    });
		})
	</script>
</body>
</html>