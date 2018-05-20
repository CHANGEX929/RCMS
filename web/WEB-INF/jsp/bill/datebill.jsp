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

<title>日账单</title>



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
		<%@ include file="publicNav.jsp"%>
		<!-- 导航 -->

		<!-- 导航内容 -->
		<div class="tab-content ">
			<!-- 日账单 -->
			<div class="tab-pane active in" id="date">
				<div>
					<br />
					<div class="table-responsive" id="allDateBill">
						<table class="table table-striped table-bordered table-hover">
							<thead>
								<tr>
									<th class="text-center">当日开桌数</th>
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
							<tbody class="dateBillTbody">
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
												value="${billSummary.todayDate }" pattern="yyyy-MM-dd" /></td>
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
												href="${pageContext.request.contextPath }/dateBill.html?billType=date&show=bill&pageIndex=${bpager.pageIndex-1}&opr=${param.opr}&beginDate=<fmt:formatDate value="${bpager.beginDate }"
												pattern="yyyy-MM-dd" />&endDate=<fmt:formatDate value="${bpager.endDate }"
												pattern="yyyy-MM-dd" />">
													上一页 </a></li>
										</c:if>
										<li class="h2">${bpager.pageIndex }/${bpager.pageCount}</li>
										<c:if test="${bpager.pageIndex<bpager.pageCount }">
											<li class="next"><a
												href="${pageContext.request.contextPath }/dateBill.html?billType=date&show=bill&pageIndex=${bpager.pageIndex+1}&opr=${param.opr}&beginDate=<fmt:formatDate value="${bpager.beginDate }"
												pattern="yyyy-MM-dd" />&endDate=<fmt:formatDate value="${bpager.endDate }"
												pattern="yyyy-MM-dd" />">
													下一页 </a></li>
										</c:if>
									</ul>
								</c:if>
							</div>
							<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
						</div>
						<button class="btn btn-info chartBtn">查看近三十天账单曲线</button>
					</div>
				</div>
				<!-- row -->
				<div id="dateDeskBill" style="display: none;">
					<!-- 该处使用ajax将页面响应过来 -->
				</div>
				<!--/ row -->
			</div>
			<!-- /日账单 -->
		</div>
		<!-- /导航内容 -->

		<!-- 桌位消费详情弹框 -->
		<div class="modal fade" id="finalCustormDishes" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close " data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<p class="modal-title h1 text-center" id="myModalLabel">消费详情</p>
						<p class="h4 text-center">
							消费人数：<span id="billPeoNum" style="color:red;"></span> 支付方式：<span
								id="payType" style="color:red;"></span>
						</p>
					</div>
					<div class="modal-body col-lg-12">
						<table class="table table-hover table-striped ">
							<thead>
								<tr class="info" style="height:40px;">
									<td class="h3">菜名</td>
									<td class="h3">单价</td>
									<td class="h3">数目</td>
									<td class="h3">备注</td>
									<td class="h3">小计</td>
								</tr>
							</thead>
							<tbody id="billDetails">
							</tbody>
						</table>
						<div class="row">
							<p class="col-lg-4 h3 text-left">
								总计：￥<span id="totalBillMoney"></span>
							</p>
							<p class="col-lg-4 h3 text-center">
								折扣：<span id="discount" style="color:red;"></span>折
							</p>
							<p class="col-lg-4 h3 text-right">
								实付：￥<span id="afterDiscount" style="color:red;"></span>
							</p>
						</div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						 <button type="button" class="btn btn-danger" >打印</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /桌位消费详情弹框 -->
		<!--曲线图弹框 -->
		<div class="modal fade" id="dateChartModal" tabindex="-1"
			role="dialog" aria-labelledby="myModalLabel">
			<div class="modal-dialog modal-lg" role="document">
				<div class="modal-content">
					<div class="modal-body col-lg-12">
						<button type="button" class="close " data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<div id="dateChart"
							style="width: 825px; height: 600px; margin: 0 auto;"></div>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					</div>
				</div>
			</div>
		</div>
		<!-- /曲线图弹框 -->
	</div>
	<!-- /主体内容 -->
	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- 尾文件 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/calendar/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/highChart.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/dateChart.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bill.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/dateBill.js"></script>
</body>
</html>
