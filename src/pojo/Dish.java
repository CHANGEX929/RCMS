package pojo;

/**
 * Dish entity. @author MyEclipse Persistence Tools
 */

public class Dish implements java.io.Serializable {

	// Fields

	private Integer id;
	private String dishName;
	private Double price;
	private Integer type;
	private Integer stock;
	private String fileName;
	private String drinkBillCode;

	// Constructors

	/** default constructor */
	public Dish() {
	}

	/** full constructor */
	public Dish(String dishName, Double price, Integer type, Integer stock,
			String fileName) {
		this.dishName = dishName;
		this.price = price;
		this.type = type;
		this.stock = stock;
		this.fileName = fileName;
	}

	// Property accessors

	public String getDrinkBillCode() {
		return drinkBillCode;
	}

	public void setDrinkBillCode(String drinkBillCode) {
		this.drinkBillCode = drinkBillCode;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getDishName() {
		return this.dishName;
	}

	public void setDishName(String dishName) {
		this.dishName = dishName;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getStock() {
		return this.stock;
	}

	public void setStock(Integer stock) {
		this.stock = stock;
	}

	public String getFileName() {
		return this.fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

}