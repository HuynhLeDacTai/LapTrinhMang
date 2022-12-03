package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ProductBO;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/DeleteProductServlet")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public DeleteProductServlet() {
        super();
       
    }
	ProductBO productBO = new ProductBO();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		if(request.getParameterMap().containsKey("idel")) {
		String	id= request.getParameter("idel");
			productBO.deleteProduct(id);
		}
		else{
			String[] listIdProduct = request.getParameterValues("checkRows");

			productBO.deleteProducts(listIdProduct);
		}
		
		response.sendRedirect("LoadDataProductServlet");   
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
