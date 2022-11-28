package model.bo;

import java.util.ArrayList;

import model.bean.Product;
import model.dao.ProductDAO;

public class ProductBO {
	public static ArrayList<Product> getProductList(){
		return  ProductDAO.getProductList();
	}
	public static void Insert(String id_product, String name, String id_category, int size,int price , String image) {
		ProductDAO.Insert(id_product, name, id_category, size, price, image);
	}
	public static void Delete(String id_product) {
		ProductDAO.Delete(id_product);
	}
	public static void Update(String id_product, String name, String id_category, int size,int price , String image) {
		ProductDAO.Update(id_product, name, id_category, size, price, image);
	}
	public static Product getDetail(String id) {
		return ProductDAO.getDetail(id);
	}
	public static ArrayList<Product> searchByIdCategory(String id){
		return ProductDAO.searchByIdCategory(id);
	}
	public static ArrayList<Product> searchBySize(int size){
		return ProductDAO.searchBySize(size);
	}
	public static ArrayList<Product> searchByName(String name){
		return ProductDAO.searchByName(name);
	}
}
