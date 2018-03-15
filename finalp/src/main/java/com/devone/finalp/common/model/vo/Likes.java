package com.devone.finalp.common.model.vo;

public class Likes {

	private String project_id;
	private String project_name;
	private int likecount;
	
	public Likes() {}
	
	public Likes(String project_id, String project_name, int likecount) {
		super();
		this.project_id = project_id;
		this.project_name = project_name;
		this.likecount = likecount;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
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

	
	@Override
	public String toString() {
		return "Likes [project_id=" + project_id + ", project_name=" + project_name + ", likecount=" + likecount + "]";
	}
	
	
	
}
