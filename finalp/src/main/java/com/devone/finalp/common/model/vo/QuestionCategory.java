package com.devone.finalp.common.model.vo;

import org.springframework.stereotype.Component;

@Component
public class QuestionCategory implements java.io.Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3094859172564370038L;
	private String question_category_id;
	private String question_category_name;
	
	public QuestionCategory() {
		
	}

	public String getQuestion_category_id() {
		return question_category_id;
	}

	public void setQuestion_category_id(String question_category_id) {
		this.question_category_id = question_category_id;
	}

	public String getQuestion_category_name() {
		return question_category_name;
	}

	public void setQuestion_category_name(String question_category_name) {
		this.question_category_name = question_category_name;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public QuestionCategory(String question_category_id, String question_category_name) {
		super();
		this.question_category_id = question_category_id;
		this.question_category_name = question_category_name;
	}

	@Override
	public String toString() {
		return "QuestionCategory [question_category_id=" + question_category_id + ", question_category_name="
				+ question_category_name + "]";
	}
	
	
}
