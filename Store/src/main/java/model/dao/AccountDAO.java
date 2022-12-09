package model.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.*;

import model.bean.Account;

public class AccountDAO {

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

	public ArrayList<Account> getAccountList() {
		ArrayList<Account> result = new ArrayList<Account>();

		// Connect to database
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			String sql = "select * from account";
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				Account Account = new Account(rs.getString("id"), rs.getString("name"), rs.getString("phone"),
						rs.getString("mail"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
				result.add(Account);
			}

		} catch (Exception e) {
			// TODO: handle exception

			System.out.println("Error:  " + e);
		}

		return result;
	}

	public void insert(String id, String name, String phone, String mail, String username, String password, int role) {
		String query = "insert into account(id,name,phone,mail,username,password,role) values(?,?,?,?,?,?,?)";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, id);
			p.setString(2, name);
			p.setString(3, phone);
			p.setString(4, mail);
			p.setString(5, username);
			p.setString(6, password);
			p.setInt(7, role);
			p.execute();
			p.close();
		} catch (Exception e) {

		}
	}

	public void deleteAccount(String id) {
		String query = "Delete from account where id = '" + id + "'";
		try {
			Connection con = getConnection();
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.executeUpdate(query);
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void deleteAccounts(String[] id) {

		try {
			Connection con = getConnection();
			for (int i = 0; i < id.length; i++) {
				String query = "Delete from account where id = '" + id[i] + "'";
				PreparedStatement pstmt = con.prepareStatement(query);
				pstmt.executeUpdate(query);
			}
			con.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public void update(String id, String name, String phone, String mail, String username, String password, int role) {
		String query = "UPDATE account SET name=?,phone=?,mail=? ,username=? ,password=?,role=? WHERE id ='" + id + "'";
		try {
			Connection con = getConnection();
			PreparedStatement p = con.prepareStatement(query);
			p.setString(1, name);
			p.setString(2, phone);
			p.setString(3, mail);
			p.setString(4, username);
			p.setString(5, password);
			p.setInt(6, role);
			p.executeUpdate();
			p.close();
		} catch (Exception e) {
			// TODO: handle exception
		}
	}

	public Account getAccount(String id) {
		ArrayList<Account> list = getAccountList();
		Account a = new Account();
		for (Account account : list) {
			if (account.getId().equals(id)) {
				a = account;
			}
		}
		return a;
	}

	public Account getAccountbyUserPass(String user, String pass) {
		String query = "select * from account where username = '" + user + "' and password = '" + pass + "'";
		try {
			Connection con = getConnection();
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery(query);
			while (rs.next()) {
				return new Account(rs.getString("id"), rs.getString("name"), rs.getString("phone"),
						rs.getString("mail"), rs.getString("username"), rs.getString("password"), rs.getInt("role"));
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

	public ArrayList<Integer> getIds() {
		ArrayList<Integer> p = new ArrayList<Integer>();
		ArrayList<Account> list = getAccountList();
		for (Account account : list) {
			p.add(Integer.parseInt(account.getId()));

		}

		return p;
	}
}
