<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/19
  Time: 18:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form action="javascript:;" id="updateProviderForm">
    <input type="hidden"
           name="id"
           class="form-control"
           value="${provider.id}"/>
    <div class="input-group">
        <span class="input-group-addon">名称：</span> <input type="text"
                                                          id="updateproName"
                                                          name="proName"
                                                          class="form-control"
                                                          value="${provider.proName}"
                                                          placeholder="供应商名称"/>
        <span class="input-group-addon" id="updateProNameError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">主要产品：</span> <input type="text"
                                                            id="updateproduct"
                                                            name="product"
                                                            value="${provider.product}"
                                                            class="form-control"
                                                            placeholder="主要产品"/>
        <span class="input-group-addon" id="updateProductError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">地址：</span> <input type="text"
                                                          id="updateaddress"
                                                          name="address"
                                                          value="${provider.address}"
                                                          class="form-control"
                                                          placeholder="厂商地址"/>
        <span class="input-group-addon" id="updateAddressError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">手机号码：</span> <input type="text"
                                                            id="updatetelNumber"
                                                            value="${provider.telNumber}"
                                                            name="telNumber"
                                                            class="form-control"
                                                            placeholder="手机号码"/>
        <span class="input-group-addon" id="updateTelNumberError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">联系人：</span> <input type="text"
                                                           id="updatecontact"
                                                           name="contact"
                                                           value="${provider.contact}"
                                                           class="form-control"
                                                           placeholder="联系人"/>
        <span class="input-group-addon" id="updateContactError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">电话号码：</span> <input type="text"
                                                            id="updateproPhone"
                                                            name="phone"
                                                            value="${provider.phone}"
                                                            class="form-control"
                                                            placeholder="电话号码"/>
        <span class="input-group-addon" id="updateProPhoneError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">备注：</span> <input type="text"
                                                          id="updateremark"
                                                          name="remark"
                                                          value="${provider.remark}"
                                                          class="form-control"
                                                          placeholder="备注"/>
        <span class="input-group-addon" id="updateRemarkError"></span>
    </div>
    <br>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="updateProviderBtn">确认修改</a>
        </div>
        <div class=" col-lg-6 ">
            <button type="button" class="btn btn-warning" id="goBackUpdateProviderBtn">返回</button>
        </div>
    </div>
    <br>
</form>
