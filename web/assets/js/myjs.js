
/*删除菜品*/
function delDishes(thisTag){
	var flag=confirm("确定删除？")
	if(flag){
		thisTag.parentNode.parentNode.remove();
	}
}

/*更改菜品*/
function changeDishes(thisTag){
	var numNode=thisTag.parentNode.previousElementSibling.previousElementSibling.previousElementSibling;
	var commentNode=thisTag.parentNode.previousElementSibling.previousElementSibling;
	var oldNum=numNode.innerHTML;
	var oldComment=commentNode.innerHTML;
	var num = parseInt(prompt("请输入数目",oldNum));
	var comment=prompt("请输入备注",oldComment);
	numNode.innerHTML=num;
	commentNode.innerHTML=comment;
	littleTotal(thisTag);
}
/*提交顾客所点菜单*/
function submitDishes(thisTag){
	var dishes=thisTag.parentNode.parentNode.parentNode.previousElementSibling;
	var finaDishes=document.getElementById("finalCustormDishes");
	var flag=confirm("确定？");
	if(flag){
		finaDishes.innerHTML=dishes.innerHTML;	
		var deskInfo=document.getElementById("deskInfo");
		var selectDishes=document.getElementById("selectDishes");
		deskInfo.style.display="block";	
		selectDishes.style.display="none";
	}	
}
/*返回*/
function backtoDesk(){
	var deskInfo=document.getElementById("deskInfo");
	var selectDishes=document.getElementById("selectDishes");
	deskInfo.style.display="block";	
	selectDishes.style.display="none";	
}
/*隐藏点菜*/
function hiddenMenu(){
	var selectDishes=document.getElementById("selectDishes");
	selectDishes.style.display="none";
}
/*同步*/

function tongbu(){	
	var finaDishes=document.getElementById("finalCustormDishes");
	var custormDishes=document.getElementById("custormDishes");
	custormDishes.innerHTML=finaDishes.innerHTML;
}
function tongbu1(){	
	var finaDishes=document.getElementById("finalCustormDishes");
	var custormDishes=document.getElementById("custormDishes");
	finaDishes.innerHTML=custormDishes.innerHTML;
}
/*进入点菜*/
function selectDishes(){
	var deskInfo=document.getElementById("deskInfo");
	var selectDishes=document.getElementById("selectDishes");
	deskInfo.style.display="none";	
	selectDishes.style.display="block";
}
/*点菜*/
function selectDishe(thisTag){
	var num = parseInt(prompt("请输入数目","1"));
	var comment=prompt("请输入备注","无");
	var name=thisTag.nextElementSibling.innerHTML;
	var price=thisTag.nextElementSibling.nextElementSibling.lastElementChild.innerHTML;
	var total=price*num;
	var custormDishesBody=document.getElementById("custormDishes");

		var str="<tr><td>"+name+"</td><td>"+price+"</td><td>"+num+"</td><td>"+comment+"</td><td>"+total+"</td><td><button class='btn btn-default' onclick='changeDishes(this)'>更改</button><button class='btn btn-default' onclick='delDishes(this);tongbu();'>删除</button></td></tr>";
		custormDishesBody.innerHTML=custormDishesBody.innerHTML+str;	
		totalMoney();
}
/*总计*/

function totalMoney(){
	var littleTotal=document.getElementsByName("littleTotal");
	var totalNode=document.getElementById("total");
	var total=0;
	for ( var i = 0; i < littleTotal.length; i++) {
		total=total+littleTotal.innerHTML;
	}
	totalNode.innerHTML="总计：￥"+total;
}
/*小计*/
function littleTotal(thisTag){
	var littleTotal=thisTag.parentNode.previousElementSibling;
	var num=littleTotal.previousElementSibling.previousElementSibling;
	var price=num.previousElementSibling;
	littleTotal.innerHTML=num.innerHTML*price.innerHTML;
	totalMoney();
}


/*登陸*/

function login(){
	var userName=document.getElementById("userName").value;
	var passWord=document.getElementById("userPassWord").value;
	var loginNode=document.getElementById("login");
	if(userName=="13233006500"){
		if(passWord=="134679"){
			loginNode.setAttribute("href","index.html");
		}else{
			alert("密碼錯誤");
		}
	}else{
		alert("賬號不存在")
	}
}


/*结账*/