package pojo;

public class DeskInfo_detail {
	private Integer id;
	private Integer deskBillId;
	private String dishName;//菜品名
	private Double price;//单价
	private Integer dishNum;//数目
	private String content;//备注
	private Double cost;//小计
	private String drinkBillCode;//酒水编码

	public String getDrinkBillCode() {
		return drinkBillCode;
	}

	public void setDrinkBillCode(String drinkBillCode) {
		this.drinkBillCode = drinkBillCode;
	}

	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDeskBillId() {
		return deskBillId;
	}
	public void setDeskBillId(Integer deskBillId) {
		this.deskBillId = deskBillId;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Integer getDishNum() {
		return dishNum;
	}
	public void setDishNum(Integer dishNum) {
		this.dishNum = dishNum;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Double getCost() {
		return cost;
	}
	public void setCost(Double cost) {
		this.cost = cost;
	}
	@Override
	public String toString() {
		return "DeskInfo_detail [dishName=" + dishName + ", price=" + price
				+ ", dishNum=" + dishNum + ", content=" + content + ", cost="
				+ cost + "]";
	}
	
		
}
