<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.util.stream.Collectors"%>
<%@page import="java.util.stream.Collector"%>
<%@page import="org.eclipse.jdt.internal.compiler.ast.ForeachStatement"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page language="java" import="java.util.ArrayList"%>
<%@page language="java" import="model.bean.Product"%>
<%@page language="java" import="model.bean.Category"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

<head>
<!-- Mobile Specific Meta -->
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- Favicon-->
<link rel="shortcut icon" href="views/web/template/img/fav.png">
<!-- Author Meta -->
<meta name="author" content="CodePixar">
<!-- Meta Description -->
<meta name="description" content="">
<!-- Meta Keyword -->
<meta name="keywords" content="">
<!-- meta character set -->
<meta charset="UTF-8">
<!-- Site Title -->
<title>Shoe Store</title>

<!--
            CSS
            ============================================= -->
<link rel="stylesheet" href="views/web/template/css/linearicons.css"
	type="text/css">
<link rel="stylesheet" href="views/web/template/css/owl.carousel.css"
	type="text/css">
<link rel="stylesheet"
	href="views/web/template/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="views/web/template/css/themify-icons.css"
	type="text/css">
<link rel="stylesheet" href="views/web/template/css/nice-select.css"
	type="text/css">
<link rel="stylesheet" href="views/web/template/css/nouislider.min.css"
	type="text/css">
<link rel="stylesheet" href="views/web/template/css/bootstrap.css"
	type="text/css">
<link rel="stylesheet" href="views/web/template/css/main.css"
	type="text/css">

</head>

