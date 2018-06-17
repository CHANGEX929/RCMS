$(function () {
    var path = $("#path").attr("path");
    var userCodeFlag = false;
    var userNameFlag = false;
    var userPassWordFlag = false;
    var phontFlag = false;
    var identityFlag = false;
    var addFlag = false;

    //为空判断
    function validityUserCode(){
        var userCode = $("#userCode").val();
        if (userCode == null || userCode == "") {
            $("#addUserCodeError").css("color", "red");
            $("#addUserCodeError").text("账号不能为空");
            userCodeFlag = false;
        } else{
            isExist(userCode, null, null);
        }
    }
    function validityUserName(){
        var userName = $("#userName").val();
        if (userName == null || userName == "") {
            $("#addUserNameError").css("color", "red");
            $("#addUserNameError").text("姓名不能为空");
            userNameFlag = false;
        } else {
            $("#addUserNameError").css("color", "green");
            $("#addUserNameError").text("√");
            userNameFlag = true;
        }
    }
    function validityUserPassWord(){
        var userPassWord = $("#userPassWord").val();
        if (userPassWord == null || userPassWord == "") {
            $("#addUserPassWordError").css("color", "red");
            $("#addUserPassWordError").text("密码不能为空");
            userPassWordFlag = false;
        } else {
            $("#addUserPassWordError").css("color", "green");
            $("#addUserPassWordError").text("√");
            userPassWordFlag = true;
        }
    }
    function validityPhone(){
        var phone = $("#phone").val();
        if (phone == null || phone == "") {
            $("#addUserPhoneError").css("color", "red");
            $("#addUserPhoneError").text("手机不能为空");
            phontFlag = false;
        } else {
            isExist(null, phone, null);
        }
    }
    function validityIdentity(){
        var identity = $("#identity").val();
        if (identity == null || identity == "") {
            $("#addUserIdentityError").css("color", "red");
            $("#addUserIdentityError").text("身份证不能为空");
            identityFlag = false;
        } else {
            isExist(null, null, identity);
        }
    }
    function validityAddFlag(){
        if (userCodeFlag && userNameFlag && userPassWordFlag && phontFlag && identityFlag) {
            addFlag = true;
        } else {
            addFlag = false;
        }
    }
    function doValidity() {
        validityUserCode();
        validityUserName();
        validityUserPassWord();
        validityPhone();
        validityIdentity();
        validityAddFlag();
    }

    $("#userCode").blur(function () {
        validityUserCode();
    });
    $("#userName").blur(function () {
        validityUserName();
    });
    $("#userPassWord").blur(function () {
       validityUserPassWord();
    });
    $("#phone").blur(function () {
        validityPhone();
    });
    $("#identity").blur(function () {
        validityIdentity();
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
    //ajax验证
    function isExist(userCode, phone, identity) {
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
                if (data.userCodeFlag == 0) {//该账号不存在可以添加
                    $("#addUserCodeError").css("color", "green");
                    $("#addUserCodeError").text("√");
                    userCodeFlag = true;
                } else if (data.userCodeFlag != -1) {//该账号存在，报错
                    $("#addUserCodeError").css("color", "red");
                    $("#addUserCodeError").text("该账号已存在");
                    userCodeFlag = true;
                }
                if (data.phoneFlag == 0) {//该账号不存在可以添加
                    $("#addUserPhoneError").css("color", "green");
                    $("#addUserPhoneError").text("√");
                    phontFlag = true;
                } else if (data.phoneFlag != -1) {//该账号存在，报错
                    $("#addUserPhoneError").css("color", "red");
                    $("#addUserPhoneError").text("手机号已存在");
                    phontFlag = false;
                }
                if (data.identityFlag == 0) {//该账号不存在可以添加
                    $("#addUserIdentityError").css("color", "green");
                    $("#addUserIdentityError").text("√");
                    identityFlag = true;
                } else if (data.identityFlag != -1) {//该账号存在，报错
                    $("#addUserIdentityError").css("color", "red");
                    $("#addUserIdentityError").text("该身份证号已经注册");
                    identityFlag = false;
                }
            },
            error: function () {
                alert("ajax账号验证通信异常");
            }
        });
    }

    //重置按钮
    $("#resetAddUser").click(function () {
        reset();
    });

    showUserList({"userSerchName":null,"pageIndex":1,"opr":"serchUser"});
    //加载UserList
    function showUserList(param){
        $.ajax({
            url:path+"/showUserList.do",
            data:param,
            type:"post",
            dataType:"html",
            success:function (data) {
                $("#userListDiv").html(data);
            },
            error:function () {
                alert("加载用户列表失败！");
            }
        });
    }
    //点击翻页按钮
    $("#userListDiv").on("click",".userListPagerBtn",function(e){
        var param={};
        param.userSerchName=$(e.target).attr("userSerchName");
        param.pageIndex=$(e.target).attr("pageIndex");
        param.opr=$(e.target).attr("opr");
        showUserList(param);
    });
    //查询用户
    $(".serchUserBtn").click(function () {
        var param={};
        param.userSerchName=$("#userSerchName").val();
        param.pageIndex=1;
        param.opr="serchUser";
        showUserList(param);
    });
    //点击更改按钮
    $("#userListDiv").on("click",".updateUserBtn",function (e) {
        var id=$(e.target).attr("userId");
        loadUserInfoById(id);
        $("#dishMenu313").siblings().hide();
        $("#dishMenu313").stop(true,true).slideToggle();
    });
    //点击返回按钮
    $(".updateUserDiv").on("click",".backUserListBtn",function(e){
        $("#dishMenu314").siblings().hide();
        $("#dishMenu314").stop(true,true).slideToggle();
    });
    //点击确认修改
    $(".updateUserDiv").on("click",".sureUpdateBtn",function(e){
        var param=$(e.target).parents("#updateUserForm").serialize();
        updateUser(param);
        $("#dishMenu314").siblings().hide();
        $("#dishMenu314").stop(true,true).slideToggle();
        showUserList({"userSerchName":null,"pageIndex":1,"opr":"serchUser"});
    });
    //点击删除按钮
    $("#userListDiv").on("click",".delUserBtn",function (e) {
        var id=$(this).attr("userId");
        if(confirm("确定删除？")){
            delUserById(id);
        }
    });
    function delUserById(id){
        $.ajax({
            url:path+"/delUserById.do",
            data:{"id":id},
            dataType:"json",
            success:function (data) {
                if(data==1 || data=="1"){
                   alert("删除成功");
                    showUserList({"userSerchName":null,"pageIndex":1,"opr":"serchUser"});
                }else{
                    alert("删除失败");
                }
            },
            error:function () {
                alert("删除用户出现错误！");
            }
        });
    }

    $(".showUserListMenuBtn").click(function () {
        showUserList({"userSerchName":null,"pageIndex":1,"opr":"serchUser"});
    });
    //更改用户
    function updateUser(param){
        $.ajax({
            url:path+"/updateUser.do",
            data:param,
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data==1 || data=="1"){
                    alert("更改成功");
                    showUserList({"userSerchName":null,"pageIndex":1,"opr":"serchUser"});
                }else{
                    alert("更改失败");
                }
            },
            error:function () {
                alert("更改用户出现错误！");
            }
        });
    }
    //点击更改按钮加载用户信息
    function loadUserInfoById(id) {
        $.ajax({
            url:path+"/loadUserInfoById.do",
            type:"post",
            dataType:"html",
            data:{"userId":id},
            success:function (data) {
                $(".updateUserDiv").html(data);
            },
            error:function () {
                alert("加载用户信息失败！");
            }
        });
    }


    var proNameFlag=false;
    var productFlag=false;
    var addressFlag=false;
    var telNumberFlag=false;
    var contactFlag=false;
    var proPhoneflag=false;
    var remarkFlag=false;
    var addProFlag=false;
    //为空验证
    function resetProError(){
        $("#addProNameError").text("");
        $("#addProductError").text("");
        $("#addAddressError").text("");
        $("#addTelNumberError").text("");
        $("#addContactError").text("");
        $("#addRemarkError").text("");
        $("#addProPhoneError").text("");
    }
    function resetProviderForm(){
        $("#proName").val("");
        $("#product").val("");
        $("#address").val("");
        $("#telNumber").val("");
        $("#contact").val("");
        $("#remark").val("");
        $("#proPhone").val("");
    }
    $("#resetAddProviderFormBtn").click(function () {
        resetProError();
    });
    function validityProName(){
        var proName=$("#proName").val();
        if(proName=="" || proName==null){
            $("#addProNameError").css("color","red");
            $("#addProNameError").text("供应商名为空");
            proNameFlag=false;
        }else{
            isProExist("proName="+proName);
        }
    }
    function validityProduct(){
        var product=$("#product").val();
        if(product=="" || product==null){
            $("#addProductError").css("color","red");
            $("#addProductError").text("产品名为空");
            productFlag=false;
        }else{
            $("#addProductError").css("color","green");
            $("#addProductError").text("√");
            productFlag=true;
        }
    }
    function validityAddress(){
        var address=$("#address").val();
        if(address=="" || address==null){
            $("#addAddressError").css("color","red");
            $("#addAddressError").text("地址为空");
            addressFlag=false;
        }else{
            $("#addAddressError").css("color","green");
            $("#addAddressError").text("√");
            addressFlag=true;
        }
    }
    function validityTelNumber(){
        var telNumber=$("#telNumber").val();
        if(telNumber=="" || telNumber==null){
            $("#addTelNumberError").css("color","red");
            $("#addTelNumberError").text("手机号码为空");
            telNumberFlag=false;
        }else{
            $("#addTelNumberError").css("color","green");
            $("#addTelNumberError").text("√");
            telNumberFlag=true;
        }
    }
    function validityContact(){
        var contact=$("#contact").val();
        if(contact=="" || contact==null){
            $("#addContactError").css("color","red");
            $("#addContactError").text("联系人为空");
            contactFlag=false;
        }else{
            $("#addContactError").css("color","green");
            $("#addContactError").text("√");
            contactFlag=true;
        }
    }
    function validityRemark(){
        var remark=$("#remark").val();
        if(remark=="" || remark==null){
            $("#addRemarkError").css("color","red");
            $("#addRemarkError").text("备注为空");
            remarkFlag=false;
        }else{
            $("#addRemarkError").css("color","green");
            $("#addRemarkError").text("√");
            remarkFlag=true;
        }
    }
    function validityProPhone(){
        var proPhone=$("#proPhone").val();
        if(proPhone=="" || proPhone==null){
            $("#addProPhoneError").css("color","red");
            $("#addProPhoneError").text("电话号码为空");
            proPhoneflag=false;
        }else{
            $("#addProPhoneError").css("color","green");
            $("#addProPhoneError").text("√");
            proPhoneflag=true;
        }
    }
    function validityAddPro(){
        if(proNameFlag&&productFlag&&addressFlag&&telNumberFlag&&contactFlag&&proPhoneflag&&remarkFlag){
            addProFlag=true;
        }else{
            addProFlag=false;
        }
    }
    $("#proName").blur(function () {
        validityProName();
    });
    $("#product").blur(function () {
        validityProduct();
    });
    $("#address").blur(function () {
        validityAddress();
    });
    $("#telNumber").blur(function () {
        validityTelNumber();
    });
    $("#contact").blur(function () {
        validityContact();
    });
    $("#proPhone").blur(function(){
        validityProPhone();
    });
    $("#remark").blur(function(){
        validityRemark();
    });
    function validityPro(){
        validityProName();
        validityProduct();
        validityAddress();
        validityTelNumber();
        validityContact();
        validityProPhone();
        validityRemark();
        validityAddPro();
    }

    //添加供应商
    $("#addGongying").click(function(){
        validityPro();
        if(addProFlag){
            $.ajax({
                url:path+"/addProvider.do",
                type:"post",
                data:$("#addProviderForm").serialize(),
                dataType:"json",
                success:function (data) {
                    if(data=="1" || data==1){
                        alert("添加成功");
                        resetProError();
                        resetProviderForm();
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
    //ajax验证供应商是否存在
    function isProExist(param){
        $.ajax({
            url:path+"/isProExist.do",
            type:"post",
            dataType:"json",
            data:param,
            success:function(data){
                if(data!=0 && data!='0'){
                    $("#addProNameError").css("color","red");
                    $("#addProNameError").text("供应商已存在");
                    proNameFlag=false;
                }else{
                    $("#addProNameError").css("color","green");
                    $("#addProNameError").text("√");
                    proNameFlag=true;
                }
            },
            error:function () {
                alert("ajax验证供应商品出现错误");
            }
        });
    }



    //加载供应商列表
    $("#dishMenu44").click(function(){
        showProviderList({"opr":"serchPro","pageIndex":1,"serchProName":null});
    });
    $("#providerListDiv").on("click",".providerListPagerBtn",function (e) {
        var pageIndex=$(e.target).attr("pageIndex");
        var opr=$(e.target).attr("opr");
        var serchProName=$(e.target).attr("serchProName");
        showProviderList({"opr":opr,"pageIndex":pageIndex,"serchProName":serchProName});
    });
    function showProviderList(param){
        $.ajax({
            url:path+"/showProviderList.do",
            type:"post",
            dataType:"html",
            data:param,
            success:function (data) {
                $("#providerListDiv").html(data);
            },
            error:function () {
                alert("加载供应商列表错误");
            }
        });
    }
    //点击查询
    $(".serchProviderBtn").click(function(){
        var proSerchName=$("#proSerchName").val();
        showProviderList({"opr":"serchPro","pageIndex":1,"serchProName":proSerchName});
    });
    //点击删除
    function delProviderById(proId){
        $.ajax({
            url:path+"/delProviderById.do",
            data:{"proId":proId},
            dataType:"json",
            type:"post",
            success:function (data) {
                if(data==1){
                    alert("删除成功");
                    showProviderList({"opr":"serchPro","pageIndex":1,"serchProName":null});
                }else{
                    alert("删除失败");
                }
            },
            error:function () {
                alert("通信失败");
            }
        });
    }
    $("#providerListDiv").on("click",".delProviderBtn",function (e) {
       if(confirm("确定？")){
           var proId=$(e.target).attr("proId");
           delProviderById(proId);
       }
    });
    //加载供应商详情
    function loadProviderInfo(proId){
        $.ajax({
            url:path+"/showProviderList.do",
            type:"post",
            dataType:"html",
            data:{"proId":proId},
            success:function (data) {
                $(".loadProviderInfoDiv").html(data);
            },
            error:function () {
                alert("加载供应商列表错误");
            }
        });
    }
    //点击更改
    $("#providerListDiv").on("click",".updateProviderBtn",function (e) {
        var proId=$(e.target).attr("proId");
        loadProviderInfo(proId);
        $("#dishMenu413").siblings().hide();
        $("#dishMenu413").stop(true,true).slideToggle();
    })
    //点击返回
    $(".loadProviderInfoDiv").on("click","#goBackUpdateProviderBtn",function (e) {
        $("#dishMenu414").siblings().hide();
        $("#dishMenu414").stop(true,true).slideToggle();
    })
    //点击确认更改
    $(".loadProviderInfoDiv").on("click","#updateProviderBtn",function (e) {
        var param=$(e.target).parents("#updateProviderForm").serialize();
        $.ajax({
            url:path+"/updateProvider.do",
            data:param,
            type:"post",
            dataType:"json",
            success:function (data) {
                if(data==1){
                    alert("更改成功！");
                    $("#dishMenu414").siblings().hide();
                    $("#dishMenu414").stop(true,true).slideToggle();
                    showProviderList({"opr":"serchPro","pageIndex":1,"serchProName":null});
                }else{
                    alert("更改失败！");
                }
            },
            error:function () {
                alert("通信错误");
            }
        });
    })
});