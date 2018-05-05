<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form action="">
        <p class="text-center h2">添加用户</p>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>账号：</span> <input type="text"
                                                              name="userCode"
                                                              id="userCode"
                                                              class="form-control"
                                                              placeholder="账号编号"/>
            <span class="input-group-addon" id="addUserCodeError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>姓名：</span> <input type="text"
                                                              name="userName"
                                                              id="userName"
                                                              class="form-control"
                                                              placeholder="姓名"/>
            <span class="input-group-addon" id="addUserNameError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>密码：</span> <input type="text"
                                                              name="userPassWord"
                                                              id="userPassWord"
                                                              class="form-control"
                                                              placeholder="密码"/>
            <span class="input-group-addon" id="addUserPassWordError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>手机：</span> <input type="text"
                                                              name="phone"
                                                              id="phone"
                                                              class="form-control"
                                                              placeholder="手机"/>
            <span class="input-group-addon" id="addUserPhoneError"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon"><span style="color: red;">*</span>身份证：</span> <input type="text"
                                                               name="identity"
                                                               id="identity"
                                                               class="form-control"
                                                               placeholder="身份证"/>
            <span class="input-group-addon" id="addUserIdentityError"></span>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success" id="addUser">确认添加</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning" id="resetAddUser">重置</a>
            </div>
        </div>
        <br>
    </form>
