<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 12:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
    <form action="">
        <p class="text-center h2">更改账号</p>
        <div class="input-group">
            <span class="input-group-addon">账号：</span> <input type="text"
                                                              class="form-control"
                                                              placeholder="账号编号"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">姓名：</span> <input type="text"
                                                              class="form-control"
                                                              placeholder="姓名"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">密码：</span> <input type="text"
                                                              class="form-control"
                                                              placeholder="密码"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">手机：</span> <input type="text"
                                                              class="form-control"
                                                              placeholder="手机"/>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">身份证：</span> <input type="text"
                                                               class="form-control"
                                                               placeholder="身份证"/>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success" id="addUser">确认修改</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning" id="cancel">重置</a>
            </div>
        </div>
        <br>
    </form>
