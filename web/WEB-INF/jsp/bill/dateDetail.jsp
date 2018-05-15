<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<div>
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
				<c:forEach items="${billSummarys }" var="billSummary">
					<tr>
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
	</div>
</div>
<div class="row text-center pad-top deskBillbody" style="display:none ">
	<c:forEach items="${deskBillpager.list}" var="deskBill">
		<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6">
			<div class="div-square">
				<a class="btn billDetailBtn"> <i
					class="fa fa-circle-o-notch fa-5x" deskBillId="${deskBill.id }"
					discount="${deskBill.discount }"
					billPeoNum="${deskBill.peopleNum }" payType="${deskBill.payType}"
					debtor="${deskBill.debtor }"></i>
					<h4>${deskBill.deskCode }</h4>
					<h5 style="color:#EB853E;">
						<fmt:formatDate value="${deskBill.createDate }" pattern="HH:mm" />
					</h5>
				</a>
			</div>
		</div>
	</c:forEach>
</div>
<div class="row" id="pager" style="display: none">
	<c:if
		test="${deskBillpager.pageCount!=1 and deskBillpager.pageCount!=0 }">
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
		<div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
			<ul class="pager">
				<c:if test="${deskBillpager.pageIndex>1 }">
					<li class="previous "><a class="pageBtn"
						pageIndex="${deskBillpager.pageIndex-1 }" href="javascript:;">
							上一页 </a></li>
				</c:if>
				<li class="h2">${deskBillpager.pageIndex
					}/${deskBillpager.pageCount }</li>
				<c:if test="${deskBillpager.pageIndex<deskBillpager.pageCount }">
					<li class="next"><a class="pageBtn" href="javascript:;"
						pageIndex="${deskBillpager.pageIndex+1 }"> 下一页 </a></li>
				</c:if>
			</ul>
		</div>
		<div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
	</c:if>
</div>
<script type="text/javascript">
	$(".deskBillbody").slideDown(200);
    $("#pager").slideDown(100);
</script>
<!-- /row -->
