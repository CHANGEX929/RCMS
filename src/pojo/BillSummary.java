package pojo;

import java.util.Date;

import com.alibaba.fastjson.annotation.JSONField;

public class BillSummary {
	private Integer totalCount=0;// 当日开桌数
	private Double cash=0.0;// 现金
	private Double mobilePay=0.0;// 移动支付
	private Double byBank=0.0;// 刷卡
	private Double debtorMoney=0.0;// 挂账
	private Double discountMoney=0.0;// 折扣
	private Double totalMoney=0.0;// 当日实际收入
	private Double realMoney=0.0;// 实际收入
	@JSONField(format="yyyy-MM-dd")
	private Date todayDate;// 当日日期

	public BillSummary() {
	};
	public Integer getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}

	public Double getCash() {
		return cash;
	}

	public void setCash(Double cash) {
		this.cash = cash;
	}

	public Double getMobilePay() {
		return mobilePay;
	}

	public void setMobilePay(Double mobilePay) {
		this.mobilePay = mobilePay;
	}

	public Double getByBank() {
		return byBank;
	}

	public void setByBank(Double byBank) {
		this.byBank = byBank;
	}

	public Double getDebtorMoney() {
		return debtorMoney;
	}

	public void setDebtorMoney(Double debtor) {
		this.debtorMoney = debtor;
	}

	public Double getDiscountMoney() {
		return discountMoney;
	}

	public void setDiscountMoney(Double discountMoney) {
		this.discountMoney = discountMoney;
	}

	public Double getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Double getRealMoney() {
		return realMoney;
	}

	public void setRealMoney(Double realMoney) {
		this.realMoney = realMoney;
	}

	public Date getTodayDate() {
		return todayDate;
	}

	public void setTodayDate(Date todayDate) {
		this.todayDate = todayDate;
	}

}
