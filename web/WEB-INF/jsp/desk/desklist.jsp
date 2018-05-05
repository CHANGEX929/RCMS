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
<title>桌位</title>
</head>

<body>
	<!-- 头文件 -->
	<%@ include file="../command/head.jsp"%>
	<!-- /头文件 -->

	<!--/ 首页显示收银员 -->
	<div class="row">
		<div class="col-lg-12">
			<h2></h2>
		</div>
	</div>
	<hr />
	<!-- /首页显示收银员 -->

	<!-- 桌位显示 -->
	<div class="row text-center pad-top desklist"style="display: none;">
		<c:forEach items="${desks }" var="desk">
			<!-- desk -->
			<div class="col-lg-2 col-md-2 col-sm-2 col-xs-6 " >
				<div class="div-square">
					<a class="btn"
						href="${pageContext.request.contextPath}/deskinfo.html?show=desk&id=${desk.id}">
						<i class="fa fa-circle-o-notch fa-5x"></i>
						<h4>${desk.deskCode }</h4>
						<h5><c:if test="${desk.status==1 }"><span style="color:#D6EF52;">[空]</span></c:if><c:if test="${desk.status==2 }"><span style="color:red;">[未买单]</span></c:if></h5>
					</a>
				</div>
			</div>
			<!-- /desk -->
		</c:forEach>
	</div>
	<!-- /桌位显示 -->

	<!-- 尾文件 -->
	<%@ include file="../command/foot.jsp"%>
	<script type="text/javascript">
		$(function(){
			$(".desklist").slideDown(500);
		});
	</script>
	<!-- 头文件 -->
</body>
</html>
