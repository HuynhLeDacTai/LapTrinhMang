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
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bo.AccountBO;

@WebServlet("/AddAccountServlet")
public class AddAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public AddAccountServlet() {

	}
	AccountBO accountBO = new AccountBO();
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			response.sendRedirect("LoginServlet");
		} else {
			if (session.getAttribute("isAdmin") != null) {

				ArrayList<Integer> Id = accountBO.getIds();
				List<Integer> listId = Id.stream().sorted().collect(Collectors.toList());
				String id = String.valueOf(listId.get(listId.size() - 1) + 1);
				Account newAccount = new Account(id, request.getParameter("name"), request.getParameter("phone"),
						request.getParameter("email"), request.getParameter("userName"),
						request.getParameter("password"), Integer.parseInt(request.getParameter("roles")));
				accountBO.insert(newAccount);
				response.sendRedirect("LoadDataAccountServlet");
			} else {
				response.sendRedirect(request.getContextPath() + "/error-auth.jsp");
			}
		}

	}

}
