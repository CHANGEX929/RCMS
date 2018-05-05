$(function () {
    var submitFlag = false;
    var imgFlag = false;
    var dishNameFlag = false;
    var priceFlag = false;
    var typeFlag = false;
    var path = $("#path").attr("path");
    $("#addDish").click(function () {
        var imgurl = document.getElementById("upload").value;
        var drinkBillCode=$("#drinkBillCode").val();
        if (imgurl == "" || imgurl == null) {
            $("#fileError").css("color", "red");
            $("#fileError").text("请选择文件");
        } else {
            $("#fileError").css("color", "green");
            $("#fileError").text("√");
            imgFlag = true;
        }
        var dishName = document.getElementById("dishName").value;
        if (dishName == "" || dishName == null) {
            $("#dishNameError").css("color", "red");
            $("#dishNameError").text("请输入菜名")
        } else {
            $("#dishNameError").css("color", "green");
            $("#dishNameError").text("√");
            dishNameFlag = true;
        }
        var price = document.getElementById("price").value;
        if (price == "" || price == null) {
            $("#priceError").css("color", "red");
            $("#priceError").text("请输入单价")
        } else if (price <= 0) {
            $("#priceError").css("color", "red");
            $("#priceError").text("请输入正确的单价")
        } else {
            $("#priceError").css("color", "green");
            $("#priceError").text("√");
            priceFlag = true;
        }
        var type = document.getElementById("type").value;
        if (type == "" || type == null || type == 0) {
            $("#typeError").css("color", "red");
            $("#typeError").text("请选择类型")
        } else {
            $("#typeError").css("color", "green");
            $("#typeError").text("√");
            typeFlag = true;
        }
        if (imgFlag == true && dishNameFlag == true && typeFlag == true && priceFlag == true) {
            submitFlag = true;
        }
        if (submitFlag) {//验证成功，执行ajax请求
            $.ajaxFileUpload({
                url: path + "/addDish.do",
                fileElementId: "upload", //文件上传域的ID，这里是input的ID，而不是img的
                dataType: "json", //返回值类型 一般设置为json
                contentType: "application/x-www-form-urlencoded; charset=utf-8",
                data: {"dishName": dishName, "price": price, "type": type,"drinkBillCode":drinkBillCode},
                success: function (data) {
                    if (data == "OK") {
                        alert("添加成功！");
                        window.location.href = path + "/daily.html?show=daily";
                    } else {
                        $("#fileError").css("color", "red");
                        $("#fileError").text(data.fifleFlag);
                    }
                },
                error: function () {
                    alert("失败！");
                }
            });
        }
    });
    $("#price").change(function () {
        var price=$(this).val();
        if (price == "" || price == null) {
            $("#priceError").css("color", "red");
            $("#priceError").text("请输入单价")
        } else if (price <= 0) {
            $("#priceError").css("color", "red");
            $("#priceError").text("请输入正确的单价")
        } else {
            $("#priceError").css("color", "green");
            $("#priceError").text("√");
            priceFlag = true;
        }
    });

    function loadDrinkBill(){
        $.ajax({
            url:path+"/loadDrinkBillCode.do",
            data:{"pageIndex":1},
            dataType:"json",
            success:function (data) {
                var str="<option selected=\"selected\" value=\"0\" disabled=\"disabled\">请选择</option>";
                for (var i=0;i<data.length;i++){
                    str+="<option  value=\""+data[i].drinbillCode+"\" >"+data[i].productName+"</option>"
                }
                $("#drinkBillCode").html(str);
            },
            error:function () {
                alert("加载失败");
            }
        });
    }

    $("#type").change(function () {
        var type=$(this).val();
        if(type==3||type=="3"){
            loadDrinkBill();
            $("#drinkBillInput").fadeIn(200);
        }else{
            $("#drinkBillInput").fadeOut(200);
        }
        if (type == "" || type == null) {
            $("#typeError").css("color", "red");
            $("#typeError").text("请输入单价")
        } else if (price <= 0) {
            $("#typeError").css("color", "red");
            $("#typeError").text("请输入正确的单价")
        } else {
            $("#typeError").css("color", "green");
            $("#typeError").text("√");
            priceFlag = true;
        }
    });
    $("#dishName").change(function () {
        var dishName = $(this).val();
        $.ajax({
            url: path + "/dishNameIsExist.do",
            data: {"dishName": dishName},
            dataType: "json",
            type: "post",
            success: function (data) {
                if (data == 0 || data == "0") {
                    dishNameFlag = false;
                    $("#dishNameError").text("已经存在该菜品了");
                } else {
                    dishNameFlag = true;
                    $("#dishNameError").css("color", "green");
                    $("#dishNameError").text("√");
                }
            },
            error: function (data) {
                alert("NO" + data);
            }
        });
    });


    //显示所有菜品searchDishResult
    $("#showDelBtn").click(function () {
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": "allDish"},
            dataType: "html",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("加载失败");
            }
        });
    });

    //翻页
    $("#searchDishResult").on("click",".delDishPagerBtn",function (e) {
        var pageIndex=$(e.target).attr("pageIndex");
        var opr=$(e.target).attr("opr");
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": opr,"pageIndex":pageIndex},
            dataType: "html",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("加载失败");
            }
        });
    });

    //查找菜品
    $("#searchDish").click(function(){
        var dishName=$("#serchDishName").val();
        $.ajax({
            url: path + "/dishList.do",
            data: {"opr": "serchDish","dishName":dishName},
            dataType: "html",
            type:"post",
            success: function (data) {
                $("#searchDishResult").html(data);
            },
            error:function () {
                alert("加载失败");
            }
        });
    });
    //删除菜品
    $("#searchDishResult").on("click",".delDish",function(e){
        var id=$(e.target).attr("dishId");
        if(confirm("确定删除？")){
            $.ajax({
                url: path + "/delDishFromMenu.do",
                data: {"id": id},
                dataType: "json",
                type:"post",
                success: function (data) {
                    if(data==1 || data =="1"){
                        alert("删除失败");
                    }else{
                        alert("删除成功");
                        $(e.target).parent().parent().remove();
                    }
                },
                error:function () {
                    alert("加载失败");
                }
            });
        }
    });
    
    $(".showDddDishBtn").click(function () {
        reset();
    });
    $("#resetDishBtn").click(function () {
        reset();
    });
});