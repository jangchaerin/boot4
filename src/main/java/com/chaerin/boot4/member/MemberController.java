package com.chaerin.boot4.member;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("member/*")
public class MemberController {
	
	@Autowired
	private MemberService memberService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "member";
	}
	
	@GetMapping("findId")
	public ModelAndView findId(MemberVO memberVO) throws Exception{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("member/findId");	
		return mv;
	}
	@PostMapping("findId")
	public ModelAndView findId(MemberVO memberVO,ModelAndView mv) throws Exception{
		memberVO = memberService.findId(memberVO);
		mv.addObject("idResult", memberVO);
		mv.setViewName("member/findIdResult");
		return mv;
	}
	
	@PostMapping("join")
	public ModelAndView setJoin(MemberVO memberVO, MultipartFile file)throws Exception{
		ModelAndView mv= new ModelAndView();
		int result = memberService.setJoin(memberVO,file);
		mv.setViewName("redirect:../");
		return mv;
	}
	@GetMapping("join")
	public ModelAndView setJoin()throws Exception{
		ModelAndView mv= new ModelAndView();
		mv.setViewName("member/join");
		return mv;
	}
	@PostMapping("login")
	public ModelAndView getLogin(MemberVO memberVO, HttpSession session,HttpServletResponse response) throws Exception{
		ModelAndView mv= new ModelAndView();
		memberVO=memberService.getLogin(memberVO);
		
		String message = "로그인 실패";
		String path="./login";
		if(memberVO!=null) {
			session.setAttribute("member", memberVO);
			message="로그인 성공";
			path="../";
		}
		
		mv.addObject("message",message);
		mv.addObject("path",path);
		mv.setViewName("common/result");
		
		return mv;
	}
	@GetMapping("login")
	public ModelAndView getLogin(@ModelAttribute MemberVO memberVO) throws Exception{
		ModelAndView mv= new ModelAndView();
		mv.addObject("vo", new MemberVO());
		mv.setViewName("member/login");
		return mv;
	}
	@GetMapping("logout")
	public String getLogout(HttpSession session) throws Exception{
		
		session.invalidate();
		
		return "redirect:../";
		
	}
	
	@GetMapping("delete")
	public String setDelete(MemberVO memberVO, HttpSession session) throws Exception{
		int result = memberService.setDelete(memberVO);
		session.invalidate();
		return "redirect:../";
	}
	
	@GetMapping("mypage")
	public ModelAndView getMypage(HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO=memberService.getMypage(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/mypage");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(MemberVO memberVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = memberService.setUpdate(memberVO);
		
		mv.setViewName("redirect:../");
		return mv;
	}
	@GetMapping("update")
	public ModelAndView setUpdate(MemberVO memberVO, ModelAndView mv) throws Exception{
		memberVO = memberService.getMypage(memberVO);
		mv.addObject("vo",memberVO);
		mv.setViewName("member/update");
		
		return mv;
	}
	
	
	
}
