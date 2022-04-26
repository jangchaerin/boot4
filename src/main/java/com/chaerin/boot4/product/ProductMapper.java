package com.chaerin.boot4.product;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.chaerin.boot4.util.Pager;

@Mapper
public interface ProductMapper {

	public int add(ProductVO productVO) throws Exception;
	
	public int fileAdd(ProductFilesVO productFilesVO) throws Exception;
	
	public List<ProductVO> list(Pager pager) throws Exception;
	
	public Long totalCount(Pager pager) throws Exception; 
	
	
}
