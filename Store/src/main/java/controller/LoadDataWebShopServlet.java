package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Category;
import model.bean.Product;
import model.bo.CategoryBO;
import model.bo.ProductBO;

@WebServlet("/LoadDataWebShopServlet")
public class LoadDataWebShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadDataWebShopServlet() {

	}
	ProductBO productBO = new ProductBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		CategoryBO Categorybo = new CategoryBO();
		ArrayList<Product> ProductList = productBO.getProductList();
		ArrayList<Category> cateList = Categorybo.getCategoryList();
		List<Integer> sizes = ProductList.stream().map(product -> product.getSize()).distinct().sorted()
				.collect(Collectors.toList());

		request.setAttribute("SizeList", sizes);
		request.setAttribute("CategoryList", cateList);
		request.setAttribute("ProductList", ProductList);
		String destination = "/shop.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);

	}

}
