package model.bean;

public class ProductCategory {
	 private String id_product;
     private String name;
     private String name_category;
     private int size;
     private int price;
     private String image;
     
     public ProductCategory() {
    	 
     }
     
     public ProductCategory(String id_product ,String name,int size , int price,String name_category,String image ) {
    	 this.id_product=id_product;
    	 this.name=name;
    	 this.name_category=name_category;
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

	public String getName_category() {
		return name_category;
	}

	public void setName_category(String name_category) {
		this.name_category = name_category;
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
