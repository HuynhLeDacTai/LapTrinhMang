<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Accounts - Product Admin Template</title>
    <link
      rel="stylesheet"
      href="https://fonts.googleapis.com/css?family=Roboto:400,700"
    />
    <link rel="stylesheet" href="template/css/fontawesome.min.css" />
    <link rel="stylesheet" href="template/css/bootstrap.min.css" />
    <link rel="stylesheet" href="template/css/templatemo-style.css">
  </head>

  <body id="reportsPage">
    <div class="" id="home">
      <nav class="navbar navbar-expand-xl">
        <div class="container h-100">
          <a class="navbar-brand" href="#">
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
                href="../web/shop.jsp"
                >
                <i class="fas fa-store"></i>
                  <span> Shop</span>
                </a>

              </li>
              <li class="nav-item">
                <a class="nav-link" href="products.jsp">
                  <i class="fas fa-shopping-cart"></i> Products
                </a>
              </li>

              <li class="nav-item">
                <a class="nav-link active" href="accounts.jsp">
                  <i class="far fa-user"></i> Accounts
                </a>
              </li>
            </ul>
            <ul class="navbar-nav">
              <li class="nav-item">
                <a class="nav-link d-block" href="login.jsp">
                  Admin, <b>Logout</b>
                </a>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <div class="container mt-5">
        <!-- row -->
        <div class="row tm-content-row">
          <div class="tm-block-col tm-col-avatar">
            <div class="tm-bg-primary-dark tm-block tm-block-avatar">
              <h2 class="tm-block-title">Change Avatar</h2>
              <div class="tm-avatar-container">
                <img
                  src="template/img/avatar.png"
                  alt="Avatar"
                  class="tm-avatar img-fluid mb-4"
                />
                <a href="#" class="tm-avatar-delete-link">
                  <i class="far fa-trash-alt tm-product-delete-icon"></i>
                </a>
              </div>
              <button class="btn btn-primary btn-block text-uppercase">
                Upload New Photo
              </button>
            </div>
          </div>
          <div class="tm-block-col tm-col-account-settings">
            <div class="tm-bg-primary-dark tm-block tm-block-settings">
              <h2 class="tm-block-title">Account Settings</h2>
              <form action="" class="tm-signup-form row">
                <div class="form-group col-lg-6">
                  <label for="name">Account Name</label>
                  <input
                    id="name"
                    name="name"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="name">Fullname</label>
                  <input
                    id="fullName"
                    name="fullName"
                    type="text"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="email">Account Email</label>
                  <input
                    id="email"
                    name="email"
                    type="email"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password">Password</label>
                  <input
                    id="password"
                    name="password"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="password2">Re-enter Password</label>
                  <input
                    id="password2"
                    name="password2"
                    type="password"
                    class="form-control validate"
                  />
                </div>
                <div class="form-group col-lg-6">
                  <label for="phone">Phone</label>
                  <input
                    id="phone"
                    name="phone"
                    type="tel"
                    class="form-control validate"
                  />
                </div>
                <div class="col-12" style="margin-bottom: 16px;">
                  <button 
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Update Your Account
                  </button>
                </div>
                <div class="col-12">
                  <button
                    type="submit"
                    class="btn btn-primary btn-block text-uppercase"
                  >
                    Delete Your Account
                  </button>
                </div>
              </form>
            </div>
          </div>
        </div>
        <div class="tm-bg-primary-dark tm-block tm-block-products">
          <div class="tm-product-table-container">
            <table class="table table-hover tm-table-small tm-product-table">
              <thead>
                <tr>
                  <th scope="col">&nbsp;</th>
                  <th scope="col">ACCOUNT NAME</th>
                  <th scope="col">ACCOUNT EMAIL</th>
                  <th scope="col">PHONE</th>
                  <th scope="col">EXPIRE DATE</th>
                  <th scope="col">&nbsp;</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 1</td>
                  <td>1,450</td>
                  <td>550</td>
                  <td>28 March 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 2</td>
                  <td>1,250</td>
                  <td>750</td>
                  <td>21 March 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 3</td>
                  <td>1,100</td>
                  <td>900</td>
                  <td>18 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 4</td>
                  <td>1,400</td>
                  <td>600</td>
                  <td>24 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 5</td>
                  <td>1,800</td>
                  <td>200</td>
                  <td>22 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 6</td>
                  <td>1,000</td>
                  <td>1,000</td>
                  <td>20 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 7</td>
                  <td>500</td>
                  <td>100</td>
                  <td>10 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 8</td>
                  <td>1,000</td>
                  <td>600</td>
                  <td>08 Feb 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 9</td>
                  <td>1,200</td>
                  <td>800</td>
                  <td>24 Jan 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 10</td>
                  <td>1,600</td>
                  <td>400</td>
                  <td>22 Jan 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
                <tr>
                  <th scope="row"><input type="checkbox" /></th>
                  <td class="tm-product-name">Lorem Ipsum Product 11</td>
                  <td>2,000</td>
                  <td>400</td>
                  <td>21 Jan 2019</td>
                  <td>
                    <a href="#" class="tm-product-delete-link">
                      <i class="far fa-trash-alt tm-product-delete-icon"></i>
                    </a>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <!-- table container -->
          <a
            href="add-product.jsp"
            class="btn btn-primary btn-block text-uppercase mb-3">Add new account</a>
          <button class="btn btn-primary btn-block text-uppercase">
            Delete selected accounts
          </button>
        </div>
      </div>
      <footer class="tm-footer row tm-mt-small">
        <div class="col-12 font-weight-light">
        </div>
      </footer>
    </div>

    <script src="template/js/jquery-3.3.1.min.js"></script>
    <script src="template/js/bootstrap.min.js"></script>
  </body>
</html>
    