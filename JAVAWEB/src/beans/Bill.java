package beans;

import java.io.Serializable;
import java.util.List;

public class Bill implements Serializable {
	private int id;
	private Account customer;// nguoi mua
	private String buyDate;// ngay mua
	private String priceTotal;// tong tien
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public Account getCustomer() {
		return customer;
	}
	public void setCustomer(Account customer) {
		this.customer = customer;
	}
	public String getBuyDate() {
		return buyDate;
	}
	public void setBuyDate(String buyDate) {
		this.buyDate = buyDate;
	}
	public String getPriceTotal() {
		return priceTotal;
	}
	public void setPriceTotal(String priceTotal) {
		this.priceTotal = priceTotal;
	}
	
	
}
