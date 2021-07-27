package controllers.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import model.docDB;


@WebServlet("/admin/addProduct")
public class AddProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AddProduct() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		docDB db = new docDB();
        List<Category> listC = db.getAllcategory();
    	request.setAttribute("category", listC);
        RequestDispatcher dispatcher = request.getServletContext()
                .getRequestDispatcher("/views/admin/createProductView.jsp");
        dispatcher.forward(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String productname = (String) request.getParameter("productname");
        String price = (String) request.getParameter("price");
        String detail = (String) request.getParameter("detail");
        String image = (String) request.getParameter("image");
        String category = (String) request.getParameter("category");
        
        
		docDB db = new docDB();
		db.insertProduct(productname, price, detail, image, category);
		response.sendRedirect(request.getContextPath() +"/admin/productList");
	}

}
