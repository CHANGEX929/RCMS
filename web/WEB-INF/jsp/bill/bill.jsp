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
<title>账单</title>
</head>
<body>
	<!-- 头文件 -->
	<%@ include file="../command/head.jsp"%>
	<!-- /头文件 -->

	<!-- 标题 -->
	<hr />
	<!-- /标题 -->


	<!-- 主体内容 -->
	<div class="col-lg-12  billBody" style="display: none;">
		<!-- 导航 -->
		<%@ include file="publicNav.jsp"%>
		<!-- 导航 -->

		<!-- 导航内容 -->
		<div class="tab-content">
			<!-- 今日账单 -->
			<div class=" tab-pane fade active in" id="today">
				<div>
					<br />
					<div class="table-responsive">
						<table class="table table-striped table-bordered ">
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
							<tbody>
								<c:if test="${empty billSummarys}">
									<tr>
										<td  class="text-center">0</td>
										<td  class="text-center">￥0.0</td>
										<td  class="text-center">￥0.0
										</td>
										<td  class="text-center">￥0.0
										</td>
										<td  class="text-center">￥0.0</td>
										<td  class="text-center">￥0.0
										</td>
										<td  class="text-center">￥0.0
										</td>
										<td  class="text-center">￥0.0
										</td>
										<jsp:useBean id="now" class="java.util.Date" scope="page"/>
										<td  class="text-center"><fmt:formatDate value="${now }"
																				 pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:if>
								<c:forEach items="${billSummarys }" var="billSummary">
									<tr>
										<td  class="text-center">${billSummary.totalCount }</td>
										<td  class="text-center">￥<fmt:formatNumber type="number"
												value="${billSummary.cash }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber></td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.mobilePay }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber>
										</td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.byBank }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber>
										</td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.debtorMoney }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber></td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.discountMoney }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber>
										</td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.totalMoney }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber>
										</td>
										<td  class="text-center">￥ <fmt:formatNumber type="number"
												value="${billSummary.realMoney }" pattern="0.00"
												maxFractionDigits="2"></fmt:formatNumber>
										</td>
										<td  class="text-center"><fmt:formatDate value="${billSummary.todayDate }"
												pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!-- row -->
				<div class="row text-center pad-top">
					<c:forEach items="${deskBillpager.list}" var="deskBill">
						<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
							<div class="div-square">
								<a class="btn billDetailBtn"> <i
									class="fa fa-circle-o-notch fa-5x" deskBillId="${deskBill.id }"
									discount="${deskBill.discount }"
									billPeoNum="${deskBill.peopleNum }"
									payType="${deskBill.payType}" debtor="${deskBill.debtor }"></i>
									<h4>${deskBill.deskCode }</h4>
									<h5 style="color:#EB853E;">
										<fmt:formatDate value="${deskBill.createDate }"
											pattern="HH:mm" />
									</h5>
								</a>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="row">
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
					<div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
						<c:if test="${deskBillpager.pageCount!=1 and deskBillpager.pageCount!=0 }">
							<ul class="pager">
								<c:if test="${deskBillpager.pageIndex>1 }">
									<li class="previous"><a
										href="${pageContext.request.contextPath }/todayBill.html?billType=today&show=bill&pageIndex=${deskBillpager.pageIndex-1}">
											上一页 </a></li>
								</c:if>
								<li class="h2">${deskBillpager.pageIndex
									}/${deskBillpager.pageCount}</li>
								<c:if test="${deskBillpager.pageIndex<deskBillpager.pageCount }">
									<li class="next"><a
										href="${pageContext.request.contextPath }/todayBill.html?billType=today&show=bill&pageIndex=${deskBillpager.pageIndex+1}">
											下一页 </a></li>
								</c:if>
							</ul>
						</c:if>
					</div>
					<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
				</div>
				<!-- /row -->
			</div>
			<!-- 今日账单 -->
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
	</div>
	<!-- /主体内容 -->
	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- 尾文件 -->
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/calendar/WdatePicker.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/highChart.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/assets/js/char.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/bill.js"></script>
</body>
</html>