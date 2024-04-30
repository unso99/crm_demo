package owner.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import owner.dao.OwnerDao;
import owner.dto.OwnerDto;

@WebServlet("/owner/login")
public class LoginServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//아이디, 비밀번호, 계정 정보 저장 정보 불러오기
		String id = req.getParameter("id");
		String pwd = req.getParameter("password");
		String isSave = req.getParameter("isSave");
		boolean isSuccess = false;
		OwnerDto dto = OwnerDao.getInstance().getData(id); 
		if (isSave != null) {
			//아이디 비밀번호를 쿠키로 응답하고 1주일 동안 유지되도록 한다.
			Cookie cook1 = new Cookie("savedId", id);
			Cookie cook2 = new Cookie("savedPwd", pwd);

			cook1.setMaxAge(60 * 60 * 24 * 7);
			cook2.setMaxAge(60 * 60 * 24 * 7);
			resp.addCookie(cook1);
			resp.addCookie(cook2);

		} else {
			Cookie cook1 = new Cookie("savedId", "");
			Cookie cook2 = new Cookie("savedPwd", null);
			cook1.setMaxAge(0);
			cook2.setMaxAge(0);
			resp.addCookie(cook1);
			resp.addCookie(cook2);
		}

		if (dto != null && dto.getId() != null && dto.getId().equals(id) && dto.getPassword().equals(pwd)) {
			isSuccess = true;
			req.getSession().setAttribute("id", id);
		}
		
		req.setAttribute("isSuccess", isSuccess);
		req.setAttribute("dto", dto);
		RequestDispatcher rd = req.getRequestDispatcher("/user/login.jsp");
		
		rd.forward(req, resp);
		
	}

}
