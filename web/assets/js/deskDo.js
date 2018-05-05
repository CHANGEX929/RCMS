$(function () {
    var path = $("#path").attr("path");
    var deskCodeFlag=false;
    //重置按钮
    $("#resetDeskBtn").click(function(){
        reset();
    });

    //添加按钮
    $("#addDeskBtn").click(function () {
        var deskCode=$("#deskCode").val();
        if(deskCode=="" || deskCode==null){
            $("#addDeskError").css("color","red");
            $("#addDeskError").text("桌位编号不能为空");
            deskCodeFlag=false;
        }
        //ajax验证
        isExist(deskCode);
        if(deskCodeFlag){
            $.ajax({
                url:path+"/addDesk.do",
                data:{"deskCode":deskCode},
                dataType:"json",
                success:function (data) {
                    if(data=="1"){
                        alert("添加成功！");
                        reset();
                    }else{
                        alert("添加失败");
                    }
                },
                error:function () {
                    alert("网络通信错误，添加失败");
                }
            });
        }
    });
    $("#deskCode").blur(function(){
        var deskCode=$("#deskCode").val();
        if(deskCode=="" || deskCode==null){
            $("#addDeskError").css("color","red");
            $("#addDeskError").text("桌位编号不能为空");
            deskCodeFlag=false;
            return;
        }
        //ajax验证
        isExist(deskCode);
    });
    //ajax验证
    function isExist(deskCode){
        $.ajax({
            url:path+"/deskCodeIsExist.do",
            data:{"deskCode":deskCode},
            dataType:"json",
            success:function(data){
                if(data=="1"){
                    $("#addDeskError").css("color","red");
                    $("#addDeskError").text("桌位编号已存在");
                    deskCodeFlag=false;
                }else{
                    $("#addDeskError").css("color","green");
                    $("#addDeskError").text("√");
                    deskCodeFlag=true;
                }
            }
        });
    }
    //加载deskList
    $("#searchTabResult").on("click",".dailyDeskPagerBtn",function (e) {
        var pageIndex=$(e.target).attr("pageIndex");
        var serchDeskCode=$(e.target).attr("serchDeskCode");
        showDeskList(serchDeskCode,pageIndex,"all");
    });
    function showDeskList(serchDeskCode,pageIndex,opr){
        $.ajax({
            url:path+"/ajaxShowDesk.do",
            data:{"pageIndex":pageIndex,"opr":opr,"serchDeskCode":serchDeskCode},
            dataType:"html",
            success(data){
                $("#searchTabResult").html(data);
            },
            error:function () {
                alert("加载桌位列表失败");
            }
        });
    }
    //查找
    $("#searchDesk").click(function(){
        var serchDeskCode=$("#serchDeskCode").val();
        var opr="all";
        if(serchDeskCode!="" || serchDeskCode!=null){
            opr="serchDesk";
        }
        showDeskList(serchDeskCode,1,opr);
    });
    $("#showDeskList").click(
        function(){ showDeskList(null,1,"all");}
    );
    //删除
    $("#searchTabResult").on("click",".delDesk",function (e) {
        if(confirm("确认？")){
            var id=$(e.target).attr("deskId");
            $.ajax({
                url:path+"/delDesk.do",
                data:{"id":id},
                dataType:"json",
                success:function (data) {
                    if(data=="1"||data==1){//删除成功
                        alert("删除成功！");
                        showDeskList(null,1,"all");
                    }else{//删除失败
                        alert("删除失败！");
                    }
                },
                error:function(){
                    alert("通信错误");
                }
            });
        }
    });
    //更改
    $("#searchTabResult").on("click",".alterDesk",function (e) {
        var deskCode=$(e.target).attr("deskCode");
        var id=$(e.target).attr("deskId");
        deskCode=prompt("请输入更改后的桌位编号",deskCode);
        isExist(deskCode);
        if(!deskCodeFlag){
            alert("该编号已经存在无法更改");
            return;
        }
        $.ajax({
            url:path+"/alertDesk.do",
            type:"post",
            dataType:"json",
            data:{"deskCode":deskCode,"id":id},
            success:function (data) {
                if(data=="1"||data==1){//删除成功
                    alert("更改成功！");
                    showDeskList(null,1,"all");
                }else{//删除失败
                    alert("更改失败");
                }
            },
            error:function(){
                alert("通信错误");
            }
        });
    });

});