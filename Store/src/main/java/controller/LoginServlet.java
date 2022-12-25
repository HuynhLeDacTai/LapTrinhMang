package controller;

import java.io.IOException;
import java.text.DecimalFormat;

import javax.servlet.RequestDispatcher;
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
	private double timeout = 0.1;
	

	public LoginServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String destination = null;
		long startTime = System.currentTimeMillis();
		HttpSession session = request.getSession();
		String action = request.getParameter("action");
		if (session.getAttribute("logfail") != null) {
			session.removeAttribute("logfail");
			destination = "/login.jsp?error=0";
			
			long endTime = System.currentTimeMillis();
			long elapsedTime = endTime - startTime;
			double elapsedTimeInSeconds = elapsedTime / 1000.0;

			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
			System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
			if(elapsedTimeInSeconds > timeout) {
				System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
				response.setStatus(408);
				
			}
			response.addHeader("Response time", elapsedTimeFormatted);
			request.getRequestDispatcher(destination).forward(request, response);
		} else {
			if (action == null) {
				destination = "/login.jsp";
				
				long endTime = System.currentTimeMillis();
				long elapsedTime = endTime - startTime;
				double elapsedTimeInSeconds = elapsedTime / 1000.0;

				DecimalFormat decimalFormat = new DecimalFormat("#.##");
				String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
				System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
				if(elapsedTimeInSeconds > timeout) {
					System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
					response.setStatus(408);
					
				}
				response.addHeader("Response time", elapsedTimeFormatted);
				request.getRequestDispatcher(destination).forward(request, response);
			} else {
				if (action.equalsIgnoreCase("logout")) {
					session.removeAttribute("username");
					if (session.getAttribute("isAdmin") != null) {
						session.removeAttribute("isAdmin");
					}
					long endTime = System.currentTimeMillis();
					long elapsedTime = endTime - startTime;
					double elapsedTimeInSeconds = elapsedTime / 1000.0;

					DecimalFormat decimalFormat = new DecimalFormat("#.##");
					String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
					System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
					if(elapsedTimeInSeconds > timeout) {
						System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
						response.setStatus(408);
						
					}
					response.addHeader("Response time", elapsedTimeFormatted);
					response.sendRedirect("LoginServlet");
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		long startTime = System.currentTimeMillis();
		HttpSession session = request.getSession();
		AccountBO accountBO = new AccountBO();
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String logfail = request.getParameter("logfail");
		String destination = null;

		Account check = accountBO.getAccountbyUserPass(username, password);
		if (check == null) {
			session.setAttribute("logfail", "0");
			long endTime = System.currentTimeMillis();
			long elapsedTime = endTime - startTime;
			double elapsedTimeInSeconds = elapsedTime / 1000.0;

			DecimalFormat decimalFormat = new DecimalFormat("#.##");
			String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
			System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
			if(elapsedTimeInSeconds > timeout) {
				System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
				response.setStatus(408);
				
			}
			response.addHeader("Response time", elapsedTimeFormatted);
			doGet(request, response);
		} else {
			session.setAttribute("username", username);
			if (logfail != null) {
				session.removeAttribute("logfail");
			}
			if (check.getRole() == 0) {
				// user
				// response.sendRedirect("LoadDataWebShopServlet");

				String Destination = "/LoadDataWebShopServlet";

				long endTime = System.currentTimeMillis();
				long elapsedTime = endTime - startTime;
				double elapsedTimeInSeconds = elapsedTime / 1000.0;

				DecimalFormat decimalFormat = new DecimalFormat("#.##");
				String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
				System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
				if(elapsedTimeInSeconds > timeout) {
					System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
					response.setStatus(408);
					
				}
				response.addHeader("Response time", elapsedTimeFormatted);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(Destination);
				rd.forward(request, response);
				

			} else {
				// admin
				session.setAttribute("isAdmin", check.getRole());
				// response.sendRedirect("LoadDataProductServlet");

				String Destination = "/LoadDataProductServlet";

				long endTime = System.currentTimeMillis();
				long elapsedTime = endTime - startTime;
				double elapsedTimeInSeconds = elapsedTime / 1000.0;
				DecimalFormat decimalFormat = new DecimalFormat("#.##");
				String elapsedTimeFormatted = decimalFormat.format(elapsedTimeInSeconds);
				System.out.println("elsapseTime =>>>> " + elapsedTimeFormatted);
				if(elapsedTimeInSeconds > timeout) {
					System.out.println("elsapseTime - timeout =>>>> " + (elapsedTimeInSeconds - timeout));
					response.setStatus(408);
					
				}
				response.addHeader("Response time", elapsedTimeFormatted);
				RequestDispatcher rd = getServletContext().getRequestDispatcher(Destination);
				rd.forward(request, response);

			}
		}

	}
}
