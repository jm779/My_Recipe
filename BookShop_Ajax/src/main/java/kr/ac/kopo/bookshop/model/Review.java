package kr.ac.kopo.bookshop.model;

public class Review {
	private Long code;
	private Long bookCode;
	private String memberId;
	private String contents;
	
	public Long getCode() {
		return code;
	}
	public void setCode(Long code) {
		this.code = code;
	}
	public Long getBookCode() {
		return bookCode;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public void setBookCode(Long bookCode) {
		this.bookCode = bookCode;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	
	
}
