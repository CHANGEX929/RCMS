var path = $("#path").attr("path");
var disCount = 0.9;// 会员折扣
var deskCode = $("#deskCode").val();
$(function () {
    $("#deskInfo").slideDown(500);
    $("#selectDishes .backDeskInfo").click(function () {
        $("#selectDishes").slideUp();
        $("#deskInfo").slideDown(500);
    });
    $("#selectDishes .sureDeskInfo").click(function () {
        $("#selectDishes").slideUp();
        $("#deskInfo").slideDown(500);
    });
    $("#diancai").click(function () {
        $("#deskInfo").slideUp();
        $("#selectDishes").slideDown(500);
    });

    //选中菜品
    $(".dishMenuBody").on("click", ".dishBtn", function (e) {
        var dishName = $(e.target).parent().attr("dishName");// 菜名
        var dishPrice = $(e.target).parent().attr("dishPrice");// 单价
        var dishNum = $(".dishNum").val();// 数目
        var drinkBillCode=$(e.target).parent().attr("drinkBillCode");
        $(".showDishName").text(dishName);
        $(".showDishPrice").text(dishPrice);
        $(".showDishCotst").text(parseFloat(dishNum) * parseFloat(dishPrice));
        $(".dishNum").val(1);
        $("#dishContent").val("");// 备注
        $(".showDishCotst").text(dishPrice);
        $("#drinkBillCode").val(drinkBillCode);
        $("#selectDish").modal("show");
    });
    // 修改菜品数目
    $(".dishNum").change(function () {
        var dishPrice = $(".showDishPrice").text();
        var dishNum = $(this).val();
        if (parseInt(dishNum) < 1) {
            $(this).val(1);
            dishNum = $(this).val();
        }
        $(".showDishCotst").text(parseFloat(dishNum) * parseFloat(dishPrice));
    });
    /* totalMoneyTd */
    // 确认菜品
    $(".sureDishBtn")
        .click(
            function () {
                var price = $(".showDishPrice").text();// 单价
                var dishNum = $(".dishNum").val();// 数目
                var dishName = $(".showDishName").text();// 菜名
                var content = $("#dishContent").val();// 备注
                var drinkBillCode=$("#drinkBillCode").val();//酒水编码
                $(".showDishCotst").text(
                    parseInt(dishNum) * parseFloat(price));// 小计
                var cost = $(".showDishCotst").text();
                var deskCode = $(this).attr("deskCode");
                $
                    .ajax({
                        url: path + "/selectDish.do",
                        dataType: "json",
                        data: {
                            "price": price,
                            "dishNum": dishNum,
                            "dishName": dishName,
                            "content": content,
                            "cost": cost,
                            "deskCode": deskCode,
                            "drinkBillCode":drinkBillCode
                        },
                        type: "post",
                        success: function (data) {
                            if (data.length != 0 && data != null) {
                                // $(".deskDish").show();
                                $("#payBtn").show();
                                $(".totalMoneyTd").show();
                                // $(".deskDish").hide();
                            } else {
                                // $(".deskDish").show();
                                $("#payBtn").hide();
                                $(".totalMoneyTd").hide();
                                // $(".deskDish").hide();
                            }
                            var str = "";
                            var totalMoney = 0;
                            for (var i = 0; i < data.length; i++) {
                                totalMoney += data[i].cost;
                                str += "<tr class=\"columnDesk\">"
                                    + "<td class=\"dishName\">"
                                    + data[i].dishName
                                    + "</td>"
                                    + "<td class=\"price\">￥"
                                    + data[i].price
                                    + ".0</td>"
                                    + "<td class=\"num\">"
                                    + data[i].dishNum
                                    + "</td>"
                                    + "<td class=\"discrip\">"
                                    + data[i].content
                                    + "</td>"
                                    + "<td class=\"cost\">￥"
                                    + data[i].cost
                                    + ".0</td>"
                                    + "<td><button class=\"btn btn-default updateBtn\""
                                    + "price=\""
                                    + data[i].price
                                    + "\" cost=\""
                                    + data[i].cost
                                    + "\""
                                    + "	content=\""
                                    + data[i].content
                                    + "\" "
                                    + "dishNum=\""
                                    + data[i].dishNum
                                    + "\" dishName=\""
                                    + data[i].dishName
                                    + "\">更改</button>"
                                    + "	<button class=\"btn btn-default delBtn\" dishName=\""
                                    + data[i].dishName
                                    + "\" "
                                    + "		>删除</button></td>"
                                    + "</tr>";
                            }
                            $(".deskDish").html(str);
                            $(".totalMoney")
                                .text(totalMoney + ".0");
                            $(".afterDiscount").text(
                                totalMoney + ".0");
                        }
                    });

            });

    // 提交点菜
    $(".submitDish").click(function () {
        var status = $(this).attr("deskStatus");
        var id = $(this).attr("deskId");
        if (status != "2") {
            $.ajax({
                url: path + "/changeStatus.do",
                type: "post",
                data: {
                    "id": id,
                    "status": status
                },
                success: function (data) {
                    $(".deskInfoBody").show();
                    $(".deskStatus").text("未买单");
                }
            });
        }

    });

    // 设置人数
    $(".setPeopleNum").dblclick(function () {
        $("#setPeopleNum").removeAttr("disabled");
    });
    $("#setPeopleNum").blur(function () {
        $(this).attr("disabled", "disabled");
    });
    $("#setPeopleNum").change(function () {
        var peopleNum = $(this).val();
        var id = $(this).attr("deskId");
        var status = 0;
        var flag = false;
        if (parseInt(peopleNum) == 0) {
            flag = confirm("滞空该桌位?");// 滞空桌位
            status = 1;
        } else if (parseInt(peopleNum) < 1) {
            alert("请输入正确的人数！");
        } else {
            flag = true;
        }
        if (flag) {
            $.ajax({
                url: path + "/changeDesk.do",
                data: {
                    "id": id,
                    "peopleNum": peopleNum,
                    "status": status
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data == "true") {
                        $("#setPeopleNum").val(peopleNum);
                    } else {
                        alert("设置失败");
                    }
                }
            });
        }
        if (status == 1) {
            window.location.href = path + "/deskinfo.html?show=desk&id=" + id;
        }
    });
    // 开桌
    $(".openDeskSure").click(function () {
        var peopleNum = $("#openDeskPeopleNum").val();
        var id = $(this).attr("deskId");
        if (parseInt(peopleNum) < 1) {
            alert("请输入正确的人数！");
        } else {
            $.ajax({
                url: path + "/changeDesk.do",
                data: {
                    "id": id,
                    "peopleNum": peopleNum,
                    "status": 2
                },
                type: "post",
                dataType: "json",
                success: function (data) {
                    if (data == "true") {
                        $("#setPeopleNum").val(peopleNum);
                        $(".setPeopleNum").show();
                        $("#openDesk").modal("hide");
                        $(".openDesk").hide();
                        $("#deskInfo").slideUp();
                        $("#selectDishes").slideDown(500);
                        $("#pay").attr("peopleNum", peopleNum);
                    } else {
                        alert("设置失败");
                    }
                }
            });
        }
    });

    /* 结账 */
    // 挂账
    $(".payType").bind("click", function () {
        var flag = document.getElementById("debtor").checked;
        var payType = $(this).val();
        $("#pay").attr("payType", payType);
        if (flag) {
            $(".debtorInput").removeAttr("disabled");
        } else {
            $(".debtorInput").attr("disabled", "disabled");
        }
    });

    // 是否会员以及自定义折扣约束
    $(".isVIP").bind("click", function () {
        var flag = document.getElementById("VIP").checked;
        if (flag) {
            $(".myselfDiscount").attr("disabled", "disabled");
            $(".myselfDiscountBtn").prop({
                "checked": false
            });
            $(".myselfDiscountInput").val("");
            $(".myselfDiscountInput").attr("disabled", "disabled");
            var totalMoney = $("#totalMoney").text();
            var disCountMoney = disCount * parseFloat(totalMoney);
            disCountMoney = disCountMoney.toFixed(1);
            $(".afterDiscount").text(disCountMoney);
            $("#pay").attr("discount", disCount);
        } else {
            var totalMoney = $("#totalMoney").text();
            $(".afterDiscount").text(totalMoney);
            $(".myselfDiscount").removeAttr("disabled");
            $("#pay").attr("discount", "");
        }
    });

    $(".myselfDiscountBtn").bind("change", function () {
        var flag = $(this)[0].checked;
        if (flag) {
            $(".myselfDiscountInput").removeAttr("disabled");
        } else {
            $("#pay").attr("discount", "");// 滞空折扣
            $(".myselfDiscountInput").attr("disabled", "disabled");
            var totalMoney = $("#totalMoney").text();
            $(".myselfDiscountInput").val("");
            $(".afterDiscount").text(totalMoney);
            $(".myselfDiscount").removeAttr("disabled");
        }
    });

    // 自定义折扣
    $(".myselfDiscountInput").bind("change", function () {
        var myselfDiscount = $(this).val();
        if (myselfDiscount <= 1 || myselfDiscount > 10) {
            alert("请输入正确折扣");
            $(this).val(10);
            myselfDiscount = 10;
        } else {
            var totalMoney = $("#totalMoney").text();
            var disCountMoney = (myselfDiscount / 10) * parseFloat(totalMoney);
            $("#pay").attr("discount", myselfDiscount / 10);// 设置折扣
            disCountMoney = disCountMoney.toFixed(1);
            $(".afterDiscount").text(disCountMoney);
        }
    });

    // 点击结账
    $("#pay").bind("click", function () {
        var deskCode=$(this).attr("deskCode");//桌位编号
        var payType = $(this).attr("payType");// 支付类型
        var totalMoney = $(".afterDiscount").text();// 支付金额
        var peopleNum = $(this).attr("peopleNum");// 消费人数
        var deskID = $(this).attr("deskId");// 桌位ID
        var discount = $(this).attr("discount");// 消费折扣
        var debtor = $(".debtorInput").val();// 挂账人姓名
        if (payType == "" || payType == null) {
            alert("请选择支付类型");
        } else if (payType == "5") {
            if (debtor == "" || debtor == null) {
                alert("请填写挂账人姓名");
            } else {
                var flag = confirm("确认？");
                if (flag) {
                    // ajax进行结账
                    $.ajax({
                        url: path + "/pay.do",
                        type: "post",
                        dataType: "json",
                        data: {
                            "payType": payType,
                            "totalMoney": totalMoney,
                            "peopleNum": peopleNum,
                            "discount": discount,
                            "deskId": deskID,
                            "debtor": debtor,
                            "deskCode":deskCode
                        },
                        success: function (data) {
                            alert("买单成功！");
                            window.location.href = path + "/desklist.html";
                        },
                        error:function () {
                            alert("通信错误");
                        }
                    });
                    $("#payDiv").modal("hide");
                }
            }
        } else {
            var flag = confirm("确认？");
            if (flag) {
                // ajax进行结账
                $.ajax({
                    url: path + "/pay.do",
                    type: "post",
                    dataType: "json",
                    data: {
                        "payType": payType,
                        "totalMoney": totalMoney,
                        "peopleNum": peopleNum,
                        "discount": discount,
                        "deskId": deskID,
                        "debtor": debtor,
                        "deskCode":deskCode
                    },
                    success: function (data) {
                        alert("买单成功！");
                        window.location.href = path + "/desklist.html";
                    }
                });
                $("#payDiv").modal("hide");
            }
        }
    });
    // 确认修改
    $(".updateDishSureBtn")
        .bind(
            "click",
            function () {
                var content = $(".upContent").val();
                var dishNum = $("#upDishNum").val();
                var dishName = $(".upName").text();
                $
                    .ajax({
                        url: path + "/updateDish.do",
                        dataType: "json",
                        type: "post",
                        data: {
                            "deskCode": deskCode,
                            "dishName": dishName,
                            "content": content,
                            "dishNum": dishNum
                        },
                        success: function (data) {
                            if (data.length != 0 && data != null) {
                                // $(".deskDish").show();
                                $("#payBtn").show();
                                $(".totalMoneyTd").show();
                                // $(".deskDish").hide();
                            } else {
                                // $(".deskDish").show();
                                $("#payBtn").hide();
                                $(".totalMoneyTd").hide();
                                // $(".deskDish").hide();
                            }
                            var str = "";
                            var totalMoney = 0;
                            for (var i = 0; i < data.length; i++) {
                                totalMoney += data[i].cost;
                                str += "<tr class=\"columnDesk\">"
                                    + "<td class=\"dishName\">"
                                    + data[i].dishName
                                    + "</td>"
                                    + "<td class=\"price\">￥"
                                    + data[i].price
                                    + ".0</td>"
                                    + "<td class=\"num\">"
                                    + data[i].dishNum
                                    + "</td>"
                                    + "<td class=\"discrip\">"
                                    + data[i].content
                                    + "</td>"
                                    + "<td class=\"cost\">￥"
                                    + data[i].cost
                                    + ".0</td>"
                                    + "<td><button class=\"btn btn-default updateBtn\""
                                    + "price=\""
                                    + data[i].price
                                    + "\" cost=\""
                                    + data[i].cost
                                    + "\""
                                    + "	content=\""
                                    + data[i].content
                                    + "\" "
                                    + "dishNum=\""
                                    + data[i].dishNum
                                    + "\" dishName=\""
                                    + data[i].dishName
                                    + "\">更改</button>"
                                    + "	<button class=\"btn btn-default delBtn\" dishName=\""
                                    + data[i].dishName
                                    + "\" "
                                    + ">删除</button></td>"
                                    + "</tr>";
                            }
                            $(".deskDish").html(str);
                            $(".totalMoney")
                                .text(totalMoney + ".0");
                            $(".afterDiscount").text(
                                totalMoney + ".0");
                            $("#updateModal").modal("hide");
                        }
                    });
            });

    // 修改菜品
    var oldNum=0;
    $(".deskDish").on(
        "click",
        ".updateBtn",
        function (e) {
            oldNum = $(e.target).attr("dishNum");
            var dishName = $(e.target).attr("dishName");
            var price = $(e.target).attr("price");
            var cost = $(e.target).attr("cost");
            var content = $(e.target).attr("content");
            var newNum = oldNum;
            $(".upName").text(dishName);
            $(".upPrice").text(price);
            $("#upDishNum").val(oldNum);
            $(".upContent").val(content);
            $(".upCost").text(cost);
            $("#updateModal").modal("show");
            // 修改数目
            $(".upDishNum").bind(
                "change",
                function () {
                    newNum = $(this).val();
                    if (parseInt(newNum) < 1 || newNum == "") {
                        alert("请输入正确数目");
                        $(this).val(oldNum);
                    } else {
                        $(".upCost").text(
                            parseFloat(newNum) * parseFloat(price)
                            + ".0");
                    }
                });
        });

    // 删除菜
    $(".deskDish").on("click", ".delBtn", function (e) {
        var dishName = $(e.target).attr("dishName");
        $(".sureDelBtn").attr("dishName", dishName);
        $("#deleteDish").modal("show");
    });
    // 确认删除
    $(".sureDelBtn")
        .click(
            function () {
                var dishName = $(this).attr("dishName");
                $
                    .ajax({
                        url: path + "/delDish.do",
                        type: "post",
                        data: {
                            "deskCode": deskCode,
                            "dishName": dishName
                        },
                        success: function (data) {
                            if (data.length != 0 && data != null) {
                                // $(".deskDish").show();
                                $("#payBtn").show();
                                $(".totalMoneyTd").show();
                                // $(".deskDish").hide();
                            } else {
                                // $(".deskDish").show();
                                $("#payBtn").hide();
                                $(".totalMoneyTd").hide();
                                // $(".deskDish").hide();
                            }
                            var str = "";
                            var totalMoney = 0;
                            for (var i = 0; i < data.length; i++) {
                                totalMoney += data[i].cost;
                                str += "<tr class=\"columnDesk\">"
                                    + "<td class=\"dishName\">"
                                    + data[i].dishName
                                    + "</td>"
                                    + "<td class=\"price\">￥"
                                    + data[i].price
                                    + ".0</td>"
                                    + "<td class=\"num\">"
                                    + data[i].dishNum
                                    + "</td>"
                                    + "<td class=\"discrip\">"
                                    + data[i].content
                                    + "</td>"
                                    + "<td class=\"cost\">￥"
                                    + data[i].cost
                                    + ".0</td>"
                                    + "<td><button class=\"btn btn-default updateBtn\""
                                    + "price=\""
                                    + data[i].price
                                    + "\" cost=\""
                                    + data[i].cost
                                    + "\""
                                    + "	content=\""
                                    + data[i].content
                                    + "\" "
                                    + "dishNum=\""
                                    + data[i].dishNum
                                    + "\" dishName=\""
                                    + data[i].dishName
                                    + "\">更改</button>"
                                    + "	<button class=\"btn btn-default delBtn\" dishName=\""
                                    + data[i].dishName
                                    + "\" "
                                    + "		>删除</button></td>"
                                    + "</tr>";
                            }
                            $(".deskDish").html(str);
                            $(".totalMoney")
                                .text(totalMoney + ".0");
                            $(".afterDiscount").text(
                                totalMoney + ".0");
                            $("#deleteDish").modal("hide");
                        }
                    });
            });

    //加载全部菜单
    $.ajax({
        url: path + "/alldish.do",
        dataType: "html",
        data: {"opr": "allDish"},
        success: function (data) {
            $("#all").html(data);
        }
    });
    $.ajax({
        url: path + "/alldish.do",
        dataType: "html",
        data: {"opr": "fry"},
        success: function (data) {
            $("#fry").html(data);
        }
    });
    $.ajax({
        url: path + "/alldish.do",
        dataType: "html",
        data: {"opr": "soup"},
        success: function (data) {
            $("#soup").html(data);
        }
    });
    $.ajax({
        url: path + "/alldish.do",
        dataType: "html",
        data: {"opr": "drink"},
        success: function (data) {
            $("#drink").html(data);
        }
    });
    $.ajax({
        url: path + "/alldish.do",
        dataType: "html",
        data: {"opr": "other"},
        success: function (data) {
            $("#other").html(data);
        }
    });


    $(".dishMenuBody").on("click", ".dishMenuPagerBtn", function (e) {
        var opr = $(e.target).attr("opr");
        var pageIndex = $(e.target).attr("pageIndex");
        $.ajax({
            url: path + "/alldish.do",
            dataType: "html",
            data: {"opr": opr, "pageIndex": pageIndex},
            success: function (data) {
                if (opr == "allDish") {
                    $("#all").html(data);
                } else if (opr == "soup") {
                    $("#soup").html(data);
                } else if (opr == "fry") {
                    $("#fry").html(data);
                } else if (opr == "other") {
                    $("#other").html(data);
                } else if (opr == "drink") {
                    $("#drink").html(data);
                }
            }
        });
    });


});