package tools;

import java.util.List;

public class DeskInfoDetailUtil {
	private List<String> dishNames;
	private List<Double> costs;
	private List<String> contemts;
	private List<Double> prices;
	private Double totalMoney;
	
	
	public List<String> getDishNames() {
		return dishNames;
	}
	public void setDishNames(List<String> dishNames) {
		this.dishNames = dishNames;
	}
	public List<Double> getCosts() {
		return costs;
	}
	public void setCosts(List<Double> costs) {
		this.costs = costs;
	}
	public List<String> getContemts() {
		return contemts;
	}
	public void setContemts(List<String> contemts) {
		this.contemts = contemts;
	}
	public List<Double> getPrices() {
		return prices;
	}
	public void setPrices(List<Double> prices) {
		this.prices = prices;
	}
	public Double getTotalMoney() {
		this.totalMoney=0.0;
		for (int i = 0; i < costs.size(); i++) {
			this.totalMoney+=costs.get(i);
		}
		return totalMoney;
	}
	
}
