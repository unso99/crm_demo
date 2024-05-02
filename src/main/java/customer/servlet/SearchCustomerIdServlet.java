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

@WebServlet("/counsel/search_customer_id")
public class SearchCustomerIdServlet extends HttpServlet {
	final CustomerDao dao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name = req.getParameter("name");
		String phone = req.getParameter("phone");
		
		CustomerDto dto = new CustomerDto();
		dto.setName(name);
		dto.setPhone(phone);
		
		long id = dao.getId(dto);
		
		req.setAttribute("id", id);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("search_customer_id.jsp");
		
		rd.forward(req, resp);
	}

}
