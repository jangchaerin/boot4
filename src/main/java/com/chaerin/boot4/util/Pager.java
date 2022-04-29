package com.chaerin.boot4.util;

import lombok.Data;

@Data
public class Pager {
	private String id;
	
	//DB에서 몇개씩 조회할거냐
	private Long perPage;
	
	//DB에서 조회할 시작 인덱스 번호
	private Long startRow;
	private Long lastRow;
	
	//페이지 번호(파라미터 값)
	private Long pn;
	
	//검색
	private String search;
	private String kind;
	
	//page
	private Long startNum;
	private Long lastNum;	
	private boolean next;
	private boolean pre;
	
	public void makeRow() {
		//pn : 1, perPage : 10, startRow : 0
		//pn : 2, perPage : 10, startRow : 10
		//pn : 3, perPage : 10, startRow : 20
		this.startRow = (this.getPn()-1)*this.getPerPage();
	}
	
	public void makeNum(Long totalCount) {
		
	
		//전체 페이지 수
		Long totalPage=totalCount/this.getPerPage();
		if(totalCount%this.getPerPage()!=0) {
			totalPage++;
		}
		//block당 갯수
		Long block=10L;
		
		//전체 block갯수 구하기
		Long totalBlock=totalPage/block;
		if(totalPage%block!=0) {
			totalBlock++;
		}
		
		//현재 페이지 번호로 몇번쨰 block인지 구하기
		Long curBlock = this.getPn()/block;
		if(this.getPn()%block!=0) {
			curBlock++;
		}
		
		//curBlock로 startNum, lastNum 구하기
		this.startNum=(curBlock-1)*block+1;
		this.lastNum=curBlock*block;
		
		//이전, 다음 블럭 유무
		this.pre=false;
		if(curBlock>1) {
			this.pre=true;
		}
		
		this.next=false;
		if(totalBlock>curBlock) {
			this.next=true;
		}
		
		//현재블럭이 마지막 블럭이랑 같다면
		if(curBlock==totalBlock) {
			this.lastNum=totalPage;
		}
	
	
	}
	
	
	public Long getPn() {
		if(this.pn==null || this.pn < 1) {
			this.pn=1L;
		}
		return this.pn;
	}
	
	public Long getPerPage() {
		if(this.perPage == null || this.perPage < 1) {
			this.perPage=10L;
		}
		return this.perPage;
	}
	
	//GETTER : get+멤버변수명, 멤버변수명의 첫글자는 대문자
	public String getSearch() {
		if(this.search==null) {
			this.search="";
		}
		
		return this.search;
	}

}
