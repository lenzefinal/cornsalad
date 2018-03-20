package com.devone.finalp.realtime_top_rank.model.vo;

public class RealTimeRankTopView implements java.io.Serializable{
	
	private static final long serialVersionUID = 1250316807517781158L;
	private int rank_num;
	private String project_id;
	private String project_name;
	private String project_category_id;
	private String image_rename;
	
	public RealTimeRankTopView() {}

	public RealTimeRankTopView(int rank_num, String project_id, String project_name, String project_category_id,
			String image_rename) {
		super();
		this.rank_num = rank_num;
		this.project_id = project_id;
		this.project_name = project_name;
		this.project_category_id = project_category_id;
		this.image_rename = image_rename;
	}

	public int getRank_num() {
		return rank_num;
	}

	public void setRank_num(int rank_num) {
		this.rank_num = rank_num;
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

	public String getProject_category_id() {
		return project_category_id;
	}

	public void setProject_category_id(String project_category_id) {
		this.project_category_id = project_category_id;
	}

	public String getImage_rename() {
		return image_rename;
	}

	public void setImage_rename(String image_rename) {
		this.image_rename = image_rename;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "RealTimeRankTopView [rank_num=" + rank_num + ", project_id=" + project_id + ", project_name="
				+ project_name + ", project_category_id=" + project_category_id + ", image_rename=" + image_rename
				+ "]";
	}

	
}
