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

@WebServlet("/counsel/detail")
public class DetailServlet extends HttpServlet {
	private final CounselDao counselDao = CounselDao.getInstance();
	private final CustomerDao customerDao = CustomerDao.getInstance();
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long id = Long.parseLong(req.getParameter("id"));
		
		CounselDto dto = counselDao.getData(id);
		
		String customer_name = customerDao.getData(dto.getCustomer_id()).getName();
		
		req.setAttribute("dto", dto);
		req.setAttribute("customer_name", customer_name);
		
		RequestDispatcher rd = req.getRequestDispatcher("detail.jsp");
		
		rd.forward(req, resp);
		
	}
}
