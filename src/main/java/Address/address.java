package Address;

import user.User;

public class address {
	
	private int id;
	
	private String Address;
	
	private int pin_code;
	
	private String username;
	 private String userphone;
	
	private User user=new User();
	
	

	public User getAdduser() {
		return user;
	}

	public void setAdduser(User user) {
		this.user = user;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

	public int getPin_code() {
		return pin_code;
	}

	public void setPin_code(int pin_code) {
		this.pin_code = pin_code;
	}
	
	
	

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserphone() {
		return userphone;
	}

	public void setUserphone(String userphone) {
		this.userphone = userphone;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	

	public address(int id, String address, int pin_code, String username, String userphone, User user) {
		super();
		this.id = id;
		Address = address;
		this.pin_code = pin_code;
		this.username = username;
		this.userphone = userphone;
		this.user = user;
	}

	public address(int id, String address, int pin_code, User user) {
		super();
		this.id = id;
		Address = address;
		this.pin_code = pin_code;
		this.user = user;
	}

	public address(int id, String address, int pin_code) {
		super();
		this.id = id;
		Address = address;
		this.pin_code = pin_code;
	}

	public address(String address, int pin_code) {
		super();
		Address = address;
		this.pin_code = pin_code;
	}

		public address() {
		super();
	}

	@Override
	public String toString() {
		return "address [id=" + id + ", Address=" + Address + ", pin_code=" + pin_code + ", username=" + username
				+ ", userphone=" + userphone + ", user=" + user + "]";
	}
	
	
	

}
