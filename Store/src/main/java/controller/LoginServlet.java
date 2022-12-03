package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bo.AccountBO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {

	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if (action == null) {
			destination = "/login.jsp";
			request.getRequestDispatcher(destination).forward(request, response);
		} else {
			if (action.equalsIgnoreCase("logout")) {
				session.removeAttribute("username");
				if (session.getAttribute("isAdmin") != null) {
					session.removeAttribute("isAdmin");
				}
				response.sendRedirect("LoginServlet");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		AccountBO accountBO = new AccountBO();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();

		String destination = null;

		Account check = accountBO.getAccountbyUserPass(username, password);
		if (check == null) {
			destination = "/login.jsp";
			response.sendRedirect(request.getContextPath() + destination + "?error=0");
		} else {
			session.setAttribute("username", username);

			if (check.getRole() == 0) {
				// user
				response.sendRedirect("LoadDataWebShopServlet");
			} else {
				// admin
				session.setAttribute("isAdmin", check.getRole());
				response.sendRedirect("LoadDataProductServlet");
			}
		}

	}
}
