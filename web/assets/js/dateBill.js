$(function(){
	var date=null;
	var path=$("#path").attr("path")
	// 弹出当天详情
	$("#date .dateBillTbody").on("click","tr",function(e){
		date=$(e.target).parents("tr").attr("date");
		$.ajax({
			type : "POST",
			url:path+"/ajax",
			data:{"billDate":date,"othDate":date},
			dataType:"html",
			success:function(data){
				$("#dateDeskBill").html(data);
				$("#allDateBill").slideToggle(200);
				$("#dateDeskBill").slideToggle(200);
			},
			error:function(data){
				alert("NO");
			}
		});	
	});
	$("#dateDeskBill").on("click","tr",function(){
		$("#allDateBill").slideToggle(200);
		$("#dateDeskBill").slideToggle(200);		
	});
	
	$("#date #dateDeskBill").on("click",".pageBtn",function(e){
		var pageIndex=$(e.target).attr("pageIndex");
		$.ajax({
			type : "POST",
			url:path+"/ajax",
			data:{"billDate":date,"othDate":date,"pageIndex":pageIndex},
			dataType:"html",
			success:function(data){
				$("#dateDeskBill").html(data);
			},
			error:function(data){
				alert("NO");
			}
		});	
	});
	
	
	
});