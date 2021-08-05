package beans;


public class BillProduct{
	private String id;
	private Product product;
	private int quantity;
	private Bill bill;
	private long unitPrice;
	
	public BillProduct() {
		super();
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public Bill getBill() {
		return bill;
	}

	public void setBill(Bill bill) {
		this.bill = bill;
	}

	public long getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(long unitPrice) {
		this.unitPrice = unitPrice;
	}
	
	
	
}
