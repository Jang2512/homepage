package com.ezen.jang;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
 
@Controller
public class HomeController {	
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/main")
	public String home(HttpServletRequest request) {
		HttpSession hs = request.getSession();
		hs.setAttribute("islogin", false);		
		return "main";
	}
	
	@RequestMapping(value = "/index")
	public String home2(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		if((boolean)hs.getAttribute("islogin")) {			
			String log = (String)hs.getAttribute("log");
			mo.addAttribute("log",log);
			return "main2";
		} else {
			return "main";
		}		
	}
	
	@RequestMapping(value = "/loginform")
	public String log() {
			
		return "loginform";
	}
	
	@RequestMapping(value = "/modifya")
	public String modify(HttpServletRequest request, Model mo) {
			String id = request.getParameter("id");
			mo.addAttribute("id",id);
		return "modify";
	}
	
	@RequestMapping(value = "/infoinput")
	public String home2() {
			
		return "infoinput";
	}
	
	@RequestMapping(value = "/inputsave", method = RequestMethod.POST)
	public String home3(HttpServletRequest request) {
		String id, pw, name, tel, email, adr, birth;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		tel = request.getParameter("tel");
		email = request.getParameter("email");
		adr = request.getParameter("adr");
		birth = request.getParameter("birth");
		interA dao = sqlSession.getMapper(interA.class);
		dao.input(id, pw, name, tel, email, adr, birth);
		return "redirect:index";
	}
	
	@RequestMapping(value = "/infoout")
	public String home4(HttpServletRequest request, Model mo, RedirectAttributes res) {		
		HttpSession hs = request.getSession();
		if((boolean)hs.getAttribute("islogin")) {
			interA dao = sqlSession.getMapper(interA.class);
			ArrayList<DTO> list = dao.out();
			mo.addAttribute("list",list);
			return "infoout";
		} else {
			res.addAttribute("result","loginfail");
			return "redirect:index";
		}		
	}
	
	@RequestMapping(value = "/modifyb")
	public String home5(HttpServletRequest request) {	
		String id, pw, name, tel, email, adr, birth;
		id = request.getParameter("id");
		pw = request.getParameter("pw");
		name = request.getParameter("name");
		tel = request.getParameter("tel");
		email = request.getParameter("email");
		adr = request.getParameter("adr");
		birth = request.getParameter("birth");
		interA dao = sqlSession.getMapper(interA.class);
		dao.update(id, pw, name, tel, email, adr, birth);
		return "redirect:infoout";
	}
	
