package kr.co.realstore.model;

import java.sql.Date;

public class Board {

	private int no;
	private int hits;
	private String writer;

	private String pw;

	private String tag;
	private String title;
	private String email;

	private String content;
	private Date reg_date;
	private char del;
	private int startRow ;
	private int endRow ;
	private String keyword;
	private String search;
	
	@Override
	public String toString() {
		return "Board [no=" + no + ", hits=" + hits + ", writer=" + writer + ", pw=" + pw + ", tag=" + tag + ", title="
				+ title + ", email=" + email + ", content=" + content + ", reg_date=" + reg_date + ", del=" + del
				+ ", startRow=" + startRow + ", endRow=" + endRow + ", keyword=" + keyword + ", search=" + search
				+ ", getSearch()=" + getSearch() + ", getKeyword()=" + getKeyword() + ", getStartRow()=" + getStartRow()
				+ ", getEndRow()=" + getEndRow() + ", getReg_date()=" + getReg_date() + ", getDel()=" + getDel()
				+ ", getEmail()=" + getEmail() + ", getPw()=" + getPw() + ", getWriter()=" + getWriter() + ", getNo()="
				+ getNo() + ", getHits()=" + getHits() + ", getTag()=" + getTag() + ", getTitle()=" + getTitle()
				+ ", getContent()=" + getContent() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
				+ ", toString()=" + super.toString() + "]";
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getStartRow() {
		return startRow;
	}
	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}
	public int getEndRow() {
		return endRow;
	}
	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public char getDel() {
		return del;
	}
	public void setDel(char del) {
		this.del = del;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	
}
