package owner.dao;

public class OwnerDao {
	private static OwnerDao dao;

	private OwnerDao() {
	}

	public static OwnerDao getInstance() {
		if (dao == null) {
			dao = new OwnerDao();
		}

		return dao;
	}

}
