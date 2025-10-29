package kr.ac.kopo.bookshop.dao;

import java.util.List;

import kr.ac.kopo.bookshop.model.Attach;
import kr.ac.kopo.bookshop.model.Book;
import kr.ac.kopo.bookshop.model.Review;
import kr.ac.kopo.bookshop.pager.Pager;

public interface BookDao {

	public List<Book> list(Pager pager);

	public void add(Book item);

	public void update(Book item);

	public void delete(Long code);

	public Book item(Long code);

	public int total(Pager pager);

	void addAttach(Attach image);

	public int deleteAttach(Long code);

	public int addReview(Review item);


}
