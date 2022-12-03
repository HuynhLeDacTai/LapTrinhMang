<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="model.bean.Product"%>
<%@page language="java" import="model.bean.ProductCategory"%>
<%@page language="java" import="model.bean.Category"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta http-equiv="X-UA-Compatible" content="ie=edge" />
<title>Product Page</title>
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,700" />
<!-- https://fonts.google.com/specimen/Roboto -->
<link rel="stylesheet"
	href="views/admin/template/css/fontawesome.min.css" />
<!-- https://fontawesome.com/ -->
<link rel="stylesheet" href="views/admin/template/css/bootstrap.min.css" />
<!-- https://getbootstrap.com/ -->
<link rel="stylesheet"
	href="views/admin/template/css/templatemo-style.css">
<!--
	Product Admin CSS Template
	https://templatemo.com/tm-524-product-admin
	-->
</head>

<body id="reportsPage">
	<nav class="navbar navbar-expand-xl">
		<div class="container h-100">
			<a class="navbar-brand" href="LoadDataManagerServlet">
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
					<li class="nav-item"><a class="nav-link active"
						href="LoadDataProductServlet"> <i class="fas fa-shopping-cart"></i>
							Products
					</a></li>

					<li class="nav-item"><a class="nav-link" href="LoadDataAccountServlet">
							<i class="far fa-user"></i> Accounts
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
<%-- 				<ul class="navbar-nav">
					<li class="nav-item">						
						<% if(session.getAttribute("username") != null){%>
							<p class="nav-link d-block">Account : <strong><%=session.getAttribute("username") %></strong></p>
						<%  } %>
					</li>

					<li class="nav-item"><a class="nav-link d-block"
						href="LoginServlet?action=logout"> 
						<b>Logout</b>
					</a></li>
				</ul> --%>
			</div>
		</div>
	</nav>
	<div class="container mt-5">
		<div class="row tm-content-row">
			<div class="col-sm-12 col-md-12 col-lg-8 col-xl-8 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-products">
					
						<form  action="DeleteProductServlet" method="post">
						<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<thead>
								<tr>
									<th scope="col">&nbsp;</th>
									<th scope="col">PRODUCT NAME</th>
									<th scope="col">SIZE</th>
									<th scope="col">PRICE</th>
									<th scope="col">CATEGORY</th>
									<th scope="col">&nbsp;</th>
								</tr>
							</thead>
							<tbody>
								<!--List product  -->
								<%
						ArrayList<ProductCategory> ProductList=(ArrayList<ProductCategory>)request.getAttribute("listProduct");
						for(int i=0 ;i< ProductList.size();i++){				
			                     %>
								<tr>
									<th scope="row"><input type="checkbox" name="checkRows" value="<%= ProductList.get(i).getId_product() %>" /></th>
									<td class="tm-product-name"><a style="color: #fff" href="LoadEditFormServlet?cid=<%=ProductList.get(i).getId_product()%>"><%= ProductList.get(i).getName() %></a></td>
									<td><%= ProductList.get(i).getSize() %></td>
									<td><%= ProductList.get(i).getPrice() %></td>
									<td><%= ProductList.get(i).getName_category() %></td>
									<td><a href="DeleteProductServlet?idel=<%=ProductList.get(i).getId_product()%>" class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<%} %>


							</tbody>
						</table>
						   </div>
						        <button type="submit" class="btn btn-primary btn-block text-uppercase mb-3" >Delete Selection</button>
						</form>
					
					<!-- table container -->
					<a href="LoadAddFormServlet"
						class="btn btn-primary btn-block text-uppercase mb-3">Add new
						product</a>
				</div>
			</div>
			<div class="col-sm-12 col-md-12 col-lg-4 col-xl-4 tm-block-col">
				<div class="tm-bg-primary-dark tm-block tm-block-product-categories">
					<h2 class="tm-block-title">Product Categories</h2>
					<div class="tm-product-table-container">
						<table class="table table-hover tm-table-small tm-product-table">
							<tbody>
								<!-- List category -->
								<%
						ArrayList<Category> CategoryList=(ArrayList<Category>)request.getAttribute("listCategory");
						for(int i=0 ;i< CategoryList.size();i++){				
			                    %>
								<tr>
									<td class="tm-product-name"><%= CategoryList.get(i).getName() %></td>
									<td class="text-center"><a href="DeleteCategoryServlet?idcate=<%=CategoryList.get(i).getId() %>"
										class="tm-product-delete-link"> <i
											class="far fa-trash-alt tm-product-delete-icon"></i>
									</a></td>
								</tr>
								<%} %>
							</tbody>
						</table>
					</div>
					<!-- table container -->
					<a href="LoadAddCategoryServlet"><button class="btn btn-primary btn-block text-uppercase mb-3">
						Add new category</button></a>
				</div>
			</div>
		</div>
	</div>
	<footer class="tm-footer row tm-mt-small">
		<div class="col-12 font-weight-light"></div>
	</footer>

	<script src="views/admin/template/js/jquery-3.3.1.min.js"></script>
	<!-- https://jquery.com/download/ -->
	<script src="views/admin/template/js/bootstrap.min.js"></script>
	<!-- https://getbootstrap.com/ -->
</body>
</html>