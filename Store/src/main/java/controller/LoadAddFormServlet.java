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
import model.bo.CategoryBO;
@WebServlet("/LoadAddFormServlet")
public class LoadAddFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public LoadAddFormServlet() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null){
			response.sendRedirect("LoginServlet");
		}
		else
		{
			if(session.getAttribute("isAdmin") != null)
			{
		      CategoryBO bo = new CategoryBO();
		      ArrayList<Category> listCategory = bo.getCategoryList();
		      request.setAttribute("listCategory", listCategory);
		      String destination = "/add-product.jsp";
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
