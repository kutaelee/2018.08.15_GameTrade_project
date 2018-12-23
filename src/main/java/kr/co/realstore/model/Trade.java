package kr.co.realstore.model;

import java.sql.Date;

public class Trade {
	private int no ;
	private String writer ;

	private String pw ;
	private Date reg_date;
	private String item ;
	private String price ;
	private char soldout;
	private String tag;
	private char del ;
	private char discount;
	private String id;
	private int startRow ;
	private int endRow ;
	private String keyword;
	private String search;
	

	public int getStartRow() {
		return startRow;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public char getDiscount() {
		return discount;
	}
	public void setDiscount(char discount) {
		this.discount = discount;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public char getSoldout() {
		return soldout;
	}
	public void setSoldout(char soldout) {
		this.soldout = soldout;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public char getDel() {
		return del;
	}
	public void setDel(char del) {
		this.del = del;
	}
	@Override
	public String toString() {
		return "Trade [no=" + no + ", writer=" + writer + ", pw=" + pw + ", reg_date=" + reg_date + ", item=" + item
				+ ", price=" + price + ", soldout=" + soldout + ", tag=" + tag + ", del=" + del + ", discount="
				+ discount + ", id=" + id + ", startRow=" + startRow + ", endRow=" + endRow + ", keyword=" + keyword
				+ ", search=" + search + "]";
	}

}
