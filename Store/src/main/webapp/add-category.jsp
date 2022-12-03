<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="ISO-8859-1"%>
	<%@page language="java" import="java.util.ArrayList"%>
	<%@page language="java" import="model.bean.Category"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Add Product</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="views/admin/template/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet"
	href="views/admin/template/jquery-ui-datepicker/jquery-ui.min.css"
	type="text/css" />
<!-- http://api.jqueryui.com/datepicker/ -->
<link rel="stylesheet" href="views/admin/template/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="views/admin/template/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body>
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
						class="nav-link dropdown-toggle" href="LoadDataWebShopServlet">
							<i class="fas fa-store"></i> <span> Shop</span>
					</a></li>
					<li class="nav-item"><a class="nav-link active "
						href="LoadDataManagerServlet"> <i class="fas fa-shopping-cart"></i>
							Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="LoadDataAccountServlet">
							<i class="far fa-user"></i> Accounts
					</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item">						
						<% if(session.getAttribute("username") != null){%>
							<p class="nav-link d-block">Account : <strong><%=session.getAttribute("username") %></strong></p>
						<%  } %>
					</li>

					<li class="nav-item"><a class="nav-link d-block"
						href="LoginServlet?action=logout"> 
						<b>Logout</b>
					</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container tm-mt-big tm-mb-big">
		<div class="row">
			<div class="col-xl-9 col-lg-10 col-md-12 col-sm-12 mx-auto">
				<div class="tm-bg-primary-dark tm-block tm-block-h-auto">
					<div class="row">
						<div class="col-12" style="text-align: center">
							<h2 class="tm-block-title d-inline-block">ADD CATEGORY</h2>
						</div>
					</div>
					<div style="width: 100%">
						
							<form action="AddCategoryServlet" class="tm-edit-product-form" method="post">
								<div class="form-group mb-3">
								<% String id = (String)request.getAttribute("id"); %>
									<label for="id">ID Category</label> 
									<input style="color: #000" id="id" name="id" type="text" value="<%= id %>" readonly
										class="form-control validate" required />
								</div>
								<div class="form-group mb-3">
									<label for="name">Name Category </label> <input
										id="name" name="name" type="text"
										class="form-control validate" required />
								</div>
						
						<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Add
								Category Now</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<script src="views/admin/template/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="views/admin/template/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="views/admin/template/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>