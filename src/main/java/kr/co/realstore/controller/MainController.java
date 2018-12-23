package kr.co.realstore.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.co.realstore.service.PagingBean;

import kr.co.realstore.model.Board;
import kr.co.realstore.model.Member;
import kr.co.realstore.model.Trade;
import kr.co.realstore.service.BoardService;
import kr.co.realstore.service.MemberService;
import kr.co.realstore.service.TradeService;
@Controller
public class MainController {
	@Autowired
	private BoardService bs;
	@Autowired
	private MemberService ms;
	@Autowired
	private TradeService ts;
	
	@RequestMapping("main")
	public String main() {
		return "main";
	}
	@RequestMapping("banner")
	public String banner() {
		return "banner";
	}

	@RequestMapping("boardlist")
	public String boradlist(Board board, Model model) {
		board.setTag("notice");
		List<Board> list = bs.list(board);
		
		model.addAttribute("bl", list);
		model.addAttribute("tag",board.getTag());
		
		return "boardlist";

	}

	@RequestMapping("listview")
	public String listview(Board board, Model model, int no,String pageNum) {
		board = bs.select(no);
		System.out.println(board.getTag());
		System.out.println(pageNum);
		model.addAttribute("pageNum",pageNum);
		model.addAttribute("lv", board);
		model.addAttribute("tag", board.getTag());
		return "listview";
	}

	@RequestMapping("taglist")
	public String taglist(String pageNum,Board board, Model model) {
		System.out.println("keyword : " + board.getKeyword() + "\n Tag : " + board.getTag()
		+ "\n pageNum : "+ pageNum +"\n search:"+board.getSearch());
	
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = bs.getTotal(board);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow   = startRow + rowPerPage - 1;
		board.setStartRow(startRow);
		board.setEndRow(endRow);

		String[] t = {"작성자","제목","내용","제목+내용"};
		model.addAttribute("tag", board.getTag());
		model.addAttribute("search",board.getSearch());
	
		List<Board> taglist = bs.select(board);
		model.addAttribute("bl", taglist);
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		model.addAttribute("pb", pb);
		model.addAttribute("t", t);
		return "boardlist";
	}

	@RequestMapping("tradelist")
	public String tradelist(String pageNum,Trade trade, Model model) {
		System.out.println("keyword : " + trade.getKeyword() + "\n Tag : " + trade.getTag()
		+ "\n pageNum : "+ pageNum +"\n search:"+trade.getSearch());
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ts.getTotal(trade);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow   = startRow + rowPerPage - 1;
		trade.setStartRow(startRow);
		trade.setEndRow(endRow);

		String[] t = {"아이템명","닉네임"};
		model.addAttribute("tag", trade.getTag());
		model.addAttribute("search",trade.getSearch());
		
		
		List<Trade> tradelist = ts.tradelist(trade);
	
		model.addAttribute("tl", tradelist);
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		model.addAttribute("pb", pb);
		model.addAttribute("t", t);
		if(trade.getTag().equals("sell"))
		{
			
			return "selllist";
		}
		else {
			
			return "buylist";
		}
		
	}

	@RequestMapping("tradeinsert")
	public String sellinsert(String pageNum,Trade trade, Model model,String loc) {
		System.out.println(trade.toString());
		model.addAttribute("tag", trade.getTag());
		System.out.println("tagtag:"+trade.getTag());
		if(trade.getId()==null && trade.getPw()==null || trade.getId()=="" && trade.getPw()=="")
		{
			trade.setId("customer");
			trade.setPw("customer");
		}
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total=0;
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow   = startRow + rowPerPage - 1;
		trade.setStartRow(startRow);
		trade.setEndRow(endRow);
		ts.insert(trade);
		if(loc.equals("mysell") || loc.equals("mybuy"))
		{
			List<Trade> tradelist = ts.mytradeList(trade);	
			model.addAttribute("tl", tradelist);
			total = ts.mygetTotal(trade);
		}else
		{
			List<Trade> tradelist = ts.tradelist(trade);
			model.addAttribute("tl", tradelist);
			total = ts.getTotal(trade);
		}
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		model.addAttribute("pb", pb);
	
		
		if(loc.equals("sell"))
		return "selllist";
		else if(loc.equals("buy"))
		return "buylist";
		else if(loc.equals("mybuy"))
			return "mybuylist";
		else
				return "myselllist";
	}

	@RequestMapping("loginbox")
	public String loginbox() {
		return "loginbox";
	}

	@RequestMapping("joinbox")
	public String joinbox() {

		return "joinform";
	}
	@RequestMapping("modifybox")
	public String modifybox()
	{
		return "modifyform";
	}

	@RequestMapping("join")
	public String join(Member member, Model model, HttpSession se) {

		ms.meminsert(member);

		model.addAttribute("member", member);
		se.setAttribute("member", member);
		return "main";
	}
	 @RequestMapping(value = "find", produces = "application/text;charset=utf-8")
	   @ResponseBody
	public String find(Member member,Model model)
	{
		 String msg="";
		System.out.println(member.toString());
		if(member.getId()==null)
		{
			System.out.println("아이디찾기진입");
			member=ms.findid(member);
			if(member==null) {
				System.out.println("진입");
				msg="일치하는 정보가 없습니다.";
			}
				
			else
				msg="아이디:"+member.getId();
			
		}else
		{
			member=ms.findpw(member);
			if(member==null)
				msg="일치하는 정보가 없습니다.";
			else	
				msg="비밀번호:"+member.getPw();
		}
		 return msg;
	}

