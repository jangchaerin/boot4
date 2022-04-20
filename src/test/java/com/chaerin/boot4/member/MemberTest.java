package com.chaerin.boot4.member;

import static org.junit.jupiter.api.Assertions.*;


import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class MemberTest {
	@Autowired
	private MemberMapper memberMapper;

	//@Test
	void Jointest() throws Exception{
		MemberVO memberVO=new MemberVO();
		
		memberVO.setId("TestID");
		memberVO.setPw("TestPw");
		memberVO.setName("TestName");
		memberVO.setEmail("TestEmail");
		memberVO.setPhone("TestPhone");
		//int result=memberMapper.setJoin(memberVO,file);
		
		//assertEquals(1, result);	
	}
	
	//@Test
	void DetailTest() throws Exception{
		MemberVO memberVO=new MemberVO();
		
		memberVO.setId("1");
		memberVO.setPw("1");
		memberVO=memberMapper.getLogin(memberVO);
		
		assertNotNull(memberVO);
	}
	//@Test
	void myPageTest() throws Exception{
		MemberVO memberVO=new MemberVO();
		
		memberVO.setId("TestID");
		memberVO=memberMapper.getMypage(memberVO);
		
		assertNotNull(memberVO);
	}
	
	//@Test
	void updateTest() throws Exception{
		MemberVO memberVO=new MemberVO();
		
		memberVO.setName("Update Name");
		memberVO.setEmail("Update Email");
		memberVO.setPhone("Update Phone");
		memberVO.setId("1");
		
		int result = memberMapper.setUpdate(memberVO);
		assertEquals(1, result);	
	}
	
	//@Test
	void DeleteTest() throws Exception{
		MemberVO memberVO=new MemberVO();
		memberVO.setId("1");
		int result = memberMapper.setDelete(memberVO);
		assertEquals(1, result);	
	}
	//@Test
	void AddFileTest() throws Exception{
		MemberFileVO memberFileVO= new MemberFileVO();
		memberFileVO.setId("1");
		memberFileVO.setFileName("DDAFEFA");
		memberFileVO.setOriName("FAEFDVZVZEFEWF");
		int result =memberMapper.AddFile(memberFileVO);
		assertEquals(1, result);
		
	}

}
