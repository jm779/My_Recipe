package kr.ac.kopo.bookshop.service;


import java.util.List;

import kr.ac.kopo.bookshop.model.Book;
import kr.ac.kopo.bookshop.model.Review;
import kr.ac.kopo.bookshop.pager.Pager;


public interface BookService {
	
	 List<Book> list(Pager pager);

	void add(Book item);

	void update(Book item);

	void delete(Long code);

	Book item(Long code);

	void dummy();

	void init();

	boolean deleteAttach(Long code);

	boolean addReview(Review item);
	
}
