package com.devone.finalp.common.model.vo;

public class Product implements java.io.Serializable{

	private static final long serialVersionUID = 4089315018930821678L;
	private int product_id;
	private String project_id;
	private String product_name;
	private int capacity;
	
	public Product() {}

	public Product(int product_id, String project_id, String product_name, int capacity) {
		super();
		this.product_id = product_id;
		this.project_id = project_id;
		this.product_name = product_name;
		this.capacity = capacity;
	}

	public int getProduct_id() {
		return product_id;
	}

	public void setProduct_id(int product_id) {
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

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "Product [product_id=" + product_id + ", project_id=" + project_id + ", product_name=" + product_name
				+ ", capacity=" + capacity + "]";
	}
	
	
}
