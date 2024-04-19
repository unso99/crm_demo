package owner.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import owner.dto.OwnerDto;
import util.DbcpBean;

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
	
	public OwnerDto getData(String id) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		OwnerDto dto = null;
		try {
			conn = new DbcpBean().getConn();
			//실행할 sql 문
			String sql = "SELECT *"
					+ " FROM owner"
					+ " WHERE id=?";
			pstmt = conn.prepareStatement(sql);
			//? 에 바인딩할 내용이 있으면 여기서 한다.
			pstmt.setString(1, id);
			//query 문 수행하고 결과(ResultSet) 얻어내기
			rs = pstmt.executeQuery();
			//반복문 돌면서 
			if (rs.next()) {
				String password = rs.getString("password");
				dto = new OwnerDto(id,password);
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
					conn.close(); //Connection 객체의 close() 메소드를 호출하면 Pool 에 반납된다.
			} catch (Exception e) {
			}
		}
		return dto;
	}

}
