package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bo.CategoryBO;
@WebServlet("/LoadAddCategoryServlet")
public class LoadAddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoadAddCategoryServlet() {

    }

    CategoryBO categoryBO = new CategoryBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		if(session.getAttribute("username") == null){
			response.sendRedirect("LoginServlet");
		}
		else {
			if(session.getAttribute("isAdmin") != null)
			{

                       List<Integer> listId = categoryBO.getID().stream()
              				 .sorted()
              				 .collect(Collectors.toList());
                       request.setAttribute("id", "H"+(listId.get(listId.size()-1)+1));
                       String destination = "/add-category.jsp";
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
		doGet(request, response);
	}

}
