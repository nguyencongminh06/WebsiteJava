package controllers.admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.Category;
import beans.Product;
import model.SQLServerConnUtils_SQLJDBC;
import model.docDB;

/**
 * Servlet implementation class EditServlet
 */
@WebServlet("/admin/editProduct")
public class EditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = SQLServerConnUtils_SQLJDBC.getJDBCConnection();

		String id = (String) request.getParameter("id");

		Product product = null;
		List<Category> listC = null;
		docDB db = new docDB();
		String errorString = null;

		try {
	    listC = db.getAllcategory();
		product = db.findProduct(conn, id) ;
		} catch (SQLException e) {
		e.printStackTrace();
		errorString = e.getMessage();
		}
		if (errorString != null && product == null) {
		
		response.sendRedirect(request.getServletPath() + "/admin/productList");
		return;
		}
		request.setAttribute("category", listC);
		request.setAttribute("errorString", errorString);
		request.setAttribute("product", product);

		RequestDispatcher dispatcher = request.getServletContext()
		.getRequestDispatcher("/views/admin/editProduct.jsp");
		dispatcher.forward(request, response);

	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Connection conn = SQLServerConnUtils_SQLJDBC.getJDBCConnection();
		String id = (String) request.getParameter("id");
		String productname = (String) request.getParameter("productname");
		String price = (String) request.getParameter("price");
		String detail = (String) request.getParameter("detail");
		String image = (String) request.getParameter("image");
		String category = (String) request.getParameter("category");
		String errorString  = null;
		docDB db = new docDB();
		
		db.updateProduct(productname, price, detail, image, category, id);
		response.sendRedirect(request.getContextPath() + "/admin/productList");
		
	}
}
