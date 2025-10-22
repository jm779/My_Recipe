package kr.ac.kopo.recipe.pager;

import java.util.ArrayList;
import java.util.List;


public class Pager {
	private int page = 1;
	private int perPage = 10;
	private float total;
	private int perGroup = 3;
	
	private int searchCondition;
	private String keyword;
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public float getTotal() {
		return total;
	}
	public void setTotal(float total) {
		this.total = total;
	}
	public int getPerGroup() {
		return perGroup;
	}
	public void setPerGroup(int perGroup) {
		this.perGroup = perGroup;
	}
	public int getSearchCondition() {
		return searchCondition;
	}
	public void setSearchCondition(int searchCondition) {
		this.searchCondition = searchCondition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}


}
