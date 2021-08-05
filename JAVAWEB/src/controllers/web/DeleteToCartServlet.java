package controllers.web;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.BillProduct;

/**
 * Servlet implementation class DeleteToCartServlet
 */
@WebServlet("/deleteToCart")
public class DeleteToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");

		// gio hang co nhieu mat hang
		HttpSession session = request.getSession();
		Object obj = session.getAttribute("cart");// luu tam vao session

		if (obj != null) {
			Map<String, BillProduct> map = (Map<String, BillProduct>) obj;
			map.remove(id);
			// update lai vao session
			session.setAttribute("cart", map);
		}
		// chuyen ve trang gio hang
		response.sendRedirect(request.getContextPath() + "/cart");
	}
	

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
