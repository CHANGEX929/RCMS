package pojo;

/**
 * DrinkSellBill entity. @author MyEclipse Persistence Tools
 */

public class DrinkSellBill implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer drinkbillId;
	private Integer sellCount;
	private Double sellPrice;
	private String drinkBillCode;
	private String productName;

	// Constructors

	/** default constructor */
	public DrinkSellBill() {
	}

	/** full constructor */
	public DrinkSellBill(Integer drinkbillId, Integer sellCount,
			Double sellPrice) {
		this.drinkbillId = drinkbillId;
		this.sellCount = sellCount;
		this.sellPrice = sellPrice;
	}

	// Property accessors

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

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

	public Integer getDrinkbillId() {
		return this.drinkbillId;
	}

	public void setDrinkbillId(Integer drinkbillId) {
		this.drinkbillId = drinkbillId;
	}

	public Integer getSellCount() {
		return this.sellCount;
	}

	public void setSellCount(Integer sellCount) {
		this.sellCount = sellCount;
	}

	public Double getSellPrice() {
		return this.sellPrice;
	}

	public void setSellPrice(Double sellPrice) {
		this.sellPrice = sellPrice;
	}

}