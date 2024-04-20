package customer.dto;

public class CustomerDto {
	private long id;
	private String name;
	private String birth;
	private String phone;
	private String email;
	private String address;
	
	public CustomerDto() {}

	public CustomerDto(long id, String name, String birth, String phone, String email, String address) {
		super();
		this.id = id;
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public CustomerDto(String name, String birth, String phone, String email, String address) {
		super();
		this.name = name;
		this.birth = birth;
		this.phone = phone;
		this.email = email;
		this.address = address;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

}
