package pojo;

public class SuplusDrinkBill {
    private int id;
    private DrinkSellBill drinkSellBill;
    private Drinkbill drinkBill;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public DrinkSellBill getDrinkSellBill() {
        return drinkSellBill;
    }

    public void setDrinkSellBill(DrinkSellBill drinkSellBill) {
        this.drinkSellBill = drinkSellBill;
    }

    public Drinkbill getDrinkBill() {
        return drinkBill;
    }

    public void setDrinkBill(Drinkbill drinkBill) {
        this.drinkBill = drinkBill;
    }
}
