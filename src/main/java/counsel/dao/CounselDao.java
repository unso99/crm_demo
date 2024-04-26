package counsel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import counsel.dto.CounselDto;
import customer.dto.CustomerDto;
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
	
	public boolean delete(long id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rowCount = 0;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "DELETE FROM counsel"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, id);
			rowCount = pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) conn.close();
				if(pstmt != null) pstmt.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		if(rowCount > 0) return true;
		else return false;
	}
	
	public CounselDto getData(long id) {
		CounselDto dto = new CounselDto();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *"
					+ " FROM counsel"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setId(id);
				dto.setCustomer_id(rs.getLong("customer_id"));
				dto.setCounselor(rs.getString("counselor"));
				dto.setDescription(rs.getString("description"));
				dto.setCreated_at(rs.getString("created_at"));
				dto.setUpdated_at(rs.getString("updated_at"));
				dto.setIs_finished(rs.getString("is_finished"));
			}
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (conn != null)
					conn.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		return dto;
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
	
	public List<CounselDto> getList() {
		List<CounselDto> list = new ArrayList<CounselDto>();

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = new DbcpBean().getConn();
			String sql = "SELECT *" + " FROM counsel" + " ORDER BY id ASC";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				CounselDto tmp = new CounselDto();
				tmp.setId(rs.getLong("id"));
				tmp.setCustomer_id(rs.getLong("customer_id"));
				tmp.setCounselor(rs.getString("counselor"));
				tmp.setDescription(rs.getString("description"));
				tmp.setCreated_at(rs.getString("created_at"));
				tmp.setUpdated_at(rs.getString("updated_at"));
				tmp.setIs_finished(rs.getString("is_finished"));
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
