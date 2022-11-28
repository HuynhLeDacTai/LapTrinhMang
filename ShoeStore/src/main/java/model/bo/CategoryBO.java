package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;
public class CategoryBO {
	public static ArrayList<Category> getCategoryList(){
		 return CategoryDAO.getCategoryList();
	}
	public static void Insert(String id, String name) {
		CategoryDAO.Insert(id, name);
	}
	public static void Delete(String id) {
		CategoryDAO.Delete(id);
	}
	public static void Update(String id, String name) {
		CategoryDAO.Update(id, name);
	}
}
