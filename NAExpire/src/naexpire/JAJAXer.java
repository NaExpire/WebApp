package naexpire;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/JAJAXer")

public class JAJAXer extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("id").trim();
		
		DBManager dbm = new DBManager();

		String newpass = dbm.generatePassword(Integer.parseInt(id));
		
		response.setContentType("text/plain");
		response.getWriter().write(newpass);
		
	}
}
