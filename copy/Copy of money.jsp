<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<%@ include file="/common/header.jspf"%>
<title>天行数科账单管理系统</title>
</head>
<body>
	<div id="money">
		<div class="container_zhang">
			<ul>
				<li><a href="${basePath}select.action">我要查看余额</a></li>
				<li><a href="${basePath}use.action">我要查看统计报表</a></li>
			</ul>
			<a class="tx-back" href="${basePath}index.action">返回目录页</a>
			<div class="main">
				<div class="input">
					<label for="start">开始时间<input type="date" id="start"
						class="start" value="2016-07-01" /></label> <label for="end">结束时间<input
						type="date" id="end" class="end" value="2016-07-31" /></label>
					<button id="getBill">获取账单</button>
					<button id="getExcel">导出账单</button>
				</div>
				<br>
				<table id="accountDetail" style="align:center;">
					<tr>
						<th>序号</th>
						<th>接口名称</th>
						<th>日期</th>
						<th>条数</th>
						<th>单价</th>
						<th>总价</th>
					</tr>
				</table>
				<div class="pageBox">
					
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		$(function(){
			var jsonObject = {
					startDate : $("#start").val(),
					endDate : $("#end").val(),
					//account : '51bx',
					start : 1
				}
				getBillDetail(jsonObject);
		});
		$("#getBill").click(function() {
			var jsonObject = {
				startDate : $("#start").val(),
				endDate : $("#end").val(),
				//account : '51bx',
				start : 1
			}
			getBillDetail(jsonObject);
		});

		$("#getExcel").click(function() {
			var url = 'bill/getBillExcel.action?startDate='+$("#start").val()+'&endDate='+$("#end").val();
			window.open(url);
		});

		var getBillDetail = function(jsonObject) {
			$("tr:gt(0)").remove();
			$("#accountDetail").append("<p style='position: relative;top: 165px;left: 310px;'><img  src='img/ajax-loader.gif'  width='20' height='20'/></p>");
			$.getJSON("bill/getBills.action", jsonObject, function(data) {
				console.log(data);
				if (data.totalCount == 0) {
					alert("该段时间内没有查询记录");
					return;
				}
				var table = "";
				$.each(data.items, function(i, n) {
					table += "<tr class='content'>";
					for ( var i in n) {
						if (i != 'api3rd_id') {
							table += "<td>";
							table += n[i];
							table += "</td>";
						}
					}
					table += "</tr>";

				});
				console.log(table);
				$("#accountDetail p").remove();
				$("#accountDetail").append(table);
				var jsonObject = {
					currentPageNo : data.pageNo,
					totalPageNo : data.totalPageCount
				}
				createPage(jsonObject);
			});
		}

		var jsonObject = {
			currentPageNo : 16,
			totalPageNo : 100
		}
		/*
		渲染十个分页按钮
		当前页    总页
		  1    1-10   总也是否小于10
		  2   1-10   总也是否小于10
		  ······
		  5     1-10  总页是否小于10
		  8     8-5=3   3+10=13  总也是否小于13
		  
		
		 */
		var createPage = function(jsonObject) {
			if (jsonObject.currentPageNo && jsonObject.totalPageNo) {
				$(".pageBox > a").remove();
				var html = "<a onclick='myNextPage(" + 1
						+ ")' class='pageBtn'>首页</a>";
				if (jsonObject.currentPageNo <= 5) {
					if (jsonObject.totalPageNo < 10) {
						for (var i = 1; i <= jsonObject.totalPageNo; i++) {
							html += "<a onclick='myNextPage(" + i + ")' >" + i
									+ "</a>";
						}
					} else {
						for (var i = 1; i < 10; i++) {
							html += "<a onclick='myNextPage(" + i + ")'>" + i
									+ "</a>";
						}
					}
				} else {
					var firstPage = jsonObject.currentPageNo - 5;
					var lastPage = parseInt(jsonObject.currentPageNo) + 4;
					if (jsonObject.totalPageNo < lastPage) {
						for (var i = firstPage; i <= jsonObject.totalPageNo; i++) {
							html += "<a onclick='myNextPage(" + i + ")'>" + i
									+ "</a>";
						}
					} else {
						for (var i = firstPage; i <= lastPage; i++) {
							html += "<a onclick='myNextPage(" + i + ")'>" + i
									+ "</a>";
						}
					}
				}
				html += "<a onclick='myNextPage(" + jsonObject.totalPageNo
						+ ")' class='pageBtn'>尾页</a>";
				$(".pageBox").append(html);
				console.log(html);
			    $("a:contains(" + jsonObject.currentPageNo + ")").addClass("active");
			}
		}
		//createPage(jsonObject);

		var myNextPage = function(index) {
			var jsonObject = {
				startDate : $("#start").val(),
				endDate : $("#end").val(),
				//account : '51bx',
				start : index
			}
			getBillDetail(jsonObject);
		}
	</script>
</body>
</html>