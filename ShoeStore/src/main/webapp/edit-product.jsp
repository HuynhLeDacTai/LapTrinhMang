<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.util.ArrayList"%>
	<%@page language="java" import="model.bean.Category"%>
	<%@page language="java" import="model.bean.ProductCategory"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Edit Product</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <link rel="stylesheet" href="views/admin/template/css/fontawesome.min.css" />
    <link rel="stylesheet" href="views/admin/template/jquery-ui-datepicker/jquery-ui.min.css" type="text/css" />
    <link rel="stylesheet" href="views/admin/template/css/bootstrap.min.css" />
    <link rel="stylesheet" href="views/admin/template/css/templatemo-style.css">

  </head>

  <body>
    <nav class="navbar navbar-expand-xl">
      <div class="container h-100">
        <a class="navbar-brand" href="LoadDataManagerServlet">
          <h1 class="tm-site-title mb-0">Product Admin</h1>
        </a>
        <button
          class="navbar-toggler ml-auto mr-0"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <i class="fas fa-bars tm-nav-icon"></i>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mx-auto h-100">

            <li class="nav-item dropdown">
              <a
                class="nav-link dropdown-toggle"
                href="LoadDataWedShopServlet"
              >
              <i class="fas fa-store"></i>
              <span> Shop</span>
              </a>
            </li>
            <li class="nav-item">
              <a class="nav-link " href="LoadDataManagerServlet">
                <i class="fas fa-shopping-cart"></i> Products
              </a>
            </li>

            <li class="nav-item">
              <a class="nav-link" href="accounts.jsp">
                <i class="far fa-user"></i> Accounts
              </a>
            </li>
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
                <h2 class="tm-block-title d-inline-block">Edit Product</h2>
              </div>
            </div>
            <div class="row tm-edit-product-row">
              <div class="col-xl-6 col-lg-6 col-md-12">
               <%ProductCategory p =(ProductCategory)request.getAttribute("Product"); %>
                <form action="UpdateProductServlet?cid=<%= p.getId_product()%>" class="tm-edit-product-form" method="post">
               
								<div class="form-group mb-3">
									<label for="name">Product Name
									</label> <input id="name" name="nameProduct" type="text"
										class="form-control validate" required value="<%= p.getName()%>" />
								</div>
								<div class="form-group mb-3">
									<label for="category">Category</label>
									<select class="custom-select tm-select-accounts" id="category" name="category">
									
									<%
						ArrayList<Category> categoryList=(ArrayList<Category>)request.getAttribute("listCategory");
						for(int i=0 ;i< categoryList.size();i++){
							                   if(p.getName_category()==categoryList.get(i).getName()){  %>
							                	   <option value="<%= categoryList.get(i).getId() %>" selected="selected"><%= categoryList.get(i).getName() %></option>
							                   <% }
							                   else {
							                   %>
							                <option value="<%= categoryList.get(i).getId() %>" ><%= categoryList.get(i).getName() %></option>
							               <% } %>
									<%} %>
									</select>
								</div>
								<div class="row">
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="size">Size </label>
										<input id="size" name="size" type="text" value="<%= p.getSize()%>"
											class="form-control validate" data-large-mode="true" />
									</div>
									<div class="form-group mb-3 col-xs-12 col-sm-6">
										<label for="prices">Prices
										</label> <input id="prices" name="prices" type="text" value="<%= p.getPrice()%>"
											class="form-control validate" required />
									</div>
								</div>
								<div class="form-group mb-3">
									<label for="image">Image </label> <input
										id="image" name="image" type="text" value="<%= p.getImage() %>"
										class="form-control validate" required />
								</div>
						</div>
						<div class="col-xl-6 col-lg-6 col-md-12 mx-auto mb-4">
							<img class="tm-product-img-dummy mx-auto " id="linkimg" alt="" src="<%= p.getImage() %>">
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
								class="btn btn-primary btn-block text-uppercase">Update Now</button>
						</div>
						</form>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
        </div>
    </footer> 

    <script src="views/admin/template/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="views/admin/template/jquery-ui-datepicker/jquery-ui.min.js"></script>
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
