package com.chaerin.boot4.member;

import java.io.File;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chaerin.boot4.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private FileManager fileManager;
	
	public int setJoin(MemberVO memberVO, MultipartFile file)throws Exception{
		int result=memberMapper.setJoin(memberVO);
		
		if(!file.isEmpty()) {
			String fileName=fileManager.fileSave(file, "resources/upload/member");
			
			MemberFileVO memberFileVO= new MemberFileVO();
			memberFileVO.setId(memberVO.getId());
			memberFileVO.setFileName(fileName);
			memberFileVO.setOriName(file.getOriginalFilename());
			
			result=memberMapper.AddFile(memberFileVO);
		}
		
		return result;
	}
	public MemberVO getLogin(MemberVO memberVO) throws Exception{
		return memberMapper.getLogin(memberVO);
	}
	public MemberVO getMypage(MemberVO memberVO)throws Exception{
		return memberMapper.getMypage(memberVO);
	}
	public int setDelete(MemberVO memberVO) throws Exception{
		MemberFileVO memberFileVO = new MemberFileVO();
		memberFileVO = memberMapper.getFile(memberVO);
	
		int result= memberMapper.setDelete(memberVO);
		if(result==1) {
			boolean check = fileManager.remove("resources/upload/member",memberFileVO.getFileName());
		}
		
		return result;
	}
	public int setUpdate(MemberVO memberVO)throws Exception{
		return memberMapper.setUpdate(memberVO);
	}

}
