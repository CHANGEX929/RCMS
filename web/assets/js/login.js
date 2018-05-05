$(function(){
	$("#submitBtn").click(function(){
		var userCode=document.getElementById("userCode");
		var userPassWord=document.getElementById("userPassWord");
		if(userCode.validity.valueMissing){
			userCode.setCustomValidity("账号不能为空");
		}else if(userCode.validity.patternMismatch){
			userCode.setCustomValidity("请输入6~16位数字或字母");
		}else{
			userCode.setCustomValidity("");
		}
		if(userPassWord.validity.valueMissing){
			userPassWord.setCustomValidity("密码不能为空");
		}else if(userPassWord.validity.patternMismatch){
			userPassWord.setCustomValidity("请输入6~18位数字或字母");
		}else{
			userPassWord.setCustomValidity("");
		}
	});
	
});