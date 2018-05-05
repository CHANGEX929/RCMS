<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/4
  Time: 15:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<table class="table table-striped table-bordered table-hover drinkSellList" style="display: none;">
    <thead>
    <tr>
        <th class="text-center">商品名称</th>
        <th class="text-center">订单编号</th>
        <th class="text-center">销售数量</th>
        <th class="text-center">剩余数量</th>
        <th class="text-center">销售单价</th>
        <th class="text-center">总计</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${pager.list}" var="supLusDrinkBill">
        <tr>
            <td class="text-center">${supLusDrinkBill.drinkBill.productName}</td>
            <td class="text-center">${supLusDrinkBill.drinkBill.drinbillCode}</td>
            <td class="text-center">${supLusDrinkBill.drinkSellBill.sellCount}</td>
            <td class="text-center">${supLusDrinkBill.drinkBill.proCount-supLusDrinkBill.drinkSellBill.sellCount}</td>
            <td class="text-center">${supLusDrinkBill.drinkSellBill.sellPrice}</td>
            <td class="text-center">${supLusDrinkBill.drinkSellBill.sellPrice*supLusDrinkBill.drinkSellBill.sellCount}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="row drinkSellList" style="display: none;">
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4"></div>
    <div class="col-lg-4  col-md-4 col-sm-4 col-xs-4 ">
        <c:if test="${pager.pageCount!=1 and pager.pageCount!=0 }">
        <ul class="pager">
             <c:if test="${pager.pageIndex>1 }">
            <li class="previous"><a pageIndex="${pager.pageIndex-1}"
                                    providerId="${pager.providerId}"
                                    productName="${pager.productName}"
                                    class="suplusDrinkBillPagerBtn"
                                    href="javascript:;">
                上一页 </a></li>
               </c:if>
            <li class="h2">${pager.pageIndex
                    }/${pager.pageCount}</li>
            <c:if test="${pager.pageIndex<pager.pageCount }">
            <li class="next"><a pageIndex="${pager.pageIndex+1}"
                                providerId="${pager.providerId}"
                                productName="${pager.productName}"
                                class="suplusDrinkBillPagerBtn"
                                href="javascript:;">
                下一页 </a></li>
             </c:if>
        </ul>
         </c:if>
    </div>
    <div class="col-lg-4 col-md-4 col-sm-4 col-xs-4 "></div>
</div>
<script type="text/javascript">
    $(".drinkSellList").fadeIn(200);
</script>

