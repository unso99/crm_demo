package counsel.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import counsel.dao.CounselDao;
import counsel.dto.CounselDto;
import customer.dao.CustomerDao;

@WebServlet("/counsel/list")
public class ListServlet extends HttpServlet {
	final CounselDao counselDao = CounselDao.getInstance();
	final CustomerDao customerDao = CustomerDao.getInstance();
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		List<CounselDto> list = counselDao.getList();
		
		for(CounselDto tmp : list) {
			String name = customerDao.getData(tmp.getCustomer_id()).getName();
			tmp.setCustomer_name(name);
		}
		
		req.setAttribute("list", list);
		
		RequestDispatcher rd = req.getRequestDispatcher("list.jsp");
		
		rd.forward(req, resp);
		
		
	}
}
