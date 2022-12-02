package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;
public class CategoryBO {
	CategoryDAO bo = new CategoryDAO();
	public  ArrayList<Category> getCategoryList(){
		 return bo.getCategoryList();
	}
	public  void Insert(String id, String name) {
		bo.Insert(id, name);
	}
	public  void Delete(String id) {
		bo.Delete(id);
	}
	public  void Update(String id, String name) {
		bo.Update(id, name);
	}
	public ArrayList<Integer> getID(){
		return bo.getID();
	}
}
