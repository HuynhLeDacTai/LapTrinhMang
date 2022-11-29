package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ProductBO;
import model.bo.CategoryBO;
import model.bean.Account;
import model.bean.Product;
import model.bean.Category;

@WebServlet("/LoadDataWedShopServlet")
public class LoadDataWedShopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoadDataWedShopServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductBO Productbo = new ProductBO();
		CategoryBO Categorybo = new CategoryBO();
		ArrayList<Product> ProductList = Productbo.getProductList();
		ArrayList<Category> cateList = Categorybo.getCategoryList();
		List<Integer> sizes = ProductList.stream()
										 .map(product -> product.getSize())
										 .distinct()
										 .sorted()
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
