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

@WebServlet("/counsel/update")
public class UpdateServlet extends HttpServlet {
	private final CounselDao dao = CounselDao.getInstance();
	
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long id = Long.parseLong(req.getParameter("id"));
		long customer_id = Long.parseLong(req.getParameter("customer_id"));
		String counselor = (String)req.getSession().getAttribute("id");
		String description = req.getParameter("description");
		String is_finished;
		
		if(req.getParameter("is_finished") == null) {
			is_finished = "false";
		}else {
			is_finished = "true";
		}
		CounselDto dto = new CounselDto();
		dto.setId(id);
		dto.setCustomer_id(customer_id);
		dto.setCounselor(counselor);
		dto.setIs_finished(is_finished);
		dto.setDescription(description);
		
		boolean isSuccess = CounselDao.getInstance().update(dto);
		
		req.setAttribute("isSuccess", isSuccess);
		req.setAttribute("dto", dto);
		
		RequestDispatcher rd = req.getRequestDispatcher("update.jsp");
		
		rd.forward(req, resp);
	}

}
