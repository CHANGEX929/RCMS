<%--
  Created by IntelliJ IDEA.
  User: CHANGEX
  Date: 2018/5/2
  Time: 11:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<form action="">
    <p class="text-center h2">添加桌位</p>
    <div class="input-group">
        <span class="input-group-addon">编号：</span> <input type="text" id="deskCode"
                                                          name="deskCode"
                                                          class="form-control"
                                                          placeholder="桌位编号"/>
        <span class="input-group-addon" id="addDeskError"></span>
    </div>
    <br/>
    <br/>
    <div class="input-group col-lg-12">
        <div class=" col-lg-6">
            <a href="javascript:;" class="btn btn-success" id="addDeskBtn">确认添加</a>
        </div>
        <div class=" col-lg-6 ">
            <a href="javascript:;" class="btn btn-warning" id="resetDeskBtn">重置</a>
        </div>
    </div>
    <br/>

