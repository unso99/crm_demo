package customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import customer.dto.CustomerDto;
import util.DbcpBean;

public class CustomerDao {
	private static CustomerDao dao;

	private CustomerDao() {
	}

	public static CustomerDao getInstance() {
		if (dao == null) {
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
			// 실행할 sql 문
			String sql = "INSERT INTO customer" + " (id, name, birth, phone, email, address)"
					+ " VALUES(seq_customer.NEXTVAL, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
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

	public List<CustomerDto> getList() {
		List<CustomerDto> list = new ArrayList<CustomerDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *" + " FROM customer" + " ORDER BY id ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CustomerDto tmp = new CustomerDto();
				tmp.setId(rs.getLong("id"));
				tmp.setName(rs.getString("name"));
				tmp.setBirth(rs.getString("birth"));
				tmp.setPhone(rs.getString("phone"));
				tmp.setEmail(rs.getString("email"));
				tmp.setAddress(rs.getString("address"));
				list.add(tmp);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return list;
	}
}
