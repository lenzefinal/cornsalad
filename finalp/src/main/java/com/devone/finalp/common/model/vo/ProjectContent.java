package com.devone.finalp.common.model.vo;

public class ProjectContent implements java.io.Serializable{

	private static final long serialVersionUID = 3663320855897876084L;
	private String project_id;
	private String video_url;
	private String content;
	
	public ProjectContent() {}

	public ProjectContent(String project_id, String video_url, String content) {
		super();
		this.project_id = project_id;
		this.video_url = video_url;
		this.content = content;
	}

	public String getProject_id() {
		return project_id;
	}

	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}

	public String getVideo_url() {
		return video_url;
	}

	public void setVideo_url(String video_url) {
		this.video_url = video_url;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		return "ProjectContent [project_id=" + project_id + ", video_url=" + video_url + ", content=" + content + "]";
	}
	
	
}
