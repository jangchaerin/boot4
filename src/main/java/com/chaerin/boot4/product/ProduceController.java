package com.chaerin.boot4.product;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.chaerin.boot4.member.MemberVO;
import com.chaerin.boot4.util.Pager;

@Controller
@RequestMapping("product/*")
public class ProduceController {
	
	@ModelAttribute("board")
	public String getBoard() {
		return "product";
	}
	
	@Autowired
	private ProductService productService;
	
	@PostMapping("fileDelete")
	public ModelAndView setFileDelete(ProductFilesVO productFilesVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = productService.setFileDelete(productFilesVO);
		//System.out.println(productFilesVO.getFileNum());
	
		mv.addObject("result",result);	//0 또는 1보냄
		mv.setViewName("common/result2");
		return mv;
	}
	
	@PostMapping("update")
	public ModelAndView setUpdate(ProductVO productVO,MultipartFile []files) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result=productService.setUpdate(productVO,files);
		if(result>0) {
			mv.setViewName("redirect:./manage");			
		}else {
			mv.setViewName("common/getResult");
			mv.addObject("msg", "update 실패");
			mv.addObject("path", "./manageDetail?productNum="+productVO.getProductNum());
		}
		return mv;
	}
	@GetMapping("update")
	public ModelAndView setUpdate(ProductVO productVO, ModelAndView mv) throws Exception{
		productVO=productService.getDetail(productVO);
		mv.addObject("vo",productVO);
		mv.setViewName("product/update");
		
		return mv;
	}
	
	
	@GetMapping("detail")	//상세설명 페이지
	public ModelAndView getDetail(ProductVO productVO) throws Exception{
		//parameter는 productNum
		//모든 구매자가 볼수있음
		ModelAndView mv = new ModelAndView();
		
		productVO=productService.getDetail(productVO);
		System.out.println("일반회원"+productVO);
		
		
		
		mv.addObject("vo", productVO);
		mv.setViewName("product/detail");
		
		return mv;
	}
	@GetMapping("manageDetail")	//상세설명 페이지
	public ModelAndView getManageDetail(ProductVO productVO) throws Exception{
		//parameter는 productNum
		//판매자만 볼수있음
		ModelAndView mv = new ModelAndView();
		productVO=productService.getDetail(productVO);
		
		System.out.println("판매자"+productVO);
		
		
		mv.addObject("vo", productVO);
		
		mv.setViewName("product/manageDetail");
		
		return mv;
	}
	
	
	
	@GetMapping("manage")
	public  ModelAndView manage(Pager pager,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		pager.setId(memberVO.getId());
		
		List<ProductVO> ar=productService.list(pager);
	
		mv.addObject("list",ar);
		mv.setViewName("product/manage");
		return mv;	
	}
	
	@GetMapping("list")
	public ModelAndView list(ProductVO productVO, Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = productService.list(pager);
	
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("product/list");
		
		return mv;
	}
	@PostMapping("add")
	public ModelAndView add(ProductVO productVO,MultipartFile[] files, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		//session에서 로그인한 아이디를 꺼내서 productVO에 넣기
		System.out.println("sale:"+productVO.getSale());
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		productVO.setId(memberVO.getId());
	
		
//		   for(MultipartFile f: files) {
//			      System.out.println(f.getOriginalFilename());
//			      System.out.println(f.getSize());
//			   }
		
		int result = productService.add(productVO,files);
		mv.setViewName("common/result2");
		mv.addObject("result",result);
		return mv;
	}
	
	@GetMapping("add")
	public ModelAndView add(ProductVO productVO,ModelAndView mv) throws Exception{	
		mv.setViewName("product/add");
		return mv;
	}
	@GetMapping("ajaxList")
	public ModelAndView getAjaxList(Pager pager,HttpSession session) throws Exception{
		ModelAndView mv =new ModelAndView(); 
		System.out.println("ajaxList");
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		pager.setId(memberVO.getId());
		List<ProductVO> ar= productService.list(pager);
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("common/productList");
		
		return mv;
	
	}
	
	

}
