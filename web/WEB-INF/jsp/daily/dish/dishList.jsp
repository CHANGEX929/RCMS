<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/4/28
  Time: 15:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="col-lg-12  dishList"  style="display: none;" >
    <br>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th class="text-center">菜品名称</th>
            <th class="text-center">菜品价格</th>
            <th class="text-center">菜品类型</th>
            <th class="text-center">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${pager.list}" var="dish" >
            <tr>
                <td class="text-center">${dish.dishName}</td>
                <td class="text-center">￥${dish.price}</td>
                <td class="text-center">
                    <c:if test="${dish.type=='1'}">汤类</c:if>
                    <c:if test="${dish.type=='2'}">炒菜</c:if>
                    <c:if test="${dish.type=='3'}">酒水</c:if>
                    <c:if test="${dish.type=='4'}">其它</c:if>
                </td>
                <td class="text-center">
                    <a href="javascript:;" dishId="${dish.id}" class="btn btn-danger delDish" >删除</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<div class="row dishList" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
          <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
        <ul class="pager">
            <c:if test="${pager.pageIndex>1 }">
            <li class="previous delDishPagerBtn"><a pageIndex="${pager.pageIndex-1}" opr="${pager.opr}"
                    href="javascript:;">
                上一页 </a></li>
             </c:if>
            <li class="h2">${pager.pageIndex
                    }/${pager.pageCount}</li>
             <c:if test="${pager.pageIndex<pager.pageCount }">
            <li class="next delDishPagerBtn"><a pageIndex="${pager.pageIndex+1}" opr="${pager.opr}"
                    href="javascript:;">
                下一页 </a></li>
             </c:if>
        </ul>
        </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
</div>
<script type="text/javascript">
    $(".dishList").fadeIn(200);
</script>