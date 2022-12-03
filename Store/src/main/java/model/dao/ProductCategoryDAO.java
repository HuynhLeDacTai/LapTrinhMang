package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.ProductCategory;

public class ProductCategoryDAO {


	public Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ltm", "root", "");
		} catch (Exception e) {
			System.err.print("Can't connect to MySQL");
		}
		return con;
	}

	public ArrayList<ProductCategory> getProductCategoryList() {
		ArrayList<ProductCategory> result = new ArrayList<ProductCategory>();

		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select product.id_product,product.name,product.size,product.price,category.name,product.image FROM product INNER JOIN category ON product.id_category = category.id;";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				ProductCategory Product = new ProductCategory(rs.getString("product.id_product"),
						rs.getString("product.name"), rs.getInt("product.size"), rs.getInt("product.price"),
						rs.getString("category.name"), rs.getString("product.image"));
				result.add(Product);
			}

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("Error:  " + e);
		}

		return result;
	}

	public ProductCategory productCate(String id) {
		ProductCategory p = new ProductCategory();
		ProductCategoryDAO productCategoryDAO = new ProductCategoryDAO();
		ArrayList<ProductCategory> list = productCategoryDAO.getProductCategoryList();
		for (ProductCategory productCategory : list) {
			if (productCategory.getId_product().equals(id)) {
				p = productCategory;
				break;
			}
		}
		return p;

	}

}
