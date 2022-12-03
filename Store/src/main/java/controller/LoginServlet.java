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
import javax.servlet.http.HttpSession;

import model.bean.Account;
import model.bean.Category;
import model.bean.Product;
import model.bo.AccountBO;
import model.bo.CategoryBO;
import model.bo.ProductBO;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	public LoginServlet() {
		super();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if(action == null)
		{
			destination = "/login.jsp";
			request.getRequestDispatcher(destination).forward(request, response);
		}else {
			if(action.equalsIgnoreCase("logout"))
			{
				session.removeAttribute("username");
				if(session.getAttribute("isAdmin") != null) {
					session.removeAttribute("isAdmin");					
				}
				response.sendRedirect("LoginServlet");
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		
		String destination = null;
		AccountBO accountBO = new AccountBO();
		Account check = accountBO.getAccountbyUserPass(username, password);
		if(check == null)
		{
			destination = "/login.jsp";
			response.sendRedirect(request.getContextPath()+ destination + "?error=0");
//			request.getRequestDispatcher(destination).forward(request, response);
		}
		else
		{
			session.setAttribute("username", username);
			
			if(check.getRole() == 0)
			{
				//user
//				destination = "/LoadDataWedShopServlet";
//				request.getRequestDispatcher(destination).forward(request, response);
				response.sendRedirect("LoadDataWebShopServlet");
			}
			else
			{
				//admin
				session.setAttribute("isAdmin", check.getRole());
//				destination = "/LoadDataManagerServlet";
//				request.getRequestDispatcher(destination).forward(request, response);
				response.sendRedirect("LoadDataManagerServlet");
			}
		}

	}
}
