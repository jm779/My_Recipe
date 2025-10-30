package kr.ac.kopo.recipe.model;

import java.time.LocalDate;

public class Question {
	private int questionid;
	private String userid;
	private LocalDate qdate;
	
	public int getQuestionid() {
		return questionid;
	}
	public void setQuestionid(int questionid) {
		this.questionid = questionid;
	}
	
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public LocalDate getQdate() {
		return qdate;
	}
	public void setQdate(LocalDate qdate) {
		this.qdate = qdate;
	}
	
	
}
