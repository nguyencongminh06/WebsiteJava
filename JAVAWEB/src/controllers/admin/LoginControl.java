package controllers.admin;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Account;
import model.docDB;

/**
 * Servlet implementation class LoginControl
 */
@WebServlet("/LoginControl")
public class LoginControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public LoginControl() {
        super();
        
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	try {
    		String user = request.getParameter("username");
    		String pass = request.getParameter("password");
    		docDB db = new docDB();
    		Account a = db.Login(user, pass);
    		if(a==null) {
    			response.sendRedirect("views/admin/login1.jsp");
    		}else {
    			HttpSession session = request.getSession(); 
    			session.setAttribute("acc", a);
    			response.sendRedirect(request.getContextPath() + "/home");
    		}
    	}catch (Exception ex) {
    	}
    	
    	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);
	}

}