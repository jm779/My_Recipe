package kr.ac.kopo.bookshop.model;

public class Attach {
    private Long code;
    private Long book_code;
    private String filename;
    private String uuid;

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public Long getBook_code() {
        return book_code;
    }

    public void setBook_code(Long book_code) {
        this.book_code = book_code;
    }

    public String getFilename() {
        return filename;
    }

    public void setFilename(String filename) {
        this.filename = filename;
    }

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }
}
