var path = $("#Myath").attr("path");
$(function() {
	$(".billBody").slideDown(500);
	// ajax加载账单详情
	$(".billBody")
			.on(
					"click",
					".billDetailBtn",
					function(e) {
						// billDetails
						var id = $(e.target).attr("deskBillId");
						var discount = $(e.target).attr("discount");
						var billPeoNum = $(e.target).attr("billPeoNum");
						var payType = $(e.target).attr("payType");
						var debtor=$(e.target).attr("debtor");
						switch (payType) {
						case "1":
							payType="微信";
							break;
						case "2":
							payType="支付宝";
							break;
						case "3":
							payType="刷卡";
							break;
						case "4":
							payType="现金";
							break;
						case "5":
							payType="挂账<span style=\"color:red;\">("+debtor+")</span>";
							break;
						}
						if (id != null && id != 0) {
							$
									.ajax({
										url : path + "/getBillDetail.do",
										data : {
											"id" : id
										},
										dataType : "json",
										success : function(data) {
											var str = "";
											var totalMoney = 0;
											for ( var i = 0; i < data.length; i++) {
												totalMoney += data[i].cost;
												str += "<tr style=\"height:40px;\">"
														+ "<td>"
														+ data[i].dishName
														+ "</td>"
														+ "<td>￥"
														+ data[i].price
														+ "</td>"
														+ "<td>"
														+ data[i].dishNum
														+ "</td>"
														+ "<td>"
														+ data[i].content
														+ "</td>"
														+ "<td>￥"
														+ data[i].cost
														+ "</td>" + "</tr>";
											}
											if (data.length < 5) {
												var num = 5 - data.length;
												for ( var i = 0; i < num; i++) {
													str += "<tr style=\"height: 40px;\">"
															+ "<td></td>"
															+ "<td></td>"
															+ "<td></td>"
															+ "<td></td>"
															+ "	<td></td>"
															+ "</tr>";
												}
											}
											$("#billDetails").html(str);
											$("#totalBillMoney").text(
													totalMoney);
											$("#finalCustormDishes").modal(
													"show");
											$("#billPeoNum").text(
													billPeoNum + "");
											$("#payType").html(payType);
											if (discount == null
													|| discount == "" || discount==0 || discount=="0") {
												$("#discount").text("无");
												$("#afterDiscount").text(
														totalMoney);
											} else {
												$("#discount")
														.text(
																parseFloat(discount) * 10);
												var afterDiscount = (parseFloat(totalMoney) * parseFloat(discount));
												$("#afterDiscount").text(
														afterDiscount
																.toFixed(2));
											}

										}
									});
						}
					});

});