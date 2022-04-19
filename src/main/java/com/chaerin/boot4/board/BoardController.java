package com.chaerin.boot4.board;

import java.util.List;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


import com.chaerin.boot4.util.Pager;



@Controller
@RequestMapping("/board/*")
public class BoardController {
	
	@Autowired
	BoardService boardService;
	
	@ModelAttribute("board")
	public String getBoard() {
		return "board";
	}

	@GetMapping("list")
	public ModelAndView getList(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<BoardVO> ar = boardService.getList(pager);
		
		mv.addObject("list",ar);
		mv.setViewName("board/list");
		mv.addObject("pager",pager);	
		

		return mv;
	}
	@GetMapping("add")
	public ModelAndView setAdd(BoardVO boardVO, ModelAndView mv)throws Exception{
		
		mv.setViewName("board/add");
		
		return mv;
	}
	@PostMapping("add")
	public String setAdd(BoardVO boardVO,MultipartFile[] files) throws Exception{
		int result = boardService.setAdd(boardVO,files);
		return "redirect:./list";
	}
	
	@GetMapping("detail")
	public ModelAndView getDetail(BoardVO boardVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		boardVO=boardService.getDetail(boardVO);
		
		mv.addObject("vo",boardVO);
		mv.setViewName("board/detail");
		
		return mv;
	}
	
	@PostMapping("update")
	public String setUpdate(BoardVO boardVO) throws Exception{
		int result = boardService.setUpdate(boardVO);
		
		return "redirect:./list";
	}
	
	@GetMapping("update")
	public ModelAndView setUpdate(BoardVO boardVO, ModelAndView mv) throws Exception{
		boardVO=boardService.getDetail(boardVO);
		
		mv.addObject("vo",boardVO);
		mv.setViewName("board/update");
		
		return mv;
	}
	
	@GetMapping("delete")
	public ModelAndView setDelete(BoardVO boardVO)throws Exception{
		int result = boardService.setDelete(boardVO);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:./list");
		return mv;
	}
	
}
