package model.bo;

import java.util.ArrayList;

import model.bean.Product;
import model.dao.ProductDAO;

public class ProductBO {
	ProductDAO dao = new ProductDAO();
	public  ArrayList<Product> getProductList(){
		return  dao.getProductList();
	}
	public  void Insert(String id_product, String name, String id_category, int size,int price , String image) {
		dao.Insert(id_product, name, id_category, size, price, image);
	}
	public  void Delete(String id_product) {
		dao.Delete(id_product);
	}
	public  void Update(String id_product, String name, String id_category, int size,int price , String image) {
		dao.Update(id_product, name, id_category, size, price, image);
	}
	public  Product getDetail(String id) {
		return dao.getDetail(id);
	}
	public  ArrayList<Product> searchByIdCategory(String id){
		return dao.searchByIdCategory(id);
	}
	public  ArrayList<Product> searchBySize(int size){
		return dao.searchBySize(size);
	}
	public  ArrayList<Product> searchByName(String name){
		return dao.searchByName(name);
	}
	public ArrayList<Integer> getId(){
		return dao.getId();
	}
	public void Deletes(String[] id_product) {
		dao.Deletes(id_product);
	}
}
