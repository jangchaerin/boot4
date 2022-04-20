package com.chaerin.boot4.member;

import com.chaerin.boot4.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class MemberFileVO extends FileVO{
	private String id;

}
