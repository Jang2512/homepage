package com.ezen.jang;

import java.util.ArrayList;

public interface interA {
	public void input(String id, String pw, String name, String tel, String email, String adr, String birth);
	public ArrayList<DTO> out();
	public void delete(String id);
	public void update(String id, String pw, String name, String tel, String email, String adr, String birth);
	public DTO login(String id, String pw);
	public void boardinput(String writer, String title, String content);
	public ArrayList<BoardDTO> boardout();
	public ArrayList<BoardDTO> boarddetail(int num);
	public void readcnt(int num);
	public void commentin(int num, String writer, String con);
	public ArrayList<ComDTO> commentout(int num);
	public void comdel(int comnum);
	public ArrayList<BoardDTO> replyview(int num);
	public void replyinput(String writer, String title, String content, int groups, int step, int indent);
	public void stepup(int groups, int step);
	public void delbo(int num);
	//레코드 총 갯수
	public int cntnotice();
	//페이징 처리 게시글 조회
	public ArrayList<BoardDTO> selectnotice(PageVO vo);
}
