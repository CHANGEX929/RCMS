<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" %>
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

    <title>日常维护</title>

    <link rel="stylesheet" type="text/css" href="jsp/assets/css/daily.css">

</head>

<body>
<!-- 头文件 -->
<%@ include file="../command/head.jsp" %>
<!-- /头文件 -->
<input type="hidden" id="path" path="${pageContext.request.contextPath}"/>
<!-- 标题 -->
<div class="row">
    <div class="col-lg-12">
    </div>
</div>
<hr/>
<!-- /标题 -->

<!-- 主体 -->
<div class="col-lg-12 dailybody" style="display: none;">

    <!-- 一级菜单 -->
    <div class="col-lg-2" id="dishMenu0">
        <div class="row text-center pad-top">
            <div class="col-lg-12">
                <div class="div-square weihu" id="dishMenu2">
                    <a href="javascript:;"><i class="fa fa-clipboard fa-5x"></i>
                        <h4>菜单维护</h4></a>
                </div>
            </div>
        </div>
        <div class="row text-center pad-top">
            <div class="col-lg-12">
                <div class="div-square weihu" id="dishMenu1">
                    <a href="javascript:;"><i class="fa fa-circle-o-notch fa-5x"></i>
                        <h4>桌位维护</h4></a>
                </div>
            </div>
        </div>
        <div class="row text-center pad-top">
            <div class="col-lg-12">
                <div class="div-square weihu" id="dishMenu3">
                    <a href="javascript:;"><i class="fa fa-user fa-5x"></i>
                        <h4>账号维护</h4></a>
                </div>
            </div>
        </div>
        <div class="row text-center pad-top">
            <div class="col-lg-12">
                <div class="div-square weihu" id="dishMenu4">
                    <a href="javascript:;"><i class="fa fa-bell-o fa-5x"></i>
                        <h4>供应商维护</h4></a>
                </div>
            </div>
        </div>
    </div>
    <!-- /一级菜单 -->

    <!-- 二级菜单 -->

    <!-- 菜单维护 -->
    <div class="col-lg-10" id="dishMenu20">
        <div class="row text-center pad-top">
            <div class="div-square" style="height: 600px">
                <div class="col-lg-3">
                    <div class="row text-center pad-top" id="dishMenu21">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu">
                                <a href="javascript:;" class="showDddDishBtn"><h4>添加菜品</h4></a>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center pad-top" id="dishMenu22">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu">
                                <a href="javascript:;" id="showDelBtn"><h4>查看菜品</h4></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-collapse div-square col-lg-8">
                    <!-- 添加菜品 -->
                    <%@ include file="dish/addDish.jsp" %>
                    <!-- 删除菜品 -->
                    <br>
                    <%@include file="dish/delDish.jsp" %>
                </div>
            </div>
        </div>
    </div>
    <!-- /菜单维护 -->

    <!-- 桌位维护 -->
    <div class="col-lg-10 " id="dishMenu10" style="display:none">
        <div class="row text-center pad-top">
            <div class="div-square" style="height: 600px">
                <div class="col-lg-3">
                    <div class="row text-center pad-top" id="dishMenu11">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu" id="dishMenu2-1">
                                <a href="javascript:;"><h4>添加桌位</h4></a>
                            </div>
                        </div>
                    </div>
                    <div class="row text-center pad-top" id="dishMenu12">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu" id="showDeskList">
                                <a href="javascript:;"><h4>查看桌位</h4></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-collapse col-lg-8">
                    <!-- 添加桌位 -->
                    <div class="div-square" id="dishMenu111">
                        <%@include file="desk/addDesk.jsp" %>
                    </div>
                    <!-- 删除桌位 -->
                    <br>
                    <div class="div-square" id="dishMenu112" style="display:none">
                        <div class="input-group">
                            <input type="text" class="form-control col-lg-10" name="serchDeskCode" id="serchDeskCode"
                                   placeholder="请输入桌位编号"/> <a href="javascript:;"
                                                              class="input-group-addon" id="searchDesk">查找桌位</a>
                        </div>
                        <div  id="searchTabResult">
                            <%@include file="desk/deskList.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /桌位维护 -->

    <!-- 账号维护 -->
    <div class="col-lg-10 " id="dishMenu30" style="display:none">
        <div class="row text-center pad-top">
            <div class="div-square" style="height: 600px">
                <div class="col-lg-3">
                    <div class="row text-center pad-top" id="dishMenu31">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu" id="dishMenu2-1">
                                <a href="javascript:;"><h4>添加账号</h4></a>
                            </div>
                        </div>
                    </div>
            <%--        <div class="row text-center pad-top" id="dishMenu33">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu">
                                <a href="javascript:;"><h4>更改账号</h4></a>
                            </div>
                        </div>
                    </div>--%>
                    <div class="row text-center pad-top" id="dishMenu34">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square showUserListMenuBtn weihu">
                                <a href="javascript:;"><h4>查看账号</h4></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-collapse col-lg-8">
                    <!-- 添加账号 -->
                    <div class="div-square" id="dishMenu311">
                        <%@include file="user/addUser.jsp" %>
                    </div>
                    <!-- 更改账号 -->
                    <br>
                    <div class="div-square updateUserDiv"  id="dishMenu313" style="display:none">
                       <%-- <%@include file="user/updateUser.jsp" %>--%>
                    </div>
                    <!-- 查看用户 -->
                    <div class="div-square" id="dishMenu314" style="display:none">
                        <div class="input-group">
                            <input type="text" id="userSerchName" class="form-control col-lg-10"
                                   placeholder="请用户账号或用户姓名"/> <a href="javascript:;"
                                                              class="input-group-addon serchUserBtn">查找用户</a>
                        </div>
                        <br/>
                        <div id="userListDiv">

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /账号维护 -->

    <!-- 供应商维护 -->
    <div class="col-lg-10 " id="dishMenu40" style="display:none">
        <div class="row text-center pad-top">
            <div class="div-square" style="height: 600px">
                <div class="col-lg-3">
                    <div class="row text-center pad-top" id="dishMenu41">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu" id="dishMenu2-1">
                                <a href="javascript:;" id="showAddProviderBtn"><h4>添加供应商</h4></a>
                            </div>
                        </div>
                    </div>
              <%--      <div class="row text-center pad-top" id="dishMenu43">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu">
                                <a href="javascript:;"><h4>更改供应商</h4></a>
                            </div>
                        </div>
                    </div>--%>
                    <div class="row text-center pad-top" id="dishMenu44">
                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                            <div class="div-square weihu">
                                <a href="javascript:;" ><h4>查看供应商</h4></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="sidebar-collapse col-lg-8">
                    <!-- 添加供应商 -->
                    <div class="div-square" id="dishMenu411">
                        <%@include file="provider/addProvider.jsp"%>
                    </div>
                    <!-- 更改供应商 -->
                    <br>
                    <div class="div-square loadProviderInfoDiv" id="dishMenu413" style="display:none">
                    </div>
                    <!-- 查看供应商 -->
                    <br>
                    <div class="" id="dishMenu414" style="display:none">
                        <div class="input-group">
                            <input type="text" id="proSerchName" class="form-control col-lg-10"
                                   placeholder="请供应商名或供应产品名"/> <a href="javascript:;"
                                                                 class="input-group-addon serchProviderBtn">查找供应商</a>
                        </div>
                        <br/>
                        <div id="providerListDiv">

                        </div>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /供应商维护 -->

    <!-- /二级菜单 -->

</div>
<!-- /主体 -->

<!-- 尾文件 -->
<%@ include file="../command/foot.jsp" %>
<!-- 尾文件 -->
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/daily.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/ajaxfileupload.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/dishDo.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/deskDo.js"></script>
<script type="text/javascript"
        src="${pageContext.request.contextPath }/assets/js/userDo.js"></script>
<script type="text/javascript">
    $(function () {
        $(".dailybody").slideDown(500);
    })
</script>

</body>
</html>
