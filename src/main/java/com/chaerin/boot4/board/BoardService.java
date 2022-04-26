package com.chaerin.boot4.board;

import java.sql.SQLException;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.chaerin.boot4.util.FileManager;
import com.chaerin.boot4.util.Pager;

@Service
@Transactional(rollbackFor=Exception.class)
public class BoardService {
	
	@Autowired
	private BoardMapper boardMapper;
	@Autowired
	private FileManager fileManager;
	

	
	public boolean setSummerFileDelete(String fileName)throws Exception{
		fileName=fileName.substring(fileName.lastIndexOf("/")+1);
		System.out.println(fileName);
		
		
		return fileManager.remove("/resources/upload/board/",fileName);
	}
	
	public String setSummerFileUpload(MultipartFile files) throws Exception{
		//파일을 HDD에 저장하고 저장된 파일명을 리턴
		String fileName = fileManager.fileSave(files, "resources/upload/board");
		
		fileName="/resources/upload/board/"+fileName;
		return fileName;
		
		
	}
	
	
	
	
	public BoardFilesVO getFileDetail(BoardFilesVO boardFilesVO)throws Exception{
		return boardMapper.getFileDetail(boardFilesVO);
	}
	
	//list : getList
	public List<BoardVO> getList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makeNum(boardMapper.getTotalCount(pager));
		
		return boardMapper.getList(pager);
	}
	
	public BoardVO getDetail(BoardVO boardVO) throws Exception{
		return boardMapper.getDetail(boardVO);
	}
	
	public int setUpdate(BoardVO boardVO) throws Exception{
		return boardMapper.setUpdate(boardVO);
	}
	public int setDelete(BoardVO boardVO) throws Exception{
		
		List<BoardFilesVO> ar=boardMapper.getFileList(boardVO);
		int result=boardMapper.setDelete(boardVO);
		
		for(BoardFilesVO f :ar) {
			boolean check = fileManager.remove("resources/upload/board",f.getFileName());
		
		}
		
		return result;
	}


	//insert : setAdd
	public int setAdd(BoardVO boardVO, MultipartFile[] files) throws Exception {
		//1.HDD에 저장
		System.out.println("INSERT 전 : "+boardVO.getNum());
		int result = boardMapper.setAdd(boardVO);
		System.out.println("INSERT 후 : "+boardVO.getNum());
		
		for(MultipartFile mf: files) { 
			if(mf.isEmpty()) {
				continue;
			}
//			if(result>0) {
//				throw new SQLException();
//			}
			String fileName = fileManager.fileSave(mf, "resources/upload/board/");
			System.out.println(fileName);
			
			//2. DB에 저장
			BoardFilesVO boardFilesVO = new BoardFilesVO();
			boardFilesVO.setNum(boardVO.getNum());
			boardFilesVO.setFileName(fileName);
			boardFilesVO.setOriName(mf.getOriginalFilename());
			
			result =boardMapper.setFileAdd(boardFilesVO);
			
			if(result<1) {
				throw new SQLException();
			}
		}
		
		return result;
	}
	

}
