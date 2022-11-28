package model.dao;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import model.bean.Category;


public class CategoryDAO {

	public static Connection getConnection() {

		Connection con = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ltm", "root", "");
		} catch (Exception e) {
			System.err.print("Khong ket noi dc");
		}
		return con;
	}

	public static ArrayList<Category> getCategoryList() {
		ArrayList<Category> result = new ArrayList<Category>();

		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "Select * from category";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Category Category = new Category(rs.getString("id"), rs.getString("name"));
				result.add(Category);
			}

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("Error:  " + e);
		}

		return result;
	}

	public static void Insert(String id, String name) {
		String query = "Insert into category(id,name) values(?,?)";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, id);
			p.setString(2, name);
			p.execute();
			p.close();
		} catch (Exception e) {

		}
	}

	public static void Delete(String id) {
		String query = "Delete from category where id = '" + id + "'";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public static void Update(String id, String name) {
		String query = "UPDATE category SET name=? where id = '" + id + "'";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, name);
			p.executeUpdate();
			p.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
	
//	public static void main(String[] args) {
//	ArrayList<Category> result = new ArrayList<Category>();
//	result = getCategoryList();
//	for (Category Category : result) {
//		System.out.println(Category.getName());
//	}
		//Insert("H5","BVH");
		//Update("H5","Cake");
		//Delete("H5");
//}
	
	
}
