package com.chaerin.boot4.board;


import com.chaerin.boot4.util.FileVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class BoardFilesVO extends FileVO{

	private Long num;

	
}
