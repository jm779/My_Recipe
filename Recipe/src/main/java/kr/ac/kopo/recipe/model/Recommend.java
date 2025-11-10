package kr.ac.kopo.recipe.model;

import java.util.Date;

public class Recommend {
	private int recommendid; 
	private int userid; 
	private int recipeid;
	private Date writedate;

	public int getRecommendid() {
		return recommendid;
	}
	public void setRecommendid(int recommendid) {
		this.recommendid = recommendid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
}
