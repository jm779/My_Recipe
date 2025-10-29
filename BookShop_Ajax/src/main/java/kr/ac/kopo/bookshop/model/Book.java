package kr.ac.kopo.bookshop.model;

import java.time.LocalDate;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Book {
	
	private Long code;
	private String title;
	private String publisher;
	private int price;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private LocalDate pubDate;
	
	private List<Attach> attachs;
	private List<Review> reviews;
	
	private Long bookCode;
	
	public Long getCode() {
		return code;
	}
	
	public Long getBookCode() {
		return bookCode;
	}
	
	public void setCode(Long code) {
		this.code = code;
	}
	
	public void setBookCode(Long bookCode) {
		this.bookCode = bookCode;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getPublisher() {
		return publisher;
	}
	
	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}
	
	public int getPrice() {
		return price;
	}
	
	public void setPrice(int price) {
		this.price = price;
	}
	
	public LocalDate getPubDate() {
		return pubDate;
	}
	
	public void setPubDate(LocalDate pubDate) {
		this.pubDate = pubDate;
	}
	
	public List<Attach> getAttachs() {
		return attachs;
	}
	
	public void setAttachs(List<Attach> attachs) {
		this.attachs = attachs;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	
	
}
