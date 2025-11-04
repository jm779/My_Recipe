package kr.ac.kopo.recipe.model;

import java.util.Date;

public class Recommend {
	private int recommendnum; 
	private int userid; 
	private Date writedate;

	public int getRecommendnum() {
		return recommendnum;
	}
	public void setRecommendnum(int recommendnum) {
		this.recommendnum = recommendnum;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	
	
}
