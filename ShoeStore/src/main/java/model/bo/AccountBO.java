package model.bo;
import model.dao.AccountDAO;

import java.util.ArrayList;

import model.bean.Account;
public class AccountBO {
	 AccountDAO dao = new AccountDAO();
	public  ArrayList<Account> getAccountList(){
		return dao.getAccountList();
	}
	
	public  void Insert(String id, String name, String phone, String mail, String username, String password,
			int role, String image) {
		dao.Insert(id, name, phone, mail, username, password, role, image);
	}
	
	public  void Delete(String id) {
		dao.Delete(id);
	}
	public  void Update(String id, String name, String phone, String mail, String username, String password,
			int role, String image) {
		dao.Update(id, name, phone, mail, username, password, role, image);
	}
	public  Account getDetail(String id) {
		return dao.getDetail(id);
	}
	
	public  Account login(String user, String pass) {
		return dao.login(user, pass);
	}

}
