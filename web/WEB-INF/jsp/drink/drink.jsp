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

<title>酒水库存</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">


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
	<input type="hidden" id="path" path="${pageContext.request.contextPath}" />
	<!-- 主体 -->
	<div class="col-lg-12 drinkbody" style="display: none;">

		<!-- 导航 -->
		<ul class="nav nav-tabs ">
			<li class="active"><a href="#today" data-toggle="tab">进货信息</a></li>
			<li><a href="#xiaoshou" id="showSellDivBtn" data-toggle="tab">销售信息</a></li>
			<li><a href="#shengyu" data-toggle="tab">剩余信息</a></li>
		</ul>
		<!-- /导航 -->

		<!-- 导航内容 -->
		<div class="tab-content">

			<!-- 进货信息 -->
			<div class=" tab-pane fade active in" id="today">
				<%@include file="jinhuoList.jsp"%>
			</div>
			<!-- /进货信息 -->

			<!-- 销售信息 -->
			<div class="tab-pane fade" id="xiaoshou">
				<div class="col-lg-12 col-md-12 " >
					<br/>
					<div class="table-responsive ">
						<div class="row">
							<div class="col-lg-3">
								<div class="input-group">
                    <span
							class="input-group-addon ">供应商</span><select type="text" id="sellProviderId" name="sellProviderId"
																		 class="form-control providerSlecteDiv">

								</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="input-group">
                     <span
							 class="input-group-addon">商品名称</span><input type="text" id="sellProductName" name="sellProductName" class="form-control"/>
								</div>
							</div>
							<div class="col-lg-3">
								<button class="btn btn-default" id="serchDrinkSellBillBtn">查询</button>
							</div>
						</div>
						<br/>
						<div id="ajaxSellListAppendDiv">

						</div>
					</div>
				</div>
			</div>
			<!-- /销售信息 -->

			<!-- 剩余信息 -->
			<div class="tab-pane fade" id="shengyu">
				<div class="col-lg-12 col-md-12 " >
					<br/>
					<div class="table-responsive ">
						<div class="row">
							<div class="col-lg-3">
								<div class="input-group">
                    <span
							class="input-group-addon ">供应商</span><select type="text" id="suplusProviderId" name="suplusProviderId"
																		 class="form-control providerSlecteDiv">

								</select>
								</div>
							</div>
							<div class="col-lg-3">
								<div class="input-group">
                     <span
							 class="input-group-addon">商品名称</span><input type="text" id="suplusProductName" name="suplusProductName" class="form-control"/>
								</div>
							</div>
							<div class="col-lg-3">
								<button class="btn btn-default" id="serchDrinkSuplusBillBtn">查询</button>
							</div>
						</div>
						<br/>
						<div id="ajaxSuplusListAppendDiv">

						</div>
					</div>
				</div>
			</div>
			<!-- /剩余信息 -->
		</div>
		<!-- /导航内容 -->

	</div>
	<!-- /主体 -->

	<!-- 添加进货信息弹框 -->
	<div class="modal fade" id="addDrinkBillModal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel">
		<%@include file="addDrinkModal.jsp"%>
	</div>
	<!-- /添加进货信息弹框 -->

	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<!-- 尾文件 -->
	<script src="${pageContext.request.contextPath}/assets/js/drink.js"></script>

	<script type="text/javascript">
        $(function () {
            $(".drinkbody").slideDown(500);
        })
	</script>
</body>
</html>
