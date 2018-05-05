<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="${pageContext.request.contextPath}/assets/css/bootstrap.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath}/assets/css/font-awesome.css"
	rel="stylesheet" />
<link href="${pageContext.request.contextPath}/assets/css/custom.css"
	rel="stylesheet" />

<!-- 权限控制 -->

	<%
/* 		if(session.getAttribute("user")==null){
			response.sendRedirect(request.getContextPath()+"/login.html");
		} */
	
	 %>

<!-- wrapper开始 -->
<div id="wrapper">
<input type="hidden" id="Myath" path="${pageContext.request.contextPath }" />
	<!-- 悬浮导航 -->
	<div class="navbar navbar-inverse navbar-fixed-top">
	<input type="hidden"  id="path" path="${pageContext.request.contextPath }" />
		<div class="adjust-nav">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".sidebar-collapse">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#"> <img
					src="${pageContext.request.contextPath}/assets/img/logo.png" />
				</a>
			</div>
			<div class="row">
			<span class="logout-spn">
			 <a href="javascript:;" style="color:#fff;">操作员:${user.userName }</a>
				<p class="text-right"><a href="${pageContext.request.contextPath}/logout.html" style="color:white;font-size: 14px;">注销</a></p>
			</span>
			</div>
		</div>
	</div>
	<!-- 左侧导航 -->
	<nav class="navbar-default navbar-side" role="navigation">
		<div class="sidebar-collapse">
			<ul class="nav" id="main-menu">
				<li><a
					href="${pageContext.request.contextPath}/desklist.html?show=desk"
					<c:if test="${param.show=='desk' }">class="active-link"</c:if>><i
						class="fa fa-desktop "></i>桌位</a></li>
				<li><a
					href="${pageContext.request.contextPath}/todayBill.html?show=bill&billType=today"
					<c:if test="${param.show=='bill' }">class="active-link"</c:if>><i
						class="fa fa-table "></i>账单</a></li>
				<li><a
					href="${pageContext.request.contextPath}/daily.html?show=daily"
					<c:if test="${param.show=='daily' }">class="active-link"</c:if>><i
						class="fa fa-edit "></i>日常</a></li>
				<li><a
					href="${pageContext.request.contextPath}/drink.html?show=drink"
					<c:if test="${param.show=='drink' }">class="active-link"</c:if>><i
						class="fa fa-qrcode "></i>酒水库存</a></li>
			</ul>
		</div>
	</nav>
	<!-- 内部容器开始-->
	<div id="page-wrapper">
		<div id="page-inner">