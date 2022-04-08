package com.ezen.jang;

public class ComDTO {
	int num, comnum;
	String writer, con, dat;
	public ComDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ComDTO(int num, int comnum, String writer, String con, String dat) {
		super();
		this.num = num;
		this.comnum = comnum;
		this.writer = writer;
		this.con = con;
		this.dat = dat;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getComnum() {
		return comnum;
	}
	public void setComnum(int comnum) {
		this.comnum = comnum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCon() {
		return con;
	}
	public void setCon(String con) {
		this.con = con;
	}
	public String getDat() {
		return dat;
	}
	public void setDat(String dat) {
		this.dat = dat;
	}
}