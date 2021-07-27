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
import beans.Product;
import model.docDB;

/**
 * Servlet implementation class ProductList
 */
@WebServlet("/admin/productList")
public class ProductList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ProductList() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //b1: get data from dao
        docDB db = new docDB();
        List<Product> list = db.getAllproduct();
        
        //b2: set data to jsp
        request.setAttribute("productList", list);
		request.getRequestDispatcher("/views/admin/productListView.jsp").forward(request, response);
        //404 -> url
        //500 -> jsp properties
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	processRequest(request, response);
    }
    
 
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	processRequest(request, response);
    }

}