	   @RequestMapping(value = "login", produces = "application/text;charset=utf-8")
	   @ResponseBody
	   public String login(Member member,Model model,HttpSession session) {
	      System.out.println("login() 실행");
	      System.out.println(member.toString());
	 
	      Member mem = ms.loginselect(member);
	      String msg = " ";
	      
	      if(mem!=null) {
	    	  
	      
	      if (mem.getId() == null) {
	    	  msg = "ID 또는 비밀번호가 일치하지 않습니다.";
	         return msg; 
	         } else if (mem.getDel().equals("Y")) {
	         msg = "삭제 된 계정 입니다.";
	         return msg;
	      } 
	      
	       else if (member.getPw().equals(mem.getPw())) {
	         if(mem.getGrade()==5) {
	            System.out.println("master");
	            model.addAttribute("member",mem);
	            session.setAttribute("member", mem);
	            msg = "마스터 로그인";
		         return msg;
	         }else { 
	            System.out.println("member로그인");
	            model.addAttribute("member",mem);
	            session.setAttribute("member", mem);
	         }
	         msg = mem.getId()+"님 반갑습니다.";
	         return msg;
	      } 
	      }else
	      msg="일치하는 정보가 없습니다.";
	      return msg;
	     

	   }
	@RequestMapping("logout")
	public void logout(HttpSession se) throws Exception {
		se.invalidate();

		
	}
	@RequestMapping(value="idChk", produces="application/text;charset=utf-8")
	@ResponseBody
	public String idChk(Member member) throws Exception {
		System.out.println("idChk() 실행");
		System.out.println(member.getId());
		Member mem = ms.idChk(member);
		String msg = "";
		if (mem == null) {
			msg = "0";
		} else {
			msg = "1";
		}

		return msg;
	}
	@RequestMapping("mytradelist")
	public String mytradelist(String pageNum,Member member,Model model,Trade trade) {
		System.out.println("마이트레이드리스트 진입");
		System.out.println("id:"+member.getId());
		System.out.println("tag:"+trade.getTag());
		
		model.addAttribute("tag",trade.getTag());
		trade.setId(member.getId());
		String[] t = {"아이템명","닉네임"};
		model.addAttribute("t", t);
		if (pageNum==null || pageNum.equals(""))
			pageNum = "1";
		int currentPage = Integer.parseInt(pageNum);
		int total = ts.mygetTotal(trade);
		int rowPerPage = 10;
		int startRow = (currentPage - 1) * rowPerPage + 1;
		int endRow   = startRow + rowPerPage - 1;
		trade.setStartRow(startRow);
		trade.setEndRow(endRow);
		PagingBean pb = new PagingBean(currentPage,rowPerPage,total);
		model.addAttribute("pb", pb);
		List<Trade> tradelist = ts.mytradeList(trade);
		model.addAttribute("tl",tradelist);
		
		
		if(trade.getTag().equals("sell"))
			return "myselllist";
			else
				return "mybuylist";
			
		
	}
	@RequestMapping("mylistdel")
	public void mylistdel(Model model,Trade trade)
	{
		System.out.println(trade.getNo());
		ts.mylistdel(trade);
	
	}
	@RequestMapping("boardwritepage")
	public String boardwritepage(Model model,Board board)
	{
	
		model.addAttribute("tag", board.getTag());
		return "boardwrite";
	}
	@RequestMapping("boardwrite")
	public String boardwrite(Model model,Board board,Member member)
	{
		board.setContent(board.getContent().replace("\r\n","<br>"));
		board.setContent(board.getContent().replace(" ","&nbsp;"));
		
		board.setWriter(member.getId());
		board.setPw(member.getPw());
		System.out.println(board.toString());
		bs.insert(board);
		return taglist(null,board,model);
		
	}	
	@RequestMapping("boardupdateform")
	public String boardupdateform(Model model,Board board)
	{	
		board = bs.select(board.getNo());
		model.addAttribute("bu",board);
		return "boardupdate";
	}
	@RequestMapping("boardupdate")
	public String boardupdate(Model model,Board board)
	{
		System.out.println(board.toString());
		bs.update(board);
		
		return listview(board, model,board.getNo(), "1");
	}
	@RequestMapping("boarddelete")
	public String boarddelete(Model model,Board board)
	{
		System.out.println(board.toString());
		bs.delete(board);
		
		return taglist(null, board, model);
	}
	@RequestMapping("mypage")
	public String mypage(Model model)
	{
		return "mypage";
	}
	@RequestMapping("modifyinfo")
	public String modifyinfo(Member member,Model model,HttpSession session)
	{
		
		Member imsi=(Member) session.getAttribute("member");
		member.setId(imsi.getId());
		member.setEmail(imsi.getEmail());
		
		System.out.println("modify"+member.toString());
		if(member.getImsi()==null||member.getImsi()=="")
		{
			member.setImsi(member.getPw());
		}
		ms.modifyinfo(member);
		member= ms.loginselect(member);
		model.addAttribute("member",member);
		session.setAttribute("member", member);
	
		return "mypage";
	}
/*	@RequestMapping(value="/chatting", method=RequestMethod.GET)
	public ModelAndView echo(ModelAndView mv)
	{
		mv.setViewName("chat/chattingview");
		
		User user=(User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		System.out.println("user name:"+user.getUsername());
		System.out.println("nomal chat page");
		
		mv.addObject("userid",user.getUsername());
		
		return mv;
	}*/
	@RequestMapping("chat")
	public String chat(Model model)
	{
		
		return "websocket-echo";
	}
}
