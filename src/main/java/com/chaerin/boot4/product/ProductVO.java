package com.chaerin.boot4.product;

import java.util.List;

import lombok.Data;

@Data
public class ProductVO {
	
	private Long productNum;
	private String productName;
	private String productPrice;
	private Long productCount;
	private String productDetail;
	
	private List<ProductFilesVO> productFilesVO;
	
}
