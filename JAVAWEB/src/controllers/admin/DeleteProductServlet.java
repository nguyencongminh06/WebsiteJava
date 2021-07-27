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

import beans.Product;
import model.SQLServerConnUtils_SQLJDBC;
import model.docDB;

@WebServlet(urlPatterns = { "/admin/deleteProduct" })
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProductServlet() {
		super();
	}

	protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        //b1: get data from dao
        String id = (String) request.getParameter("id");
		docDB db = new docDB();
			db.deleteProduct(id);
			response.sendRedirect(request.getContextPath() + "/admin/productList");
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