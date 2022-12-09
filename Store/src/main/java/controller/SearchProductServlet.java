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
import model.bean.*;
import model.bo.*;

@WebServlet("/SearchProductServlet")
public class SearchProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public SearchProductServlet() {

    }
	ProductBO productBO = new ProductBO();
	CategoryBO categoryBO = new CategoryBO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		ArrayList<Product> listP = new ArrayList<Product>();
		ArrayList<Category> cateList = categoryBO.getCategoryList();
		ArrayList<Product> ProductList = productBO.getProductList();
		List<Integer> sizes = ProductList.stream()
										 .map(product -> product.getSize())
										 .distinct()
										 .sorted()
										 .collect(Collectors.toList());
		if(request.getParameterMap().containsKey("cid")) {
			String CateId = request.getParameter("cid");
			listP=productBO.searchByIdCategory(CateId);
		}
		else if(request.getParameterMap().containsKey("cid1")) {
			String Size   =request.getParameter("cid1");
			listP=productBO.searchBySize(Integer.parseInt(Size));
			
		}
		else {
			String txt =request.getParameter("search_input");
			listP=productBO.searchByName(txt);
		}
		request.setAttribute("SizeList", sizes);
		request.setAttribute("CategoryList", cateList);
		request.setAttribute("ProductList", listP);
		String destination = "/shop.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
