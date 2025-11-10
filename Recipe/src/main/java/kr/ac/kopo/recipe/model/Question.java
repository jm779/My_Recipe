package kr.ac.kopo.recipe.model;

import java.time.LocalDate;

public class Question {
	private int questionid;
	private String qtitle;
	private String userid;
	private String qcontent;
	private LocalDate qdate;
	
	public int getQuestionid() {
		return questionid;
	}
	
	public String getQtitle() {
		return qtitle;
	}

	public void setQtitle(String qtitle) {
		this.qtitle = qtitle;
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
	
	public String getQcontent() {
		return qcontent;
	}

	public void setQcontent(String qcontent) {
		this.qcontent = qcontent;
	}

	public LocalDate getQdate() {
		return qdate;
	}
	public void setQdate(LocalDate qdate) {
		this.qdate = qdate;
	}
	
	
}
