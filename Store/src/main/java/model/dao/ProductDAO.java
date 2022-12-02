package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Product;
import model.bean.Product;

public class ProductDAO {
	public Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ltm", "root", "");
		} catch (Exception e) {
			System.err.print("Khong ket noi dc");
		}
		return con;
	}

	public ArrayList<Product> getProductList() {
		ArrayList<Product> result = new ArrayList<Product>();

		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "Select * from product";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product Product = new Product(rs.getString("id_product"), rs.getString("name"),
						rs.getString("id_category"), rs.getInt("size"), rs.getInt("price"), rs.getString("image"));
				result.add(Product);
			}

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("Error:  " + e);
		}

		return result;
	}

	public void Insert(String id_product, String name, String id_category, int size, int price, String image) {
		String query = "Insert into product(id_product,name,id_category,size,price,image) values(?,?,?,?,?,?)";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, id_product);
			p.setString(2, name);
			p.setString(3, id_category);
			p.setInt(4, size);
			p.setInt(5, price);
			p.setString(6, image);
			p.execute();
			p.close();
		} catch (Exception e) {

		}
	}

	public void Delete(String id_product) {
		String query = "Delete from product where id_product = '" + id_product + "'";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
	public void Deletes(String[] id_product) {
		
		try {
			Connection con = getConnection();
			for(int i=0 ;i<id_product.length;i++) {
				String query = "Delete from product where id_product = '" + id_product[i] + "'";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	

	public void Update(String id_product, String name, String id_category, int size, int price, String image) {
		String query = "UPDATE product SET name=?,id_category=?,size=? ,price=?,image=? WHERE id_product ='"
				+ id_product + "'";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, name);
			p.setString(2, id_category);
			p.setInt(3, size);
			p.setInt(4, price);
			p.setString(5, image);
			p.executeUpdate();
			p.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public Product getDetail(String id) {
		ArrayList<Product> list = getProductList();
		Product a = new Product();
		for (Product Product : list) {
			if (Product.getId_product().equals(id)) {
				a = Product;
			}
		}
		return a;
	}

	public ArrayList<Product> searchByIdCategory(String id) {
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<Product> list = getProductList();
		for (Product product : list) {
			if (product.getId_category().equals(id)) {
				p.add(product);
			}
		}
		return p;
	}

	public ArrayList<Product> searchBySize(int size) {
		ArrayList<Product> p = new ArrayList<Product>();
		ArrayList<Product> list = getProductList();
		for (Product product : list) {
			if (product.getSize() == size) {
				p.add(product);
			}
		}
		return p;
	}

	public ArrayList<Product> searchByName(String name) {
		ArrayList<Product> result = new ArrayList<Product>();
		String s = '"' + "%" + name + "%" + '"';
		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "Select * from product where name LIKE " + s;
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Product Product = new Product(rs.getString("id_product"), rs.getString("name"),
						rs.getString("id_category"), rs.getInt("size"), rs.getInt("price"), rs.getString("image"));
				result.add(Product);
			}

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("Error:  " + e);
		}

		return result;
	}

	public ArrayList<Integer> getId() {
		ArrayList<Integer> p = new ArrayList<Integer>();
		ArrayList<Product> list = getProductList();
		for (Product product : list) {
			p.add(Integer.parseInt(product.getId_product()));
		}

		return p;
	}

}
