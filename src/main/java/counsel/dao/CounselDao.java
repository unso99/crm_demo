package counsel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import counsel.dto.CounselDto;
import util.DbcpBean;

public class CounselDao {
	private static CounselDao dao;

	private CounselDao() {
	}

	public static CounselDao getInstance() {
		if (dao == null) {
			dao = new CounselDao();
		}

		return dao;
	}

	public boolean insert(CounselDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;

		try {
			conn = new DbcpBean().getConn();
			String sql = "INSERT INTO counsel" + " (id, customer_id, counselor, description, created_at, is_finished)"
					+ " VALUES(seq_counsel.NEXTVAL,?,?,?,SYSDATE,'false')";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, dto.getCustomer_id());
			pstmt.setString(2, dto.getCounselor());
			pstmt.setString(3, dto.getDescription());
			rowCount = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		if (rowCount > 0)
			return true;
		else
			return false;
	}

}
