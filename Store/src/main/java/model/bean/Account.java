package model.bean;

public class Account {
     private String id;
     private String name;
     private String phone;
     private String mail;
     private String username;
     private String password;
     private int role;
     
     public Account() {
    	 
     }
     
     public Account(String id , String name ,String phone ,String mail ,String username,String password ,int role) {
    	 this.id=id;
    	 this.name=name;
    	 this.phone=phone;
    	 this.mail=mail;
    	 this.username=username;
    	 this.password=password;
    	 this.role=role;
     }
     
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
}
