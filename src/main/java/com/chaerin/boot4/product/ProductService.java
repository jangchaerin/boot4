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
	
	public int setUpdate(ProductVO productVO, MultipartFile [] multipartFiles)throws Exception{
		int result = productMapper.setUpdate(productVO);
		
		if(multipartFiles != null) {
			
			for(MultipartFile multipartFile: multipartFiles) {
				if(multipartFile.isEmpty()) {
					continue;
				}
				
				ProductFilesVO productFilesVO = new ProductFilesVO();
						
				String fileName =fileManager.fileSave(multipartFile, "/resources/upload/product/");
				productFilesVO.setFileName(fileName);
				productFilesVO.setOriName(multipartFile.getOriginalFilename());
				productFilesVO.setProductNum(productVO.getProductNum());
				result = productMapper.fileAdd(productFilesVO);
				
			}
			
			
		}
		
		
		return result;
	}
	
	public int setFileDelete(ProductFilesVO productFilesVO)throws Exception{
		//DB에서 조회(삭제하려는 file)
		productFilesVO=productMapper.getFileDetail(productFilesVO);
		
		/* 방법1. (hdd먼저 지우고 성공하면 db지우기)
		//HDD삭제  -> 트랜잭션에 포함x
		boolean result = fileManager.remove(productFilesVO.getFileName(), "../resources/upload/product/");
		
		//DB삭제 
		if(result) { //삭제가 성공하면, db에서 지움
			 productMapper.setFileDelete(productFilesVO);
		}*/
		
				
		//방법2. db에서 삭제가 되면 그때, hdd에 지우러 감
		int check=productMapper.setFileDelete(productFilesVO);
		if(check>0) {
			boolean result = fileManager.remove(productFilesVO.getFileName(), "../resources/upload/product/");
		}
		
		return check;
	}
	
	
}
