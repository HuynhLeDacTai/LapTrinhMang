package model.bo;

import java.util.ArrayList;

import model.bean.Category;
import model.dao.CategoryDAO;

public class CategoryBO {
	CategoryDAO bo = new CategoryDAO();

	public ArrayList<Category> getCategoryList() {
		return bo.getCategoryList();
	}

	public void insert(String id, String name) {
		bo.insert(id, name);
	}

	public void delete(String id) {
		bo.delete(id);
	}

	public void update(String id, String name) {
		bo.update(id, name);
	}

	public ArrayList<Integer> getID() {
		return bo.getID();
	}
}
