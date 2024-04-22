package counsel.dto;

public class CounselDto {
	public CounselDto(long id, long customer_id, String counselor, String description, String created_at,
			String updated_at, String is_finished) {
		super();
		this.id = id;
		this.customer_id = customer_id;
		this.counselor = counselor;
		this.description = description;
		this.created_at = created_at;
		this.updated_at = updated_at;
		this.is_finished = is_finished;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getCustomer_id() {
		return customer_id;
	}

	public void setCustomer_id(long customer_id) {
		this.customer_id = customer_id;
	}

	public String getCounselor() {
		return counselor;
	}

	public void setCounselor(String counselor) {
		this.counselor = counselor;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getCreated_at() {
		return created_at;
	}

	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}

	public String getUpdated_at() {
		return updated_at;
	}

	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}

	public String getIs_finished() {
		return is_finished;
	}

	public void setIs_finished(String is_finished) {
		this.is_finished = is_finished;
	}

	private long id;
	private long customer_id;
	private String counselor;
	private String description;
	private String created_at;
	private String updated_at;
	private String is_finished;
	
	public CounselDto() {}

}
