package model.bean;

public class Product {
     private String id_product;
     private String name;
     private String id_category;
     private int size;
     private int price;
     private String image;
     
     public Product() {
    	 
     }
     
     public Product(String id_product ,String name ,String id_category ,int size , int price ,String image) {
    	 this.id_product=id_product;
    	 this.name=name;
    	 this.id_category=id_category;
    	 this.size=size;
    	 this.price=price;
    	 this.image=image;
    	 
     }

	public String getId_product() {
		return id_product;
	}

	public void setId_product(String id_product) {
		this.id_product = id_product;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getId_category() {
		return id_category;
	}

	public void setId_category(String id_category) {
		this.id_category = id_category;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
}
