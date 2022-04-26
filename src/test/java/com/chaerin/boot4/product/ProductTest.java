package com.chaerin.boot4.product;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.chaerin.boot4.board.BoardVO;
import com.chaerin.boot4.util.Pager;

@SpringBootTest
class ProductTest {
	@Autowired
	private ProductMapper productMapper;

	//@Test
	void addtest() throws Exception{
		ProductVO productVO = new ProductVO();
		
		for(int i=1;i<51;i++) {
		productVO.setProductName("Test"+i);
		productVO.setProductPrice("Test5000"+i);
		productVO.setProductCount(5L);
		productVO.setProductDetail("Testdetail"+i);
		
		int result=productMapper.add(productVO);
		}
		System.out.println("finish");
	}
	//@Test
	void listTest() throws Exception{
		 Pager pager = new Pager();
	     pager.makeRow();
	     pager.makeNum(50L);
	     List<ProductVO> ar = productMapper.list(pager);
	         
	     System.out.println(ar);
	     // assertEquals(10,ar.size());
	     assertNotNull(ar);
	}

}



