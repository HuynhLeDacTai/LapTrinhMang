package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import model.bean.Category;

public class CategoryDAO {

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

	public ArrayList<Category> getCategoryList() {
		ArrayList<Category> result = new ArrayList<Category>();

		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from category";
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

	public void insert(String id, String name) {
		String query = "insert into category(id,name) values(?,?)";
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

	public void delete(String id) {
		String query = "delete from category where id = '" + id + "'";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void update(String id, String name) {
		String query = "update category set name=? where id = '" + id + "'";
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

	public ArrayList<Integer> getID() {
		CategoryDAO dao = new CategoryDAO();
		ArrayList<Category> cateList = dao.getCategoryList();
		ArrayList<Integer> cateListint = new ArrayList<Integer>();
		for (Category category : cateList) {
			cateListint.add(Integer.parseInt(category.getId().substring(1)));
		}
		return cateListint;
	}

}
