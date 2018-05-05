package pojo;

/**
 * Desk entity. @author MyEclipse Persistence Tools
 */

public class Desk implements java.io.Serializable {

	// Fields

	private Integer id;
	private String deskCode;
	private Integer status;
	private Integer peopleNum;

	// Constructors

	/** default constructor */
	public Desk() {
	}
	
	/** full constructor */
	public Desk(String deskCode, Integer status) {
		this.deskCode = deskCode;
		this.status = status;
	}

	// Property accessors
	

	public Integer getPeopleNum() {
		return peopleNum;
	}

	public void setPeopleNum(Integer peopleNum) {
		this.peopleNum = peopleNum;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDeskCode() {
		return this.deskCode;
	}

	public void setDeskCode(String deskCode) {
		this.deskCode = deskCode;
	}

	public Integer getStatus() {
		return this.status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

}