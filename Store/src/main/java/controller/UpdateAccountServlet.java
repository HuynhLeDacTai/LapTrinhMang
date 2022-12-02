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

@WebServlet("/UpdateAccountServlet")
public class UpdateAccountServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {


	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		AccountBO accountBO = new AccountBO();
		Account newAccount = new Account(
				request.getParameter("cid"),
				request.getParameter("name"),
				request.getParameter("phone"),
				request.getParameter("email"),
				request.getParameter("userName"),
				request.getParameter("password"),
				Integer.parseInt(request.getParameter("roles")),
				"ta"
				);
		System.out.println(newAccount.getId());
		accountBO.Update(newAccount); 
		response.sendRedirect("LoadDataAccountServlet");
		

	}
}
