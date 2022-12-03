<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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

					<li class="nav-item"><a class="nav-link " href="LoadDataAccountServlet">
							<i class="far fa-user"></i> Accounts
					</a></li>>
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
						<div class="col-12">
							<h2 class="tm-block-title d-inline-block">Add Product</h2>
						</div>
					</div>
					<div class="row tm-edit-product-row">
						<div class="col-xl-6 col-lg-6 col-md-12">
							<form action="AddProductServlet" class="tm-edit-product-form" method="post">
								<div class="form-group mb-3">
									<label for="name">Product Name
									</label> <input id="name" name="nameProduct" type="text"
										class="form-control validate" required />
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label>
									<select class="custom-select tm-select-accounts" id="category" name="category">
									<option selected>Select category</option>
									<%
						ArrayList<Category> categoryList=(ArrayList<Category>)request.getAttribute("listCategory");
						for(int i=0 ;i< categoryList.size();i++){				
			                         %>
										<option value="<%= categoryList.get(i).getId() %>"><%= categoryList.get(i).getName() %></option>
									<%} %>
									</select>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="size">Size </label>
										<input id="size" name="size" type="text"
											class="form-control validate" data-large-mode="true" />
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="prices">Prices
										</label> <input id="prices" name="prices" type="text"
											class="form-control validate" required />
									</div>
								</div>
								<div class="form-group mb-3">
									<label for="image">Image </label> <input
										id="image" name="image" type="text"
										class="form-control validate" required />
								</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<img class="tm-product-img-dummy mx-auto " id="linkimg" alt="" src="https://th.bing.com/th/id/R.e77cc490dab8f27130db34b3969d95df?rik=q6uLCjc3NPGDbQ&riu=http%3a%2f%2fwww.clker.com%2fcliparts%2f7%2fL%2fY%2fh%2fC%2fi%2fimage-not-available-hi.png&ehk=gknG%2bl2FEyNdCYMVFpKHzJW2Hwmacb47VzpKAsSJFJo%3d&risl=&pid=ImgRaw&r=0">
							<div class="custom-file mt-3 mb-3">
							        <input
									type="button" class="btn btn-primary btn-block mx-auto"
									value="UPLOAD PRODUCT IMAGE"
									name ="addbtn"
									onclick="Mylink()" />
							</div>
						</div>
						<div class="col-12">
							<button type="submit"
								class="btn btn-primary btn-block text-uppercase">Add
								Product Now</button>
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
    function Mylink() {
    	var img=document.getElementById('image').value;
    	document.getElementById('linkimg').src=img;
	}
    </script>
</body>
</html>
