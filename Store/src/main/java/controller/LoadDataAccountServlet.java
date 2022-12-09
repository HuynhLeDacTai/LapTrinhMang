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

import model.bean.Account;
import model.bo.AccountBO;

@WebServlet("/LoadDataAccountServlet")
public class LoadDataAccountServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public LoadDataAccountServlet() {

	}

	AccountBO accountBO = new AccountBO();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		if (session.getAttribute("username") == null) {
			response.sendRedirect("LoginServlet");
		} else {
			if (session.getAttribute("isAdmin") != null) {

				String destination = "";
				if (request.getParameterMap().containsKey("update")) {
					if (request.getParameterMap().containsKey("cid")) {
						String id = request.getParameter("cid");
						Account account = accountBO.getAccount(id);
						request.setAttribute("account", account);
						destination = "/edit-account.jsp";
					}
				} else if (request.getParameterMap().containsKey("add")) {
					destination = "/add-account.jsp";
				} else {

					ArrayList<Account> accountList = accountBO.getAccountList();
					request.setAttribute("accountList", accountList);
					destination = "/accounts.jsp";
				}
				RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
				rd.forward(request, response);
			} else {
				response.sendRedirect(request.getContextPath() + "/error-auth.jsp");
			}
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);

	}

}
