package customer.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import customer.dao.CustomerDao;
import customer.dto.CustomerDto;

@WebServlet("/customer/update")
public class UpdateServlet extends HttpServlet {
	private final CustomerDao dao = CustomerDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Long id = Long.parseLong(req.getParameter("id"));
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		CustomerDto dto = new CustomerDto(id,name,birth,phone,email,address);
		
		boolean isSuccess = dao.update(dto);
		
		req.setAttribute("dto", dto);
		req.setAttribute("isSuccess", isSuccess);
		
		RequestDispatcher rd = req.getRequestDispatcher("update.jsp");
		
		rd.forward(req, resp);
	}
}
