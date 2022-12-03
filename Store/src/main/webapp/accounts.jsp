<%@page import="model.bean.Account"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Accounts </title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<link rel="stylesheet"
	href="views/admin/template/css/fontawesome.min.css" />
<link rel="stylesheet" href="views/admin/template/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="views/admin/template/css/templatemo-style.css">
</head>

<body id="reportsPage">
	<div class="" id="home">
		<nav class="navbar navbar-expand-xl">
			<div class="container h-100">
				<a class="navbar-brand" href="#">
					<h1 class="tm-site-title mb-0">Product Admin</h1>
				</a>
				<button class="navbar-toggler ml-auto mr-0" type="button"
					data-toggle="collapse" data-target="#navbarSupportedContent"
					aria-controls="navbarSupportedContent" aria-expanded="false"
					aria-label="Toggle navigation">
					<i class="fas fa-bars tm-nav-icon"></i>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mx-auto h-100">
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="LoadDataWebShopServlet"> <i
								class="fas fa-store"></i> <span> Shop</span>
						</a></li>
						<li class="nav-item"><a class="nav-link" href="LoadDataManagerServlet">
								<i class="fas fa-shopping-cart"></i> Products
						</a></li>

						<li class="nav-item"><a class="nav-link active"
							href="accounts.jsp"> <i class="far fa-user"></i> Accounts
						</a></li>
					</ul>
					<% if(session.getAttribute("username") != null){%>
				<ul class="navbar-nav">
					<li class="nav-item">
						<p class="nav-link d-block">Account : <strong><%=session.getAttribute("username") %></strong></p>
					</li>
					<li class="nav-item"><a class="nav-link d-block"
						href="LoginServlet?action=logout"> 
						<b>Logout</b>
					</a></li>
				</ul>
				<%  } %>
				<% if(session.getAttribute("username") == null){%>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="LoginServlet"> 
						<b>Login</b>
					</a></li>
				</ul>
				<%  } %>
				</div>
			</div>
		</nav>
		<div class="container mt-5">
			<div class="tm-bg-primary-dark tm-block tm-block-products">
				<form action="DeleteAccountServlet" method="post">
				<div class="tm-product-table-container">
					<table class="table table-hover tm-table-small tm-product-table">
						<thead>
							<tr>
								<th scope="col">&nbsp;</th>
								<th scope="col">FULLNAME</th>
								<th scope="col">ACCOUNT NAME</th>
								<th scope="col">ACCOUNT EMAIL</th>
								<th scope="col">PHONE</th>
								<th scope="col">&nbsp;</th>
							</tr>
						</thead>
						<tbody>
							<%
							ArrayList<Account> accountList = (ArrayList<Account>)request.getAttribute("accountList");
							for(int i = 0; i < accountList.size(); i++){
								%>
						
							<tr class="tm-account-name">
								<th scope="row"><input type="checkbox" name="selected" value="<%= accountList.get(i).getId()%>"/></th>
								<td><a style="color: #fff" href="LoadDataAccountServlet?cid=<%=accountList.get(i).getId()%>&update=1"><%=accountList.get(i).getName() %></a></td>
								<td><%=accountList.get(i).getUsername() %></td>
								<td><%=accountList.get(i).getMail() %></td>
								<td><%=accountList.get(i).getPhone() %></td>
								<td><a href="DeleteAccountServlet?deleteId=<%=accountList.get(i).getId()%>" class="tm-product-delete-link"><i
										class="far fa-trash-alt tm-product-delete-icon"></i>
								</a></td>
							</tr>
							<%
							}
							%>

						</tbody>
					</table>
				</div>

				<!-- table container -->
				<a href="add-account.jsp"
					class="btn btn-primary btn-block text-uppercase mb-3">Add new account</a>
				<button type="submit" class="btn btn-primary btn-block text-uppercase">
					Delete selected accounts</button>
					</form>
			</div>
							


		</div>
		<footer class="tm-footer row tm-mt-small">
			<div class="col-12 font-weight-light"></div>
		</footer>
	</div>

	<script src="views/admin/template/js/jquery-3.3.1.min.js"></script>
	<script src="views/admin/template/js/bootstrap.min.js"></script>
	<script>
	      
    </script>
</body>
</html>
