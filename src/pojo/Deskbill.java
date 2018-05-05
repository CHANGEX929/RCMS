package pojo;

import java.util.Date;

/**
 * Deskbill entity. @author MyEclipse Persistence Tools
 */

public class Deskbill implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer deskId;
	private String billCode;
	private Double totalMoney;
	private Integer peopleNum;
	private Double discount;
	private Date createDate;
	private String debtor;
	private Integer payType;//1.微信2.支付宝3.刷卡4.现金5.挂账
	private String deskCode;
	private Double beforeMoney;

	// Constructors

	/** default constructor */
	public Deskbill() {
	}

	/** full constructor */
	public Deskbill(Integer deskId, String billCode, Double totalMoney,
			Integer peopleNum, Double discount, Date createDate,
			String debtor) {
		this.deskId = deskId;
		this.billCode = billCode;
		this.totalMoney = totalMoney;
		this.peopleNum = peopleNum;
		this.discount = discount;
		this.createDate = createDate;
		this.debtor = debtor;
	}

	// Property accessors
	

	public Integer getId() {
		return this.id;
	}


	public String getDeskCode() {
		return deskCode;
	}

	public Double getBeforeMoney() {
		if(discount!=null&&discount!=0){
			beforeMoney=totalMoney/discount;
		}else{
			beforeMoney=totalMoney;
		}
		return beforeMoney;
	}

	public void setBeforeMoney(Double beforeMoney) {
		this.beforeMoney = beforeMoney;
	}

	public void setDeskCode(String deskCode) {
		this.deskCode = deskCode;
	}

	public Integer getPayType() {
		return payType;
	}

	public void setPayType(Integer payType) {
		this.payType = payType;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getDeskId() {
		return this.deskId;
	}

	public void setDeskId(Integer deskId) {
		this.deskId = deskId;
	}

	public String getBillCode() {
		return this.billCode;
	}

	public void setBillCode(String billCode) {
		this.billCode = billCode;
	}

	public Double getTotalMoney() {
		return this.totalMoney;
	}

	public void setTotalMoney(Double totalMoney) {
		this.totalMoney = totalMoney;
	}

	public Integer getPeopleNum() {
		return this.peopleNum;
	}

	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}

	public Double getDiscount(){
	
		return this.discount;
	}

	public void setDiscount(Double discount) {
		this.discount = discount;
	}

	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDebtor() {
		return this.debtor;
	}

	public void setDebtor(String debtor) {
		this.debtor = debtor;
	}

	@Override
	public String toString() {
		return "Deskbill [id=" + id + ", deskId=" + deskId + ", billCode="
				+ billCode + ", totalMoney=" + totalMoney + ", peopleNum="
				+ peopleNum + ", discount=" + discount + ", createDate="
				+ createDate + ", debtor=" + debtor + ", payType=" + payType
				+ "]";
	}

}