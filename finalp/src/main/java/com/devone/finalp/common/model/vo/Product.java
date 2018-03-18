package com.devone.finalp.common.model.vo;

public class Product implements java.io.Serializable{

	private static final long serialVersionUID = 4089315018930821678L;
	private String product_id;
	private String project_id;
	private String product_name;
	private int product_price;
	private int mincount;
	
	public Product() {}

	public Product(String product_id, String project_id, String product_name, int product_price, int mincount) {
		super();
		this.product_id = product_id;
		this.project_id = project_id;
		this.product_name = product_name;
		this.product_price = product_price;
		this.mincount = mincount;
	}

	public String getProduct_id() {
		return product_id;
	}

	public void setProduct_id(String product_id) {
		this.product_id = product_id;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getProduct_name() {
		return product_name;
	}

	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}

	public int getProduct_price() {
		return product_price;
	}

	public void setProduct_price(int product_price) {
		this.product_price = product_price;
	}

	public int getMincount() {
		return mincount;
	}

	public void setMincount(int mincount) {
		this.mincount = mincount;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", project_id=" + project_id + ", product_name=" + product_name
				+ ", product_price=" + product_price + ", mincount=" + mincount + "]";
	}

}
