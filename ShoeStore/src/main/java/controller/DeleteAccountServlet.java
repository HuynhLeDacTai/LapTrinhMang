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

import model.bean.Account;
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
				accountBO.Delete(request.getParameter("deleteId"));
			} else {
				String[] ids = request.getParameterValues("selected");
				for (String id : ids) {
					System.out.println(id);
				}
				accountBO.deleteAccounts(ids);
			}
			response.sendRedirect("LoadDataAccountServlet");

		}


	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
