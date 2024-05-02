package counsel.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import counsel.dao.CounselDao;
import counsel.dto.CounselDto;
import customer.dao.CustomerDao;
import customer.dto.CustomerDto;

@WebServlet("/counsel/insert")
public class InsertServlet extends HttpServlet {
	private final CounselDao counselDao = CounselDao.getInstance();
	private final CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long customer_id = Long.parseLong(req.getParameter("customer_id"));
		String counselor = req.getParameter("counselor");
		String description = req.getParameter("description");
		
		CounselDto dto = new CounselDto();
		
		dto.setCustomer_id(customer_id);
		dto.setCounselor(counselor);
		dto.setDescription(description);
		
		boolean isSuccess = counselDao.insert(dto);
		
		CustomerDto customer = customerDao.getData(customer_id);
		
		req.setAttribute("isSuccess", isSuccess);
		req.setAttribute("customer", customer);
		req.setAttribute("customer_id", customer_id);
		
		RequestDispatcher rd = req.getRequestDispatcher("insert.jsp");
		
		rd.forward(req, resp);
	}
}
