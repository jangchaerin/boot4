package com.chaerin.boot4.product;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.chaerin.boot4.board.BoardFilesVO;
import com.chaerin.boot4.util.FileManager;
import com.chaerin.boot4.util.Pager;

@Service
@Transactional(rollbackFor = Exception.class)
public class ProductService {

	@Autowired
	private ProductMapper productMapper;
	@Autowired
	private FileManager fileManager;

	public int add(ProductVO productVO, MultipartFile[] files) throws Exception {
		int result = productMapper.add(productVO);

		if (files != null) {
			for (MultipartFile mf : files) {
				if (mf.isEmpty()) {
					continue;
				}
				String fileName = fileManager.fileSave(mf, "resources/upload/product");
				ProductFilesVO productFilesVO = new ProductFilesVO();

				productFilesVO.setProductNum(productVO.getProductNum());
				productFilesVO.setFileName(fileName);
				productFilesVO.setOriName(mf.getOriginalFilename());

				result = productMapper.fileAdd(productFilesVO);
			}
		}

		return result;
	}

	public int fileAdd(ProductFilesVO productFilesVO) throws Exception {
		return productMapper.fileAdd(productFilesVO);
	}

	public List<ProductVO> list(Pager pager) throws Exception {

		pager.makeRow();
		pager.makeNum(productMapper.totalCount(pager));
		return productMapper.list(pager);
	}
	
	public ProductVO getDetail(ProductVO productVO) throws Exception{
		return productMapper.getDetail(productVO);
	}
	
	public int setUpdate(ProductVO productVO) throws Exception{
		return productMapper.setUpdate(productVO);
	}
	
	
}
