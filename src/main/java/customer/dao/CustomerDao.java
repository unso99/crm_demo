package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import customer.dto.CustomerDto;
import util.DbcpBean;

public class CustomerDao {
	private static CustomerDao dao;
	
	private CustomerDao() {}
	
	public static CustomerDao getInstance() {
		if(dao == null) {
			dao = new CustomerDao();
		}
		
		return dao;
	}
	
	public boolean insert(CustomerDto dto) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "INSERT INTO customer"
					+ " (id, name, birth, phone, email, address)"
					+ " VALUES(seq_customer.NEXTVAL, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩 할 내용이 있으면 바인딩
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBirth());
			pstmt.setString(3, dto.getPhone());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getAddress());
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
			}
		}
		if (rowCount > 0) {
			return true;
		} else {
			return false;
		}
	}

}
