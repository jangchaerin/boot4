package com.chaerin.boot4.product;

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
@RequestMapping("product/*")
public class ProduceController {
	
	@ModelAttribute("board")
	public String getBoard() {
		return "product";
	}
	
	@Autowired
	private ProductService productService;
	
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
	public ModelAndView add(ProductVO productVO,MultipartFile[] files)throws Exception{
		ModelAndView mv = new ModelAndView();
		   for(MultipartFile f: files) {
			      System.out.println(f.getOriginalFilename());
			      System.out.println(f.getSize());
			   }
		
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
	public ModelAndView getAjaxList(Pager pager) throws Exception{
		ModelAndView mv =new ModelAndView(); 
		System.out.println("ajaxList");
		List<ProductVO> ar= productService.list(pager);
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		mv.setViewName("common/productList");
		
		return mv;
	
	}
	
	

}
