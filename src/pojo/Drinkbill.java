package pojo;

import java.sql.Timestamp;

/**
 * Drinkbill entity. @author MyEclipse Persistence Tools
 */

public class Drinkbill implements java.io.Serializable {

	// Fields

	private Integer id;
	private String drinbillCode;
	private String productName;
	private Integer proCount;
	private String remark;
	private String unit;
	private Timestamp createDate;
	private String createBy;
	private Integer providerId;
	private Double totalCost;
	private Double price;
	private Integer isPay;//1未支付2支付
	private String proName;
	// Constructors

	/** default constructor */
	public Drinkbill() {
	}

	public Integer getIsPay() {
		return isPay;
	}

	public void setIsPay(Integer isPay) {
		this.isPay = isPay;
	}

	public String getProName() {
		return proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	/** minimal constructor */

	public Drinkbill(String drinbillCode) {
		this.drinbillCode = drinbillCode;
	}

	/** full constructor */
	public Drinkbill(String drinbillCode, String productName, Integer proCount,
			String remark, String unit, Timestamp createDate, String createBy,
			Integer providerId, Double totalCost, Double price) {
		this.drinbillCode = drinbillCode;
		this.productName = productName;
		this.proCount = proCount;
		this.remark = remark;
		this.unit = unit;
		this.createDate = createDate;
		this.createBy = createBy;
		this.providerId = providerId;
		this.totalCost = totalCost;
		this.price = price;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDrinbillCode() {
		return this.drinbillCode;
	}

	public void setDrinbillCode(String drinbillCode) {
		this.drinbillCode = drinbillCode;
	}

	public String getProductName() {
		return this.productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public Integer getProCount() {
		return this.proCount;
	}

	public void setProCount(Integer proCount) {
		this.proCount = proCount;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getUnit() {
		return this.unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

	public String getCreateBy() {
		return this.createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	public Integer getProviderId() {
		return this.providerId;
	}

	public void setProviderId(Integer providerId) {
		this.providerId = providerId;
	}

	public Double getTotalCost() {
		return this.totalCost;
	}

	public void setTotalCost(Double totalCost) {
		this.totalCost = totalCost;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

}