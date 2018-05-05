$(function () {
    var path = $("#path").attr("path");
    var userCodeFlag = false;
    var userNameFlag = false;
    var userPassWordFlag = false;
    var phontFlag = false;
    var identityFlag = false;
    var addFlag = false;

    //为空判断
    function doValidity() {
        var userCode = $("#userCode").val();
        var userName = $("#userName").val();
        var userPassWord = $("#userPassWord").val();
        var phone = $("#phone").val();
        var identity = $("#identity").val();
        if (userCode == null || userCode == "") {
            $("#addUserCodeError").css("color", "red");
            $("#addUserCodeError").text("账号不能为空");
            userCodeFlag = false;
        } else{
            $("#addUserCodeError").css("color", "green");
            $("#addUserCodeError").text("√");
            userCodeFlag = true;
        }
        if (userName == null || userName == "") {
            $("#addUserNameError").css("color", "red");
            $("#addUserNameError").text("姓名不能为空");
            userNameFlag = false;
        } else {
            $("#addUserNameError").css("color", "green");
            $("#addUserNameError").text("√");
            userNameFlag = true;
        }
        if (userPassWord == null || userPassWord == "") {
            $("#addUserPassWordError").css("color", "red");
            $("#addUserPassWordError").text("密码不能为空");
            userPassWordFlag = false;
        } else {
            $("#addUserPassWordError").css("color", "green");
            $("#addUserPassWordError").text("√");
            userPassWordFlag = true;
        }
        if (phone == null || phone == "") {
            $("#addUserPhoneError").css("color", "red");
            $("#addUserPhoneError").text("手机不能为空");
            phontFlag = false;
        } else {
            $("#addUserPhoneError").css("color", "green");
            $("#addUserPhoneError").text("√");
            phontFlag = true;
        }
        if (identity == null || identity == "") {
            $("#addUserIdentityError").css("color", "red");
            $("#addUserIdentityError").text("身份证不能为空");
            identityFlag = false;
        } else {
            $("#addUserIdentityError").css("color", "green");
            $("#addUserIdentityError").text("√");
            identityFlag = true;
        }
        if (userCodeFlag && userNameFlag && userPassWordFlag && phontFlag && identityFlag) {
            addFlag = true;
        } else {
            addFlag = false;
        }
    }

    $("#userCode").blur(function () {
        doValidity();
    });
    $("#userName").blur(function () {
        doValidity();
    });
    $("#userPassWord").blur(function () {
        doValidity();
    });
    $("#phone").blur(function () {
        doValidity();
    });
    $("#identity").blur(function () {
        doValidity();
    });
    //添加按钮
    $("#addUser").click(function () {
        doValidity();
        if (addFlag) {
            var userCode = $("#userCode").val();
            var userName = $("#userName").val();
            var userPassWord = $("#userPassWord").val();
            var phone = $("#phone").val();
            var identity = $("#identity").val();
            $.ajax({
                url:path+"/addUser.do",
                type:"post",
                dataType:"json",
                data:{"userCode":userCode,"userName":userName,"userPassWord":userPassWord,"phone":phone,"identity":identity},
                success:function (data) {
                    if(data=="1" || data==1){
                        alert("添加成功");
                        reset();
                    }else{
                        alert("添加失败");
                    }
                },
                error:function () {
                    alert("通信异常");
                }
            });
        }
    });
    function addUser(){

    }
    //ajax验证
   /* function isExist(userCode, phone, identity) {
        var param = {};
        if (userCode != null && userCode != "") {
            param.userCode = userCode;
        }
        if (phone != null && phone != "") {
            param.phone = phone;
        }
        if (identity != null && identity != "") {
            param.identity = identity;
        }
        $.ajax({
            url: path + "/userIsExist.do",
            data: param,
            dataType: "json",
            type: "post",
            success: function (data) {
                if (map.userCodeFlag == 0) {//该账号不存在可以添加
                    $("#addUserCodeError").css("color", "green");
                    $("#addUserCodeError").text("√");
                    userCodeFlag = true;
                } else if (map.userCodeFlag == 1) {//该账号存在，报错
                    $("#addUserCodeError").css("color", "red");
                    $("#addUserCodeError").text("该账号已存在");
                    userCodeFlag = true;
                }
                if (map.phoneFlag == 0) {//该账号不存在可以添加
                    $("#addUserPhoneError").css("color", "red");
                    $("#addUserPhoneError").text("手机已经注册");
                    phontFlag = false;
                } else if (map.phoneFlag == 1) {//该账号存在，报错
                    $("#addUserPhoneError").css("color", "green");
                    $("#addUserPhoneError").text("√");
                    phontFlag = true;
                }
                if (map.identityFlag == 0) {//该账号不存在可以添加
                    $("#addUserIdentityError").css("color", "green");
                    $("#addUserIdentityError").text("√");
                    identityFlag = true;
                } else if (map.identityFlag == 1) {//该账号存在，报错
                    $("#addUserIdentityError").css("color", "red");
                    $("#addUserIdentityError").text("该身份证号已经注册");
                    identityFlag = false;
                }
            },
            error: function () {
                alert("ajax账号验证通信异常");
            }
        });*/
    //}

    $("#addGongying").click(function(){
        if(confirm("确认？")){
            $.ajax({
                url:path+"/addProvider.do",
                type:"post",
                data:$("#addProviderForm").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data=="1" || data==1){
                        alert("添加成功");

                    }else{
                        alert("添加失败");
                    }
                },
                error:function () {
                    alert("通信异常");
                }
            });
        }
    });



    //重置按钮
    $("#resetAddUser").click(function () {
        reset();
    });
});