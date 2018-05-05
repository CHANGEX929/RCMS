<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="" role="document">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal"
                    aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <p class="modal-title h1 text-center " id="myModalLabel">添加进货信息</p>
        </div>
        <form action="">
            <div class="modal-body col-lg-12">
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>商品名称<span id="productNameError" style="color:red;"></span></th>
                        <th>商品数量<span id="proCountError" style="color:red;"></span></th>
                        <th>单位<span id="unitError" style="color:red;"></span></th>
                        <th>商品进价<span id="priceError" style="color:red;"></span></th>
                        <th>商品总价<span id="totalCostError" style="color:red;"></span></th>
                        <th>供应商<span id="providerIdError" style="color:red;"></span></th>
                        <th>录入人姓名<span id="createByError" style="color:red;"></span></th>
                        <th>是否付款<span id="isPayError" style="color:red;"></span></th>
                        <th>备注<span id="remarkError" style="color:red;"></span></th>
                        <th>销售价格<span id="sellPriceError" style="color:red;"></span></th>
                    </tr>
                    </thead>
                    <tbody>
                    <tr>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addProductName"
                                                       name="productName"  placeholder="商品名称"/></td>
                        <td class="text-center"><input type="number" class="form-control" min="1"
                                                       id="addProCount"
                                                       name="count"  placeholder="商品数量"/></td>
                        <td class="text-center"><input type="text" class="form-control" min="1"
                                                       id="addUnit"
                                                       name="count" value="" placeholder="单位"/></td>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addPrice"
                                                       name="PCSalePrice" value="" placeholder="商品进价(单价)"/></td>
                        <td class="text-center"><input type="text" class="form-control" name="price"
                                                       id="addTotalCost"
                                                       value="" placeholder="商品总价"/></td>
                        <td class="text-center">
                            <div class="input-group">
                                <select type="text" id="addProviderId" class="form-control providerSlecteDiv">
                                </select>
                            </div>
                        </td>
                        <td class="text-center"><input type="text" class="form-control" name="name"
                                                       id="addCreateBy"
                                                       value="" placeholder="录入人姓名"/></td>
                        <td class="text-center">
                            <div class="input-group">
                                <select type="text" id="addIsPay" class="form-control">
                                    <option value="0">请选择</option>
                                    <option value="2">已付款</option>
                                    <option value="1">未付款</option>
                                </select>
                            </div>
                        </td>
                        <td class="text-center"><input type="text" class="form-control"
                                                       id="addRemark"
                                                       placeholder="备注"/></td>
                        <td class="text-center"><input type="number" class="form-control"
                                                       id="addSellPrice"
                                                       placeholder="销售价格"/></td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <input type="button" id="addDrinkBillBtn" name="submit" class="btn btn-primary"
                       value="提交"/>
            </div>
        </form>
    </div>
</div>
