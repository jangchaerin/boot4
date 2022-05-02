package com.chaerin.boot4.member;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.chaerin.boot4.util.FileManager;

@Service
public class MemberService {
	
	@Autowired
	private MemberMapper memberMapper;
	@Autowired
	private FileManager fileManager;
	
	//properties 파일의 key를 이용해서 member.role.member의 속성값 반환
	@Value("${member.role.member}")
	private String memberRole;
	
	public MemberVO findId(MemberVO memberVO)throws Exception{
		return memberMapper.findId(memberVO);
	}
	
	public int setJoin(MemberVO memberVO, MultipartFile file)throws Exception{
		int result=memberMapper.setJoin(memberVO);
		
		//MEMBERROLE 테이블 INSERT
		Map<String, String> map= new HashMap<>();
		map.putIfAbsent("id", memberVO.getId());        //arrayList는 ADD, map은 PUT
		map.put("roleName", memberRole);
		
		
		result =memberMapper.setRoleJoin(map);
	
		
		
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
