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

@WebServlet("/customer/insert")
public class InsertServlet extends HttpServlet {
	private final CustomerDao dao = CustomerDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String birth = req.getParameter("birth");
		String phone = req.getParameter("phone");
		String email = req.getParameter("email");
		String address = req.getParameter("address");
		
		CustomerDto dto = new CustomerDto(name,birth,phone,email,address);
		
		boolean isSuccess = dao.insert(dto);
		
		req.setAttribute("dto", dto);
		req.setAttribute("isSuccess", isSuccess);
		
		RequestDispatcher rd = req.getRequestDispatcher("insert.jsp");
		
		rd.forward(req, resp);
	}

}
