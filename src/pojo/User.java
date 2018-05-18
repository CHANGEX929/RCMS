package pojo;

import java.util.Date;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	// Fields

	private Integer id;
	private String userCode;
	private String userName;
	private String userPassWord;
	private String phone;
	private String identity;
	private Date createDate;

	// Constructors

	/** default constructor */
	public User() {
	}

	/** minimal constructor */
	public User(String userCode, String userPassWord) {
		this.userCode = userCode;
		this.userPassWord = userPassWord;
	}

	/** full constructor */
	public User(String userCode, String userName, String userPassWord,
			String phone, String identity) {
		this.userCode = userCode;
		this.userName = userName;
		this.userPassWord = userPassWord;
		this.phone = phone;
		this.identity = identity;
	}

	// Property accessors

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserCode() {
		return this.userCode;
	}

	public void setUserCode(String userCode) {
		this.userCode = userCode;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPassWord() {
		return this.userPassWord;
	}

	public void setUserPassWord(String userPassWord) {
		this.userPassWord = userPassWord;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getIdentity() {
		return this.identity;
	}

	public void setIdentity(String identity) {
		this.identity = identity;
	}

}