package controllers.admin;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Account;
import model.docDB;

/**
 * Servlet implementation class SignUpControl
 */
@WebServlet("/SignUpControl")
public class SignUpControl extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SignUpControl() {
        super();
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	response.setContentType("text/html;charset=UTF-8");
    	String user = request.getParameter("user");
    	String pass = request.getParameter("pass");
    	String re_pass = request.getParameter("repass");
    	if(!pass.equals(re_pass)) {
    		response.sendRedirect("/views/admin/login1.jsp");
    	}else {
    		docDB db = new docDB();
    		Account a = db.CheckAccountExist(user);
    		if(a == null){
    			// dc signup
    			db.signup(user, pass);
    			response.sendRedirect("/views/admin/login1.jsp");
    		}else {
    			//lay ve lai trang signup.jsp
    			
    			response.sendRedirect(request.getContextPath() + "/views/admin/login1.jsp");
    		}
    	}
    }
    
    
    
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		processRequest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processRequest(request, response);

}
	}