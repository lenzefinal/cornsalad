package com.devone.finalp.pdetail.model.vo;

public class HotListView implements java.io.Serializable{

	
	/**
	 * 
	 */
	private static final long serialVersionUID = 2611557126792431691L;
	private String project_name;
	private String project_id;
	private int likecount;
	
	public HotListView() {}
	
	public HotListView(String project_name,String project_id, int likecount) {
		super();
		
		this.project_name = project_name;
		this.project_id=project_id;
		this.likecount = likecount;
	}
	public String getProject_name() {
		return project_name;
	}
	public void setProject_name(String project_name) {
		this.project_name = project_name;
	}
	public int getLikecount() {
		return likecount;
	}
	public void setLikecount(int likecount) {
		this.likecount = likecount;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	@Override
	public String toString() {
		return "HotListView [project_name=" + project_name + ", likecount=" + likecount + "]";
	}
	
	
}
