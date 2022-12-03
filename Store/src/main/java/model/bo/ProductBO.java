package model.bo;

import java.util.ArrayList;

import model.bean.Product;
import model.dao.ProductDAO;

public class ProductBO {
	ProductDAO productDAO = new ProductDAO();
	public  ArrayList<Product> getProductList(){
		return  productDAO.getProductList();
	}
	public  void insert(String id_product, String name, String id_category, int size,int price , String image) {
		productDAO.insert(id_product, name, id_category, size, price, image);
	}
	public  void deleteProduct(String id_product) {
		productDAO.deleteProduct(id_product);
	}
	public  void update(String id_product, String name, String id_category, int size,int price , String image) {
		productDAO.update(id_product, name, id_category, size, price, image);
	}
	public  Product getDetail(String id) {
		return productDAO.getDetail(id);
	}
	public  ArrayList<Product> searchByIdCategory(String id){
		return productDAO.searchByIdCategory(id);
	}
	public  ArrayList<Product> searchBySize(int size){
		return productDAO.searchBySize(size);
	}
	public  ArrayList<Product> searchByName(String name){
		return productDAO.searchByName(name);
	}
	public ArrayList<Integer> getId(){
		return productDAO.getId();
	}
	public void deleteProducts(String[] id_product) {
		productDAO.deleteProducts(id_product);
	}
}
