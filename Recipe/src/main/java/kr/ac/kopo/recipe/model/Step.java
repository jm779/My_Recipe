package kr.ac.kopo.recipe.model;

public class Step {
	private int stepid;
	private int recipeid;
	private int stepOrder;
	
	private String content;
	private String ingredient;
	private String tools;
	private String tip;
	private String imagepath;
	
	public String getImagepath() {
		return imagepath;
	}
	public void setImagepath(String imagepath) {
		this.imagepath = imagepath;
	}
	public int getStepid() {
		return stepid;
	}
	public void setStepid(int stepid) {
		this.stepid = stepid;
	}
	public int getRecipeid() {
		return recipeid;
	}
	public void setRecipeid(int recipeid) {
		this.recipeid = recipeid;
	}
	public int getStepOrder() {
		return stepOrder;
	}
	public void setStepOrder(int stepOrder) {
		this.stepOrder = stepOrder;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getIngredient() {
		return ingredient;
	}
	public void setIngredient(String ingredient) {
		this.ingredient = ingredient;
	}
	public String getTools() {
		return tools;
	}
	public void setTools(String tools) {
		this.tools = tools;
	}
	public String getTip() {
		return tip;
	}
	public void setTip(String tip) {
		this.tip = tip;
	}
		
}
