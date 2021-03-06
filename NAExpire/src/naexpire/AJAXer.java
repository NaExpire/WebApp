package naexpire;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AJAXer")

public class AJAXer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String table = request.getParameter("table").trim();
		String column = request.getParameter("column").trim();
		String value = request.getParameter("value").trim();
		String id = request.getParameter("id").trim();
		
		
		DBManager dbm = new DBManager();
		
		if (!column.equals("password")) {
			dbm.update(table, column, value, id);
		}
		else {
			dbm.generatePassword(Integer.parseInt(id));
		}
		
		response.setContentType("text/plain");
		response.getWriter().write("Success");
		
	}
}
