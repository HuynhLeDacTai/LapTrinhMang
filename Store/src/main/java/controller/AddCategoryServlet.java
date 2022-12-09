package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.CategoryBO;


@WebServlet("/AddCategoryServlet")
public class AddCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AddCategoryServlet() {
        super();

    }
	CategoryBO categoryBO = new CategoryBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

                 String id = request.getParameter("id");
                 String name =request.getParameter("name");
                 categoryBO.insert(id, name);
                 response.sendRedirect("LoadDataProductServlet");

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
