<%@page import="model.bean.Account"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Edit Product - Dashboard HTML Template</title>
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
						class="nav-link dropdown-toggle" href="shop.jsp"> <i
							class="fas fa-store"></i> <span> Shop</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="products.jsp">
							<i class="fas fa-shopping-cart"></i> Products
					</a></li>

					<li class="nav-item"><a class="nav-link active"
						href="LoadDataAccountServlet"> <i class="far fa-user"></i> Accounts
					</a></li>
				</ul>
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link d-block"
						href="login.jsp"> Admin, <b>Logout</b>
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
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Edit Account</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<% Account account = (Account)request.getAttribute("account"); %>
							<form action="UpdateAccountServlet?cid=<%=account.getId()%>&update=1" class="tm-edit-product-form" method="post">
								<div class="form-group mb-3">
									<label for="name">Account Name </label> <input id="name"
										name="name" type="text" class="form-control validate" required  value="<%=account.getName() %>"/>
								</div>
								<div class="form-group mb-3">
									<label for="phone">Phone </label> <input id="phone"
										name="phone" type="text" class="form-control validate"
										required value="<%=account.getPhone() %>"/>
								</div>
								<div class="form-group mb-3">
									<label for="email">Email </label> <input id="email"
										name="email" type="text"
										class="form-control validate" required value="<%=account.getMail() %>"/>
								</div>
								<div class="form-group mb-3">
									<label for="userName">Username </label> <input id="userName"
										name="userName" type="text"
										class="form-control validate" required value="<%=account.getUsername() %>"/>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="password">Password </label> <input id="password" name="password"
											type="text" class="form-control validate"
											data-large-mode="true" value="<%=account.getPassword() %>"/>
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="roles">Roles </label> <input id="roles"
											name="roles" type="text" class="form-control validate"
											required value="<%=account.getRole()%>"/>
									</div>
								</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<img class="tm-product-img-dummy mx-auto" src="<%=account.getImage()%>">
								
							</img>
							<div class="custom-file mt-3 mb-3">
								<input id="fileInput" type="file" style="display: none;" /> <input
									type="button" class="btn btn-primary btn-block mx-auto"
									value="UPLOAD ACCOUNT IMAGE"
									onclick="" />
							</div>
						</div>
						<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Edit Account Now</button>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light"></div>
	</footer>

	<script src="views/admin/template/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script
		src="views/admin/template/jquery-ui-datepicker/jquery-ui.min.js"></script>
	<!-- https://jqueryui.com/download/ -->
	<script src="views/admin/template/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
	<script>
		$(function() {
			$("#expire_date").datepicker();
		});
	</script>
</body>
</html>
