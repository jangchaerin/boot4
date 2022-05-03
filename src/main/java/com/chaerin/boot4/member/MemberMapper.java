package com.chaerin.boot4.member;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.web.multipart.MultipartFile;


@Mapper 
public interface MemberMapper {
	//member
	public MemberVO getId(MemberVO memberVO) throws Exception;
	//insert : join
	public int setJoin(MemberVO memberVO) throws Exception;
	
	//detail : login
	public MemberVO getLogin(MemberVO memberVO) throws Exception;
	
	//mypage
	public MemberVO getMypage(MemberVO memberVO) throws Exception;	
	
	//update : 회원 정보수정
	public int setUpdate(MemberVO memberVO) throws Exception;
	
	//delete : 회원탈퇴
	public int setDelete(MemberVO memberVO)throws Exception;
	
	//findId
	public MemberVO findId(MemberVO memberVO)throws Exception;
	
	
	//memberrole
	//insert
	public int setRoleJoin(Map<String, String> map)throws Exception;
	
	
	
	//MemberFile
	//insert
	public int AddFile(MemberFileVO memberFileVO) throws Exception;
	//list
	public MemberFileVO getFile(MemberVO memberVO) throws Exception;
	//detail
	//public MemberFileVO DetailFile(MemberFileVO memberFileVO) throws Exception;
	//update
	//public int UpdateFile(MemberFileVO memberFileVO) throws Exception;
	//delete
	//public int DeleteFile(MemberFileVO memberFileVO) throws Exception;



}
