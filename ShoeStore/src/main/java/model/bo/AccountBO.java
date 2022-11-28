package model.bo;
import model.dao.AccountDAO;

import java.util.ArrayList;

import model.bean.Account;
public class AccountBO {
	
	public static ArrayList<Account> getAccountList(){
		return AccountDAO.getAccountList();
	}
	
	public static void Insert(String id, String name, String phone, String mail, String username, String password,
			int role, String image) {
		AccountDAO.Insert(id, name, phone, mail, username, password, role, image);
	}
	
	public static void Delete(String id) {
		AccountDAO.Delete(id);
	}
	public static void Update(String id, String name, String phone, String mail, String username, String password,
			int role, String image) {
		AccountDAO.Update(id, name, phone, mail, username, password, role, image);
	}
	public static Account getDetail(String id) {
		return AccountDAO.getDetail(id);
	}

}
