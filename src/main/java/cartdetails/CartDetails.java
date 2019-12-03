package cartdetails;

public class CartDetails {
	private int id;
	private String cartnumber;
	private String expyear;
	private int cvv;
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getCartnumber() {
		return cartnumber;
	}
	public void setCartnumber(String cartnumber) {
		this.cartnumber = cartnumber;
	}
	public String getExpyear() {
		return expyear;
	}
	public void setExpyear(String expyear) {
		this.expyear = expyear;
	}
	public int getCvv() {
		return cvv;
	}
	public void setCvv(int cvv) {
		this.cvv = cvv;
	}
	public CartDetails(int id, String cartnumber, String expyear, int cvv) {
		super();
		this.id = id;
		this.cartnumber = cartnumber;
		this.expyear = expyear;
		this.cvv = cvv;
	}
	public CartDetails(String cartnumber, String expyear, int cvv) {
		super();
		this.cartnumber = cartnumber;
		this.expyear = expyear;
		this.cvv = cvv;
	}
	public CartDetails() {
		super();
	}
	@Override
	public String toString() {
		return "CartDetails [id=" + id + ", cartnumber=" + cartnumber + ", expyear=" + expyear + ", cvv=" + cvv + "]";
	}
	
	

}
