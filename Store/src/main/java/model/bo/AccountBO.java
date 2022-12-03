package model.bo;
import model.dao.AccountDAO;

import java.util.ArrayList;

import model.bean.Account;
public class AccountBO {
	 AccountDAO accountDAO = new AccountDAO();
	public  ArrayList<Account> getAccountList(){
		return accountDAO.getAccountList();
	}
	
	public void Insert(Account account) {
		accountDAO.Insert(account.getId(), account.getName(), account.getPhone()
				, account.getMail(), account.getUsername(), account.getPassword(),
				account.getRole());
	}
	
	public void Delete(String id) {
		accountDAO.Delete(id);
	}
	public void Update(Account account) {
		accountDAO.Update(account.getId(), account.getName(), account.getPhone()
				, account.getMail(), account.getUsername(), account.getPassword(),
				account.getRole());
	}
	public Account getAccount(String id) {
		return accountDAO.getAccount(id);
	}
	
	public void deleteAccounts(String[] id) {
		accountDAO.deleteAccounts(id);
	}
	
	public ArrayList<Integer> getIds() {
		return accountDAO.getIds();
	}
	
	public  Account getAccountbyUserPass(String user, String pass) {
		return accountDAO.getAccountbyUserPass(user, pass);
	}

}
