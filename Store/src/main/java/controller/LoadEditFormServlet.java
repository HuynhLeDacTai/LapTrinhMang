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
import model.bo.ProductBO;
import model.bo.ProductCategoryBO;


@WebServlet("/LoadEditFormServlet")
public class LoadEditFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoadEditFormServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null){
			response.sendRedirect("LoginServlet");
		}
		else {
			if(session.getAttribute("isAdmin") != null)
			{
		 ProductCategoryBO procate = new ProductCategoryBO();
		  CategoryBO bo = new CategoryBO();
	      ArrayList<Category> listCategory = bo.getCategoryList();
		 ProductCategory p = new ProductCategory();
		if(request.getParameterMap().containsKey("cid")) {
			String id= request.getParameter("cid");
			p=procate.productCate(id);
			
		}
		request.setAttribute("Product", p);
		request.setAttribute("listCategory", listCategory);
		String destination = "/edit-product.jsp";
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);
			}
			else
			{
				response.sendRedirect(request.getContextPath()+ "/error-auth.jsp");
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
