package pojo;

import java.sql.Timestamp;

/**
 * Provider entity. @author MyEclipse Persistence Tools
 */

public class Provider implements java.io.Serializable {

	// Fields

	private Integer id;
	private String proName;
	private String product;
	private String telNumber;
	private String address;
	private String contact;
	private String phone;
	private String remark;
	private Timestamp createDate;

	// Constructors

	/** default constructor */
	public Provider() {
	}

	/** full constructor */
	public Provider(String proName, String product, String telNumber,
			String address, String contact, String phone, String remark,
			Timestamp createDate) {
		this.proName = proName;
		this.product = product;
		this.telNumber = telNumber;
		this.address = address;
		this.contact = contact;
		this.phone = phone;
		this.remark = remark;
		this.createDate = createDate;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getProName() {
		return this.proName;
	}

	public void setProName(String proName) {
		this.proName = proName;
	}

	public String getProduct() {
		return this.product;
	}

	public void setProduct(String product) {
		this.product = product;
	}

	public String getTelNumber() {
		return this.telNumber;
	}

	public void setTelNumber(String telNumber) {
		this.telNumber = telNumber;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getContact() {
		return this.contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getRemark() {
		return this.remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Timestamp getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Timestamp createDate) {
		this.createDate = createDate;
	}

}