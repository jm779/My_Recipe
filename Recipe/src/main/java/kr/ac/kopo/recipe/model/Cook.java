package kr.ac.kopo.recipe.model;

import java.util.ArrayList;
import java.util.List;

public class Cook {
	private int recipeid;
	private String recipetitle;
	private String rcomment;
	private String link;
	private List<Step> steps = new ArrayList<>();
	private String content;
	private String userid;
	private String mainimagepath;
	private String recommend;

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
	public String getRcomment() {
		return rcomment;
	}
	public void setRcomment(String rcomment) {
		this.rcomment = rcomment;
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
	public String getRecommend() {
		return recommend;
	}
	public void setRecommend(String recommend) {
		this.recommend = recommend;
	}
	
	
}



