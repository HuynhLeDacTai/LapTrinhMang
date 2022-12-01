package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.bean.Account;
import model.bo.AccountBO;

@WebServlet("/LoadDataAccountServlet")
public class LoadDataAccountServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public LoadDataAccountServlet() {
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountBO accountBO = new AccountBO();
		String destination = "";
		if (request.getParameterMap().containsKey("update")) {
			if (request.getParameterMap().containsKey("cid")) {
				String id = request.getParameter("cid");
				Account account = accountBO.getAccount(id);
				request.setAttribute("account", account);
				destination = "/edit-account.jsp";
			}
		} else {

			ArrayList<Account> accountList = accountBO.getAccountList();
			request.setAttribute("accountList", accountList);
			destination = "/accounts.jsp";
		}
		RequestDispatcher rd = getServletContext().getRequestDispatcher(destination);
		rd.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountBO accountBO = new AccountBO();
		ArrayList<Integer> Id = accountBO.getIds();
		List<Integer> listId = Id.stream().sorted().collect(Collectors.toList());
		String id = String.valueOf(listId.get(listId.size() - 1) + 1);
		System.out.println("Add");
		System.out.println(id);
		Account newAccount = new Account(id, request.getParameter("name"), request.getParameter("phone"),
				request.getParameter("email"), request.getParameter("userName"), request.getParameter("password"),
				Integer.parseInt(request.getParameter("roles")), "ta");
		accountBO.Insert(newAccount);
		doGet(request, response);

	}

}
