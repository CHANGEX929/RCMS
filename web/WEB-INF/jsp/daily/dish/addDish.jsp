<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="" id="dishMenu211">
    <p class="text-center h2">添加菜品</p>
    <form action="javascript:;">
        <%--        <div class="input-group">
                    <span class="input-group-addon">编号：</span> <input type="text"
                                                                      class="form-control"
                                                                      placeholder="菜品编号"/>
                </div>--%>
        <br/>
        <div class="input-group">
            <span class="input-group-addon">菜名：</span> <input type="text" name="dishName"
                                                              id="dishName" class="form-control"
                                                              placeholder="菜品名称"/>
            <span id="dishNameError" class="input-group-addon" style="color: red;">${dishNameError}</span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">价格：</span> <input type="number" name="price"
                                                              id="price" class="form-control"
                                                              placeholder="菜品价格"/>
            <span id="priceError" class="input-group-addon" style="color: red;">${priceError}</span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">种类：</span> <select name="type" id="type"
                                                               class="form-control">
            <option selected="selected" value="0" disabled="disabled">请选择</option>
            <option value="1">汤类</option>
            <option value="2">炒菜</option>
            <option value="3">酒水</option>
            <option value="4">其它</option>
        </select>
            <span id="typeError" class="input-group-addon" style="color: red;">${typeError}</span>
        </div>
        <div class="input-group" id="drinkBillInput" style="display: none;">
            <span class="input-group-addon">选择对应酒水进货：</span> <select name="drinkBillCode" id="drinkBillCode"
                                                               class="form-control">

        </select>
            <span id="drinkBillError" class="input-group-addon" style="color: red;"></span>
        </div>
        <br>
        <div class="input-group">
            <span class="input-group-addon">图片：</span> <input type="file" name="file"
                                                              id="upload" class="form-control"
        />
            <span id="fileError" class="input-group-addon" style="color: red;">${fileError}</span>
        </div>
        <br>
        <div class="input-group col-lg-12">
            <div class=" col-lg-6">
                <a href="javascript:;" class="btn btn-success" id="addDish">确认添加</a>
            </div>
            <div class=" col-lg-6 ">
                <a href="javascript:;" class="btn btn-warning" id="resetDishBtn">重置</a>
            </div>
        </div>
        <br>
    </form>
</div>
