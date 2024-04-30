package owner.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/owner/login_form")
public class LoginFormServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//쿠키에 로그인 정보가 저장이 되어있는 지 확인
		Cookie[] cooks = req.getCookies();
		//쿠키가 있다면 정보 저장 해주기
		RequestDispatcher rd = req.getRequestDispatcher("/user/login_form.jsp");
		String savedId = "";
		String savedPwd = "";
		if (cooks != null) {
			for (Cookie tmp : cooks) {
				String key = tmp.getName();
				if (key.equals("savedId")) {
					savedId = tmp.getValue();
				}

				if (key.equals("savedPwd")) {
					savedPwd = tmp.getValue();
				}
			}
		}
		req.setAttribute("savedId", savedId);
		req.setAttribute("savedPwd", savedPwd);
		rd.forward(req, resp);
	}

}
