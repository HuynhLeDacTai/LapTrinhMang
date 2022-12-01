package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.bean.*;

import model.bo.*;
@WebServlet("/LoadDataManagerServlet")
public class LoadDataManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadDataManagerServlet() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                ProductCategoryBO procate = new ProductCategoryBO();
                CategoryBO category = new CategoryBO();
                ArrayList<ProductCategory> listProduct = procate.getProducCategoryList();
                ArrayList<Category> listCategory=category.getCategoryList();
                request.setAttribute("listCategory", listCategory);
                request.setAttribute("listProduct", listProduct);
                String destination = "/products.jsp";
        		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
        		rd.forward(request, response);
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
