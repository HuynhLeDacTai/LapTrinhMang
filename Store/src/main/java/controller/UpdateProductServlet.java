package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.ProductBO;

/**
 * Servlet implementation class UpdateProductServlet
 */
@WebServlet("/UpdateProductServlet")
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public UpdateProductServlet() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductBO bo = new ProductBO();
     
		String name=  request.getParameter("nameProduct");
		String category=  request.getParameter("category");
		String size=request.getParameter("size");
		String prices=  request.getParameter("prices");
		String image=  request.getParameter("image");
		String id = request.getParameter("cid");
         bo.Update(id, name, category, Integer.parseInt(size), Integer.parseInt(prices), image);
		response.sendRedirect("LoadDataProductServlet");     
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