	@RequestMapping(value = "/del")
	public String home6(HttpServletRequest request) {	
		String id = request.getParameter("id");
		interA dao = sqlSession.getMapper(interA.class);
		dao.delete(id);
		return "redirect:infoout";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView home7(HttpServletRequest request, Model mo, HttpServletResponse response, RedirectAttributes res) {	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		interA dao = sqlSession.getMapper(interA.class);
		DTO dto =  dao.login(id, pw);
		ModelAndView mav = new ModelAndView();
		if(dto != null) {
			HttpSession hs = request.getSession();
			hs.setAttribute("member", dto);
			hs.setAttribute("islogin", true);
			hs.setAttribute("log", id);
			mav.setViewName("redirect:index");
		} else {
			res.addAttribute("result","loginfail");
			mav.setViewName("redirect:loginform");
		}
		return mav;
	}
	
	@RequestMapping(value = "/logout")
	public String home8(HttpServletRequest request) {	
			HttpSession hs = request.getSession();
			hs.removeAttribute("member");
			hs.setAttribute("islogin", false);
		return "redirect:index";
	}
	
	@RequestMapping(value = "/boardin")
	public String board1(HttpServletRequest request, RedirectAttributes res) {	
		HttpSession hs = request.getSession();
		if((boolean)hs.getAttribute("islogin")) {
		return "board_input";
		}else {
			res.addAttribute("result","loginfail");
			return "redirect:index";
		}
	}
	
	@RequestMapping(value = "/board_inputsave", method = RequestMethod.POST)
	public String board2(HttpServletRequest request, Model mo) {
		HttpSession hs = request.getSession();
		String writer = (String)hs.getAttribute("log");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		interA dao = sqlSession.getMapper(interA.class);
		dao.boardinput(writer, title, content);
		return "redirect:index";	
	}
	
	@RequestMapping(value = "/boardout")
	public String board4(HttpServletRequest request, Model mo, RedirectAttributes res) {
		HttpSession hs = request.getSession();
		if((boolean)hs.getAttribute("islogin")) {
			interA dao = sqlSession.getMapper(interA.class);
			ArrayList<BoardDTO> list =  dao.boardout();
			mo.addAttribute("list",list);
			return "board_out";
		}else {
			res.addAttribute("result","loginfail");
			return "redirect:index";
		}
	}
	
	@RequestMapping(value = "/detail")
	public String board5(HttpServletRequest request) {
		int num = Integer.parseInt(request.getParameter("num"));
		readcnt(num);
		HttpSession hs = request.getSession();
		hs.setAttribute("snum", num);
		return "redirect:board_detail";		
	}

	@RequestMapping(value = "/board_detail")
	public String board6(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		HttpSession hs = request.getSession();
		int num = (int)hs.getAttribute("snum");
		ArrayList<BoardDTO> list = dao.boarddetail(num);
		ArrayList<ComDTO> comlist = dao.commentout(num);
		mo.addAttribute("list",list);
		mo.addAttribute("comlist", comlist);
		return "board_detail";		
	}
	
	@RequestMapping(value = "/delbo")
	public String board7(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		int num = Integer.parseInt(request.getParameter("num"));
		dao.delbo(num);
		return "redirect:boardout";
	}
	
	public void readcnt(int num) {
		interA dao = sqlSession.getMapper(interA.class);
		dao.readcnt(num);
	}
	
	@RequestMapping(value = "/commentinput")
	public String comment(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		HttpSession hs = request.getSession();
		int num = (int)hs.getAttribute("snum");
		String writer = request.getParameter("writer");
		String con = request.getParameter("con");
		dao.commentin(num, writer, con);
		return "redirect:board_detail";		
	}
	
	@RequestMapping(value = "/comdel")
	public String comment2(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		int comnum = Integer.parseInt(request.getParameter("comnum"));
		dao.comdel(comnum);
		return "redirect:board_detail";		
	}
	
	@RequestMapping(value = "/replyview")
	public String comment3(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		int num = Integer.parseInt(request.getParameter("num"));
		HttpSession hs = request.getSession();
		hs.setAttribute("replynum", num);
		ArrayList<BoardDTO> list = dao.replyview(num);
		mo.addAttribute("list",list);
		return "replyview";		
	}
	
	@RequestMapping(value = "/replysave")
	public String comment4(HttpServletRequest request, Model mo) {
		interA dao = sqlSession.getMapper(interA.class);
		HttpSession hs = request.getSession();
		int num = (int)hs.getAttribute("replynum");
		int groups = Integer.parseInt(request.getParameter("groups"));
		int step = Integer.parseInt(request.getParameter("step"));
		int indent = Integer.parseInt(request.getParameter("indent"));
		String writer = request.getParameter("writer");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		step++;
		indent++;
		dao.replyinput(writer, title, content, groups, step, indent);
		return "redirect:boardout";		
	}
	
	@RequestMapping(value = "/notice")
	   public String noticeList(PageVO vo, Model model, RedirectAttributes res, HttpServletRequest request
			   , @RequestParam(value="nowPage", required=false)Integer nowPage
		       , @RequestParam(value="cntPerPage", required=false)Integer cntPerPage) {
		HttpSession hs = request.getSession();
		if((boolean)hs.getAttribute("islogin")) {
			interA noce = sqlSession.getMapper(interA.class);
		    int total = noce.cntnotice();//전체레코드의 수   
		    if(nowPage == null) {
		       nowPage = 1;
		    }
		    if(cntPerPage == null) {
		    	cntPerPage = 5;
		    }
		    System.out.println("현재페이지"+nowPage+" "+cntPerPage);
		    System.out.println("총레코드 : "+total);
		    
		    vo = new PageVO(total, nowPage, cntPerPage);
		    //페이징처리 (ex <1, 2, 3> 게시물 13개, 페이지 3)
		    model.addAttribute("paging", vo);
		    //한페이지에 출력값들(5개의 개시물들)
		    model.addAttribute("viewAll", noce.selectnotice(vo));
		    return "page";
		}else {
			res.addAttribute("result","loginfail");
			return "redirect:index";
		}

	}
}
