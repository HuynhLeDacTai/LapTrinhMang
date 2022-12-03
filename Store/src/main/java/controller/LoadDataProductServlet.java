package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Category;
import model.bean.ProductCategory;
import model.bo.CategoryBO;
import model.bo.ProductCategoryBO;

@WebServlet("/LoadDataProductServlet")
public class LoadDataProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadDataProductServlet() {

	}



	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			response.sendRedirect("LoginServlet");
		} else {
			if (session.getAttribute("isAdmin") != null) {
				ProductCategoryBO productCategoryBO = new ProductCategoryBO();
				CategoryBO category = new CategoryBO();
				ArrayList<ProductCategory> listProduct = productCategoryBO.getProducCategoryList();
				ArrayList<Category> listCategory = category.getCategoryList();
				request.setAttribute("listCategory", listCategory);
				request.setAttribute("listProduct", listProduct);
				String destination = "/products.jsp";
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/error-auth.jsp");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
