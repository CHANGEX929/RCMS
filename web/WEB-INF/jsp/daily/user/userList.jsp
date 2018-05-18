<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    <table class="table table-striped table-bordered userListDiv" style="display: none;">
        <thead>
        <tr>
            <th class="text-center">序号</th>
            <th class="text-center">账号</th>
            <th class="text-center">姓名</th>
            <th class="text-center">身份证</th>
            <th class="text-center">创建时间</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.list}" var="user" varStatus="status">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center">${user.userCode}</td>
                <td class="text-center">${user.userName}</td>
                <td class="text-center">${user.identity}</td>
                <td class="text-center">
                    <fmt:formatDate value="${user.createDate}"
                                    pattern="yyyy-MM-dd" />
                        </td>
                <td class="text-center">
                    <button class="btn btn-danger delUserBtn" userId="${user.id}">删除</button>
                    <button class="btn btn-success updateUserBtn" userId="${user.id}">更改</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

<div class="row userListDiv" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
            <ul class="pager">
                <c:if test="${pager.pageIndex>1 }">
                    <li class="previous userListPagerBtn"><a pageIndex="${pager.pageIndex-1}" userSerchName="${pager.userSerchName}" opr="${pager.opr}"
                                                            href="javascript:;">
                        上一页 </a></li>
                </c:if>
                <li class="h2">${pager.pageIndex
                        }/${pager.pageCount}</li>
                <c:if test="${pager.pageIndex<pager.pageCount }">
                    <li class="next userListPagerBtn"><a pageIndex="${pager.pageIndex+1}" userSerchName="${pager.userSerchName}" opr="${pager.opr}"
                                                        href="javascript:;">
                        下一页 </a></li>
                </c:if>
            </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>

<script type="text/javascript">
    $(".userListDiv").fadeIn(200);
</script>
