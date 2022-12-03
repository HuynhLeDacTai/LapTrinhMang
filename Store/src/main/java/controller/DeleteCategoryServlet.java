package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.CategoryBO;

/**
 * Servlet implementation class DeleteCategoryServlet
 */
@WebServlet("/DeleteCategoryServlet")
public class DeleteCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public DeleteCategoryServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CategoryBO bo = new CategoryBO();
		if(request.getParameterMap().containsKey("idcate")) {
			String	id= request.getParameter("idcate");
				bo.Delete(id);
			}
		response.sendRedirect("LoadDataProductServlet");   
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
