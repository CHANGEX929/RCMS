<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
<title>收银管理系统</title>
</head>

<body>
	<!-- 头文件 -->
	<%@ include file="../command/head.jsp"%>
	<!-- /头文件 -->
	<hr />
	<!-- 桌位信息 -->
	<div class="panel panel-info" id="deskInfo" style="display:none; ">
	<input type="hidden" value="${desk.deskCode }" id="deskCode">
		<div class="panel-heading">
			<p class="text-right">
				<a href="${pageContext.request.contextPath}/desklist.html?show=desk""><span
					class="glyphicon glyphicon-remove-circle"></span></a>
			</p>
			<div class=" row" style="font-size: 16px;">
				<div class="col-lg-2"></div>
				<div class="col-lg-4">
					桌位号：<span style="font-weight: bold;">${desk.deskCode }</span>&nbsp;&nbsp;&nbsp;状态：<span
						style="color:red;" class="deskStatus"><c:if
							test="${desk.status==1 }">空</c:if> <c:if
							test="${desk.status==2 }">未买单</c:if></span>
				</div>
				<div class="col-lg-4 ">
					<div class="row">
						<div class="col-lg-3">
							<button class="btn btn-default openDesk" data-toggle="modal"
								data-target="#openDesk"
								style="<c:if test="${desk.status!=1 }">display: none;</c:if>">开桌</button>
						</div>
						<div class="col-lg-3 setPeopleNum"
							style="<c:if test="${desk.status==1 }">display: none;</c:if>">人数：</div>
						<div class="col-lg-4 setPeopleNum"
							style="<c:if test="${desk.status==1 }">display: none;</c:if>">
							<input class="form-control " id="setPeopleNum"
								deskId="${desk.id }" type="number" value="${desk.peopleNum }"
								disabled="disabled" />
						</div>
						<div class="col-lg-2"></div>
					</div>
				</div>
				<div class="col-lg-2"></div>
			</div>
		</div>
		<div class="panel-body deskInfoBody"
			style="<c:if test="${desk.status==1 }">display: none;</c:if>">
			<table class="table table-hover" id="finalCustormDishes">
				<thead>
					<tr class="info" style="font-size: 16px;font-weight: bold;">
						<td>菜名</td>
						<td>单价</td>
						<td>数目</td>
						<td>备注</td>
						<td>小计</td>
						<td>操作</td>
					</tr>
				</thead>
				<tbody class="deskDish">			
					<c:forEach items="${deskDish }" var="dish">
						<tr class="columnDesk">
							<td class="dishName">${dish.dishName }</td>
							<td class="price">￥${dish.price }</td>
							<td class="num">${dish.dishNum}</td>
							<td class="discrip">${dish.content }</td>
							<td class="cost">￥${dish.cost }</td>
							<td><button class="btn btn-default updateBtn"
											price="${dish.price }" cost="${dish.cost }"
											content="${dish.content }" 
											dishNum="${dish.dishNum }" dishName="${dish.dishName }">更改</button>
								<button class="btn btn-default delBtn"  dishName="${dish.dishName }" 
									>删除</button></td>
						</tr>
					</c:forEach>
				</tbody>
				<tfoot>
					<tr>
						<td class="totalMoneyTd"  colspan="6"style="display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"><h3 id="total" >
								总计：￥<span class="totalMoney">${totalMoney }</span>
							</h3></td>
					</tr>
					<tr>
						<td colspan="6">
							<ul class="pager">
								<li class="previous"><a
									href="${pageContext.request.contextPath}/desklist.html?show=desk"
									class="btn btn-default"> 返回 </a></li>
								<li class="next"><a class="btn btn-warning " id="diancai" style="background-color: #D9534F; color:#FFFFFF;">
										点菜 </a>
									<a class="btn btn-warning "  style="background-color: deepskyblue; color:#FFFFFF;">
										打印 </a>
									<a class="btn btn-default " id="payBtn" data-toggle="modal"
										style="background-color: #5CB85C;color:#FFFFFF;
										display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"
									data-target="#payDiv"> 结账 </a></li>
							</ul>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>
	</div>
	<!-- /桌位信息 -->

	<!-- 点菜 -->
	<div id="selectDishes" style="display: none;">
		<!-- 菜单 -->
		<div class="col-xs-5 panel panel-info" style="height:750px;">
			<div class="panel-body">
				<ul class="nav nav-tabs ">
					<li class="active"><a href="#all" data-toggle="tab">全部</a></li>
					<li><a href="#soup" data-toggle="tab">汤类</a></li>
					<li><a href="#fry" data-toggle="tab">炒菜</a></li>
					<li><a href="#drink" data-toggle="tab">酒水</a></li>
					<li><a href="#other" data-toggle="tab">其它</a></li>
				</ul>
				<div class="tab-content dishMenuBody">
					<div class=" tab-pane fade active in" id="all">

					</div>
					<div class="tab-pane fade" id="fry">

					</div>
					<div class="tab-pane fade" id="soup">

					</div>
					<div class="tab-pane fade" id="drink">

					</div>
					<div class="tab-pane fade" id="other">

					</div>
				</div>
			</div>
		</div>
		<!--/ 菜单 -->
		<!-- 桌位信息 -->
		<div class="col-xs-7">
			<div class="panel panel-info" style="height:750px;">
				<div class="panel-heading">
					<span class="h3 text-left">桌位号：${desk.deskCode }</span>
				</div>
				<div class="panel-body">
					<table class="table table-hover " id="custormDishes">
						<thead>
							<tr class="info">
								<td class="h3">菜名</td>
								<td class="h3">单价</td>
								<td class="h3">数目</td>
								<td class="h3">备注</td>
								<td class="h3">小计</td>
								<td class="h3">操作</td>
							</tr>
						</thead>
						<tbody class="deskDish">
							<c:forEach items="${deskDish }" var="dish">
								<tr class="columnDesk">
									<td class="dishName">${dish.dishName }</td>
									<td class="price">￥${dish.price }</td>
									<td class="num">${dish.dishNum}</td>
									<td class="discrip">${dish.content }</td>
									<td class="cost">￥${dish.cost }</td>
									<td><button class="btn btn-default updateBtn"
											price="${dish.price }" cost="${dish.cost }"
											content="${dish.content }" 
											dishNum="${dish.dishNum }" dishName="${dish.dishName }">更改</button>
										<button class="btn btn-default delBtn" dishName="${dish.dishName }" >删除</button></td>
								</tr>
							</c:forEach>
						</tbody>
						<tfoot>
							<tr>
								<td class="totalMoneyTd" colspan="6" style="display:<c:if test="${empty deskDish or fn:length(deskDish) eq 0 }">none</c:if>
										;"><h3 >
										总计:￥<span class="totalMoney">${totalMoney }</span>
									</h3></td>
							</tr>
							<tr>
								<td colspan="6">
									<ul class="pager">
										<li class="previous backDeskInfo"><a href="javascript:;"
											class="btn btn-default submitDish"> 返回 </a></li>
										<li class="next sureDeskInfo"><a href="javascript:;"
											class="btn btn-default  submitDish"
											deskStatus=${desk.status } deskId="${desk.id }"> 提交 </a></li>
									</ul>
								</td>
							</tr>
						</tfoot>
					</table>
				</div>
				<div></div>

				<!-- /桌位信息 -->
			</div>
		</div>
	</div>
	<!--/ 点菜 -->


	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- /尾文件 -->

	<!-- 弹框模块 -->

	<!-- 点菜弹框 -->
	<div class="modal fade" id="selectDish" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<br /> <br />
					<p class="modal-title h1 text-center " id="myModalLabel">点菜</p>
					<br /> <br />
					<table class="table table-hover">
						<thead>
							<tr>
								<td class="h3 col-xs-2">菜名</td>
								<td class="h3 col-xs-2">单价</td>
								<td class="h3 col-xs-2">数目</td>
								<td class="h3 col-xs-2">备注</td>
								<td class="h3 col-xs-2">小计</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td class="col-xs-2 "><span class="showDishName"
									style="color:red;"></span></td>
								<td class="col-xs-2 ">￥<span class="showDishPrice"></span></td>
								<td class="col-xs-2">
									<div class="form-group col-xs-8">
										<input class="form-control  dishNum" type="number" value="1" />
									</div>
									<div class="col-xs-2"></div>
								</td>
								<input type="hidden" id="drinkBillCode" name="drinkBillCode" />
								<td class="col-xs-2">
									<div class="form-group col-xs-8">
										<input class="form-control " id="dishContent" type="text"
											placeholder="备注" />
									</div>
									<div class="col-xs-2"></div>
								</td>
								<td class="col-xs-2 ">￥<span class="showDishCotst"></span></td>
							</tr>
						</tbody>
					</table>
				</div>
				<br /> <br /> <br /> <br />
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary  sureDishBtn"
						deskCode="${desk.deskCode }" data-dismiss="modal">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /点菜弹框 -->

	<!-- 更改弹框 -->
	<div class="modal fade" id="updateModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-footer">
						<p class="modal-title h1 text-center" id="myModalLabel">更改</p>
						<br/><br/>
						<table class="table">
							<thead>
								<tr>
									<td class="h3 col-xs-2">菜名</td>
									<td class="h3 col-xs-2">单价</td>
									<td class="h3 col-xs-2">数目</td>
									<td class="h3 col-xs-2">备注</td>
									<td class="h3 col-xs-2">小计</td>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td class="col-xs-2"><span class="upName"></span></td>
									<td class="col-xs-2">￥<span class="upPrice"></span></td>
									<td class="col-xs-2">
										<div class="form-group col-xs-8">
											<input class="form-control  upDishNum" id="upDishNum" type="number" />
										</div>
										<div class="col-xs-2"></div>
									</td>
									<td class="col-xs-2">
										<div class="form-group col-xs-8">
											<input class="form-control  upContent" id="" type="text"
												placeholder="备注" />
										</div>
										<div class="col-xs-2"></div>
									</td>
									<td class="col-xs-2">￥<span class="upCost"></span></td>
								</tr>
							</tbody>
						</table>
						<br/><br/>
						<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
						<button type="button" class="btn btn-primary updateDishSureBtn">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!--/ 更改弹框 -->

	<!-- 结账弹框 -->
	<div class="modal fade" id="payDiv" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-lg" role="	">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<p class="modal-title h1 text-center" id="myModalLabel">结账</p>
				</div>
				<div class="modal-body col-xs-12">
					<div class="col-xs-2"></div>
					<div class="panel  col-xs-8">
						<div class="panel-body">
							<form class="form-horizontal">
								<div class="form-group">
									<label for="" class="control-label">买单方式：</label> <label
										class="radio-inline"> <input type="radio"
										name="payType" id="wePay" value="1" class="payType">
										微信
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="aliPay" value="2">
										支付宝
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="bankCard" value="3">
										刷卡
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="cash" value="4"> 现金
									</label> <label class="radio-inline"> <input type="radio"
										class="payType" name="payType" id="debtor" value="5">
										挂账
									</label>
								</div>
								<div class="form-group">
									<label for="" class="control-label">是否会员：</label> <label
										class="radio-inline"> <input type="radio" name="isVIP"
										id="VIP" value="1" class="isVIP"> 是
									</label> <label class="radio-inline"> <input type="radio"
										class="isVIP" name="isVIP" id="notVIP" value="2" checked>
										否
									</label>
								</div>
								<div class="form-group has-success">
									<!-- <label for="" class="control-label">自定义折扣：</label> <input
													class="form-control " id="" type="text" disabled="disabled" /> -->
									<div class="input-group has-success">
										<span class="input-group-addon  "> 自定义折扣 <input
											type="checkbox" class="myselfDiscount  myselfDiscountBtn">
										</span> <input type="number" placeholder="请输入1~10整数" min="0.0"
											step="0.5" max="10.0"
											class="form-control  myselfDiscountInput" disabled="disabled">
									</div>
									<!-- /input-group -->
								</div>
								<div class="form-group has-success">
									<div class="input-group has-success">
										<span class="input-group-addon "> 挂账 </span> <input
											type="text" class="form-control debtorInput"
											disabled="disabled">
									</div>
									<!-- /input-group -->
								</div>
							</form>
						</div>
						<h4 class="row">
							<div class="col-lg-6">
								总计：￥<span class="totalMoney" id="totalMoney">${totalMoney
									}</span>
							</div>
							<div class="col-lg-6">
								折后：￥<span class="afterDiscount">${totalMoney }</span>
							</div>
						</h4>
					</div>
				</div>
				<div class="modal-footer">
					<a
						href="${pageContext.request.contextPath }/deskinfo.html?show=desk&id=${param.id}"
						class="btn btn-default" data-dismiss="modal">关闭</a>
					<button type="button" class="btn btn-primary" id="pay" discount=""
						payType="" deskId="${desk.id }" deskCode="${desk.deskCode }" peopleNum="${desk.peopleNum}">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /结账弹框 -->

	<!-- 删除弹框 -->
	<div class="modal fade" id="deleteDish" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-xs" role="	">
			<div class="modal-content">
				<div class="modal-body col-xs-12">
					<div class="text-center">
						<p class="h2">确认删除吗？</p>
						<P></P>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary sureDelBtn">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- 删除弹框 -->

	<!-- 开桌弹框 -->
	<div class="modal fade" id="openDesk" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<div class="modal-dialog modal-xs" role="	">
			<div class="modal-content">
				<div class="modal-body col-xs-12">
					<div class="text-center">
						<p class="h2">开桌</p>
						<div class="input-group">
							<span class="input-group-addon">人数</span> <input
								class="form-control " id="openDeskPeopleNum" type="number" />
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
					<button type="button" class="btn btn-primary openDeskSure"
						deskId="${desk.id }">确认</button>
				</div>
			</div>
		</div>
	</div>
	<!-- /开桌弹框 -->

	<!--/ 弹框模块 -->




	<script type="text/javascript"
		src="${pageContext.request.contextPath }/assets/js/deskinfo.js"></script>
	<script src="${pageContext.request.contextPath }/assets/js/myjs.js"></script>
</body>
</html>