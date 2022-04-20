package com.chaerin.boot4.member;

import lombok.Data;

@Data
public class MemberVO {
	private String id;
	private String pw;
	private String name;
	private String email;
	private String phone;
	
	private MemberFileVO memberFileVO;
}
