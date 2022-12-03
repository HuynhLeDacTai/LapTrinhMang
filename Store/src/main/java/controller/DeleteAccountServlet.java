package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bo.AccountBO;

@WebServlet("/DeleteAccountServlet")
public class DeleteAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public DeleteAccountServlet() {
		// TODO Auto-generated constructor stub
	}

	AccountBO accountBO = new AccountBO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

			if (request.getParameterMap().containsKey("deleteId")) {
				accountBO.deleteAccount(request.getParameter("deleteId"));
			} else {
				String[] ids = request.getParameterValues("selected");
				accountBO.deleteAccounts(ids);
			}
			response.sendRedirect("LoadDataAccountServlet");

		}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
