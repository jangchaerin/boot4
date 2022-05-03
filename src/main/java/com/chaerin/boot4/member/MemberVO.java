package com.chaerin.boot4.member;

import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class MemberVO {
	//@NotEmpty
	@NotBlank
	private String id;
	@Size(min=3, max=12,message="3자 이상 12자 이하")
	private String pw;
	
	private String checkPw;
	
	@NotBlank
	private String name;
	@Email
	@NotBlank
	private String email;
	@NotBlank
	private String phone;	
	
	private MemberFileVO memberFileVO;
	
	private List<RoleVO> roleVOs;
}
