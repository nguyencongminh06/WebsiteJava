package controllers.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import beans.Product;
import beans.BillProduct;
import model.docDB;
import beans.Product;

/**
 * Servlet implementation class AddToCart
 */
@WebServlet("/AddToCart")
public class AddToCart extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		docDB db = new docDB();
		String id = req.getParameter("id");
		Product product = db.get(id);
		
		HttpSession session = req.getSession();
		Object obj = session.getAttribute("cart");// luu tam vao session
		if (obj == null) {// tao moi
			// Tao mat hang
			BillProduct billProduct = new BillProduct();
			billProduct.setId(id);
			billProduct.setProduct(product);
			billProduct.setQuantity(1);
			billProduct.setUnitPrice(product.getPrice());
			
			// gio hang co nhieu mat hang
			Map<String, BillProduct> map = new HashMap<>();
			map.put(id, billProduct);// them mat hang vao ds

			session.setAttribute("cart", map); //private long unitPrice;
			
		} else {
			Map<String, BillProduct> map = (Map<String, BillProduct>) obj;

			BillProduct billProduct = map.get(id);

			if (billProduct == null) {
				billProduct = new BillProduct();
				billProduct.setId(id);
				billProduct.setProduct(product);
				billProduct.setQuantity(1);
				billProduct.setUnitPrice(product.getPrice());

				map.put(id, billProduct);
			} else {

				billProduct.setQuantity(billProduct.getQuantity() + 1);
			}

			session.setAttribute("cart", map);// luu tam vao session
		}

		resp.sendRedirect(req.getContextPath() + "/home");
	}

}
