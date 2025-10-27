package kr.ac.kopo.recipe.model;

import java.util.List;

public class Cook {
	private int recipeid;
	private String recipetitle;
	private String comment;
	private String link;
	private List<Step> steps;
	private String postid;
	private String posttitle;
	private String postviews;                               
	private String recommend;
	private String content;
	private String userid;
	private String mainimagepath;
	
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public String getRecipetitle() {
		return recipetitle;
	}
	public void setRecipetitle(String recipetitle) {
		this.recipetitle = recipetitle;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public List<Step> getSteps() {
		return steps;
	}
	public void setSteps(List<Step> steps) {
		this.steps = steps;
	}
	public String getPostid() {
		return postid;
	}
	public void setPostid(String postid) {
		this.postid = postid;
	}
	public String getPosttitle() {
		return posttitle;
	}
	public void setPosttitle(String posttitle) {
		this.posttitle = posttitle;
	}
	public String getPostviews() {
		return postviews;
	}
	public void setPostviews(String postviews) {
		this.postviews = postviews;
	}
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getMainimagepath() {
		return mainimagepath;
	}
	public void setMainimagepath(String mainimagepath) {
		this.mainimagepath = mainimagepath;
	}
	
	
}



