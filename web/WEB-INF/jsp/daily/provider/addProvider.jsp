<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/5
  Time: 15:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="javascript:;" id="addProviderForm">
    <div class="input-group">
        <span class="input-group-addon">名称：</span> <input type="text"
                                                          id="proName"
                                                          name="proName"
                                                          class="form-control"
                                                          placeholder="供应商名称"/>
        <span class="input-group-addon" id="addProNameError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">主要产品：</span> <input type="text"
                                                          id="product"
                                                          name="product"
                                                          class="form-control"
                                                          placeholder="主要产品"/>
        <span class="input-group-addon" id="addProductError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">地址：</span> <input type="text"
                                                          id="address"
                                                          name="address"
                                                          class="form-control"
                                                          placeholder="厂商地址"/>
        <span class="input-group-addon" id="addAddressError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">手机号码：</span> <input type="text"
                                                            id="telNumber"
                                                            name="telNumber"
                                                            class="form-control"
                                                            placeholder="手机号码"/>
        <span class="input-group-addon" id="addTelNumberError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">联系人：</span> <input type="text"
                                                          id="contact"
                                                          name="contact"
                                                          class="form-control"
                                                          placeholder="联系人"/>
        <span class="input-group-addon" id="addContactError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">电话号码：</span> <input type="text"
                                                           id="proPhone"
                                                           name="phone"
                                                           class="form-control"
                                                           placeholder="电话号码"/>
        <span class="input-group-addon" id="addProPhoneError"></span>
    </div>
    <br>
    <div class="input-group">
        <span class="input-group-addon">备注：</span> <input type="text"
                                                           id="remark"
                                                           name="remark"
                                                           class="form-control"
                                                           placeholder="备注"/>
        <span class="input-group-addon" id="addRemarkError"></span>
    </div>
    <br>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="addGongying">确认添加</a>
        </div>
        <div class=" col-lg-6 ">
            <button type="reset" class="btn btn-warning" id="resetAddProviderFormBtn">重置</button>
        </div>
    </div>
    <br>
</form>