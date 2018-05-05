<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>年账单</title>



</head>

<body>
	<!-- 头文件 -->
	<%@ include file="../command/head.jsp"%>
	<!-- /头文件 -->
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
		</div>
	</div>
	<hr />
	<!-- /标题 -->

	<!-- 主体内容 -->
	<div class="col-lg-12 billBody" style="display:none;">
		
		<!-- 导航 -->
		<%@ include file="publicNav.jsp" %>
		<!-- 导航 -->		

		<!-- 导航内容 -->
		<div class="tab-content">
			<!-- 年账单 -->
			<div class="tab-pane active in" id="year">
				<br />
				<table class="table table-striped table-bordered table-hover">
					<thead>
					<tr>
						<th class="text-center">当年开桌数</th>
						<th class="text-center">现金</th>
						<th class="text-center">移动支付</th>
						<th class="text-center">刷卡</th>
						<th class="text-center">挂账</th>
						<th class="text-center">折扣</th>
						<th class="text-center">实际收入</th>
						<th class="text-center">消费合计</th>
						<th class="text-center">日期</th>
					</tr>
					</thead>
					<tbody>
					<c:forEach items="${bpager.list }" var="billSummary">
						<tr date="<fmt:formatDate
												value="${billSummary.todayDate }" pattern="yyyy-MM-dd" />">
							<td class="text-center">${billSummary.totalCount }</td>
							<td class="text-center">￥<fmt:formatNumber type="number"
																	   value="${billSummary.cash }" pattern="0.00"
																	   maxFractionDigits="2"></fmt:formatNumber></td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.mobilePay }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber>
							</td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.byBank }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber>
							</td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.debtorMoney }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber></td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.discountMoney }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber>
							</td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.totalMoney }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber>
							</td>
							<td class="text-center">￥ <fmt:formatNumber type="number"
																		value="${billSummary.realMoney }" pattern="0.00"
																		maxFractionDigits="2"></fmt:formatNumber>
							</td>
							<td class="text-center"><fmt:formatDate
									value="${billSummary.todayDate }" pattern="yyyy"/></td>
						</tr>
					</c:forEach>
					</tbody>
				</table>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
					<div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
						<c:if test="${bpager.pageCount!=1 }">
							<ul class="pager">
								<c:if test="${bpager.pageIndex>1 }">
									<li class="previous"><a
											href="${pageContext.request.contextPath }/yearBill.html?billType=year&show=bill&pageIndex=${bpager.pageIndex-1}">
										上一页 </a></li>
								</c:if>
								<li class="h2">${bpager.pageIndex }/${bpager.pageCount}</li>
								<c:if test="${bpager.pageIndex<bpager.pageCount }">
									<li class="next"><a
											href="${pageContext.request.contextPath }/yearBill.html?billType=month&show=bill&pageIndex=${bpager.pageIndex+1}">
										下一页 </a></li>
								</c:if>
							</ul>
						</c:if>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
				</div>
				<br />
				<%--<div id="yearChart"
					style="width: 550px; height: 400px; margin: 0 auto;border:1px solid gray;"></div>--%>

			</div>
			<!--/ 年账单 -->

		</div>
		<!-- /导航内容 -->
	</div>
	<!-- /主体内容 -->

	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- 尾文件 -->
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/calendar/WdatePicker.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/highChart.js"></script>
	<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/char.js"></script>
	<script type="text/javascript">
        $(".billBody").slideDown(500);
	</script>
</body>
</html>
