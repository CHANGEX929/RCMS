<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form  id="updateUserForm">
        <p class="text-center h2">更改账号</p>
        <div class="input-group">
            <span class="input-group-addon">账号：</span> <input disabled="disabled"
                                                              name="userCode"
                                                              type="text"
                                                              class="form-control"
                                                              value="${user.userCode}"
                                                              placeholder="账号"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">姓名：</span> <input type="text"
                                                              name="userName"
                                                              class="form-control"
                                                              value="${user.userName}"
                                                              placeholder="姓名"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">密码：</span> <input type="text"
                                                              name="userPassWord"
                                                              class="form-control"
                                                              value="${user.userPassWord}"
                                                              placeholder="密码"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">手机：</span> <input type="text"
                                                              class="form-control"
                                                              name="phone"
                                                              value="${user.phone}"
                                                              placeholder="手机"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">身份证：</span> <input type="text"
                                                               class="form-control"
                                                               name="identity"
                                                               value="${user.identity}"
                                                               placeholder="身份证"/>
            <input type="hidden"
                   name="id"
                   value="${user.id}"/>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success sureUpdateBtn">确认修改</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning backUserListBtn" >返回</a>
            </div>
        </div>
        <br>
    </form>