<body id="category">


	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="#"><img
						src="views/web/template/img/fav.png" alt=""></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<ul class="nav navbar-nav navbar-right">
						<li class="nav-item">
							<% if(session.getAttribute("username") != null){%>
								<p  style="font-weight: 600;height: 100%;padding-top: 10px; color:#000">Welcome <strong><%=session.getAttribute("username") %></strong></p>
							<%  } %>
						</li>
						<% if( session.getAttribute("isAdmin") != null){%>
							<li class="nav-item">
							<a style="font-weight: 600" class="nav-link d-block"
							href="LoadDataProductServlet"> Manage
							</a></li>
						<%  } %>
							
						<li class="nav-item"><a style="font-weight: 600" class="nav-link d-block"
							href="LoginServlet?action=logout"> Logout
							</a></li>
						<li class="nav-item">
							<button class="search">
							<span style="font-weight:600; font-size: 20px " class="lnr lnr-magnifier" id="search"></span> 

							</button>
						</li>
					</ul>
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form action="SearchProductServlet" method="post"
					class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input"
						name="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div
				class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>Spring Collection is comming!</h1>
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->
	<div class="container">
		<div class="row">
			<div class="col-xl-3 col-lg-4 col-md-5">
				<div class="sidebar-categories">
					<div class="head">Product Filters</div>
					<div class="common-filter">

						<form action="#">
							<ul>
								<%
								ArrayList<Category> CategoryList = (ArrayList<Category>) request.getAttribute("CategoryList");
								for (int i = 0; i < CategoryList.size(); i++) {
								%>
								<li class="filter-list" style="padding-left: 30px;"><label for="apple">
										<a class=""
										href="SearchProductServlet?cid=<%=CategoryList.get(i).getId()%>"><%=CategoryList.get(i).getName()%></a>
								</label></li>
								<%
								}
								%>
							</ul>
						</form>
					</div>
					<div class="common-filter">
						<div class="head">Size</div>
						<form action="#">
							<ul>
								<%
								List<Integer> sizes = (ArrayList<Integer>) request.getAttribute("SizeList");

								for (Integer size : sizes) {
								%>
								<li class="filter-list " style="padding-left: 30px;"><label for="black"><a
										class="" href="SearchProductServlet?cid1=<%=size%>"><%=size%></a></label></li>
								<%
								}
								%>
							</ul>
						</form>
					</div>

				</div>
			</div>
			<div class="col-xl-9 col-lg-8 col-md-7">
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center"></div>
				<!-- End Filter Bar -->
				<!-- Start Best Seller -->
				<section class="lattest-product-area pb-40 category-list">
					<div class="row">
						<!-- Render products -->
						<!-- single product -->
						<%
						ArrayList<Product> ProductList = (ArrayList<Product>) request.getAttribute("ProductList");
		                if(ProductList.isEmpty()){   %>
		                      <div style="margin-left:25% ">
		                      <img class="img-fluid"
									src="https://cdn.dribbble.com/users/760295/screenshots/4433975/media/03494b209a1511a61868ced337b97931.png?compress=1&resize=400x300" alt="">
		                      </div>
		                	
		                <% } else { %>
						<% for (int i = 0; i < ProductList.size(); i++) {
						%>
						<div class="col-lg-4 col-md-6">
							<div class="single-product">
								<img class="img-fluid"
									src="<%=ProductList.get(i).getImage()%>" alt="">
								<div class="product-details">
									<h6><%=ProductList.get(i).getName()%></h6>
									<div class="price">
										<h6><%= ProductList.get(i).getPrice() %> VNĐ</h6>
										<h6 class="size">Size: <%= ProductList.get(i).getSize() %></h6>
									</div>
									<div class="prd-bottom">

										<a href="" class="social-info"> <span class="ti-bag"></span>
											<p class="hover-text">add to bag</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-heart"></span>
											<p class="hover-text">Wishlist</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-sync"></span>
											<p class="hover-text">compare</p>
										</a> <a href="" class="social-info"> <span
											class="lnr lnr-move"></span>
											<p class="hover-text">view more</p>
										</a>
									</div>
								</div>
							</div>
						</div>
						<%
						}}
						%>
					</div>
				</section>
				<!-- End Best Seller -->
				<!-- Start Filter Bar -->
				<div class="filter-bar d-flex flex-wrap align-items-center"></div>
				<!-- End Filter Bar -->
			</div>
		</div>
	</div>

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore dolore magna aliqua.</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Newsletter</h6>
						<p>Stay update with our latest</p>
						<div class="" id="mc_embed_signup">

							<form target="_blank" novalidate="true"
								action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01"
								method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL"
										placeholder="Enter Email" onfocus="this.placeholder = ''"
										onblur="this.placeholder = 'Enter Email '" required=""
										type="email">


									<button class="click-btn btn btn-default">
										<i class="fa fa-long-arrow-right" aria-hidden="true"></i>
									</button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a"
											tabindex="-1" value="" type="text">
									</div>
								</div>
								<div class="info"></div>
							</form>
						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Instragram Feed</h6>
						<ul class="instafeed d-flex flex-wrap">
							<li><img src="views/web/template/img/i1.jpg" alt=""></li>
							<li><img src="views/web/template/img/i2.jpg" alt=""></li>
							<li><img src="views/web/template/img/i3.jpg" alt=""></li>
							<li><img src="views/web/template/img/i4.jpg" alt=""></li>
							<li><img src="views/web/template/img/i5.jpg" alt=""></li>
							<li><img src="views/web/template/img/i6.jpg" alt=""></li>
							<li><img src="views/web/template/img/i7.jpg" alt=""></li>
							<li><img src="views/web/template/img/i8.jpg" alt=""></li>
						</ul>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="#"><i class="fa fa-facebook"></i></a> <a href="#"><i
								class="fa fa-twitter"></i></a> <a href="#"><i
								class="fa fa-dribbble"></i></a> <a href="#"><i
								class="fa fa-behance"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->



	<script src="views/web/template/js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="views/web/template/js/vendor/bootstrap.min.js"></script>
	<script src="views/web/template/js/jquery.ajaxchimp.min.js"></script>
	<script src="views/web/template/js/jquery.nice-select.min.js"></script>
	<script src="views/web/template/js/jquery.sticky.js"></script>
	<script src="views/web/template/js/nouislider.min.js"></script>
	<script src="views/web/template/js/jquery.magnific-popup.min.js"></script>
	<script src="views/web/template/js/owl.carousel.min.js"></script>

	<script src="views/web/template/js/main.js"></script>
</body>

</html>