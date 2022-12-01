package model.bo;

import java.util.ArrayList;

import model.bean.ProductCategory;
import model.dao.ProductCategoryDAO;

public class ProductCategoryBO {
	ProductCategoryDAO dao = new ProductCategoryDAO();
	public  ArrayList<ProductCategory> getProducCategoryList(){
		return dao.getProducCategoryList();
	}
	public ProductCategory  productCate(String id) {
		return dao.productCate(id);
	}
}

