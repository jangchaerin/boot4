package com.chaerin.boot4;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import com.chaerin.boot4.board.BoardFilesVO;
import com.chaerin.boot4.board.BoardMapper;
import com.chaerin.boot4.board.BoardVO;
import com.chaerin.boot4.util.Pager;
@SpringBootTest
class BoardMMMtest {
	@Autowired
	private BoardMapper boardMapper;
	

	   //@Test
	   void getDetailtest() throws Exception {
	      BoardVO boardVO = new BoardVO();
	      boardVO.setNum(111L);
	      boardVO = boardMapper.getDetail(boardVO);
	      System.out.println(boardVO.toString());
	      assertNotNull(boardVO);
	   }

	   //@Test
	   void getListTest() throws Exception{
	         Pager pager = new Pager();
	         pager.makeRow();
	         List<BoardVO> ar=boardMapper.getList(pager);
	         
	         System.out.println(ar);
	         assertEquals(10,ar.size());
	      }

	   //@Test
	   void addTest() throws Exception {
	      for (int i = 0; i < 100; i++) {
	         if (i % 10 == 0) {
	            Thread.sleep(1000);
	         }
	         BoardVO boardVO = new BoardVO();
	         boardVO.setTitle("title" + i);
	         boardVO.setWriter("writer" + i);
	         boardVO.setContents("contents" + i);
	         int result = boardMapper.setAdd(boardVO);

	      }
	      System.out.println("add finish");
	      // assertEquals(1, result);
	   }

	   // @Test
	   void UpdateTest() throws Exception {

	      BoardVO boardVO = new BoardVO();
	      boardVO.setNum(4L);
	      boardVO.setContents("contents update!!");
	      int result = boardMapper.setUpdate(boardVO);
	      assertEquals(1, result);
	   }

	   // @Test
	   void DeleteTest() throws Exception {
	      BoardVO boardVO = new BoardVO();
	      boardVO.setNum(4L);

	      int result = boardMapper.setDelete(boardVO);
	      assertEquals(1, result);
	   }

	   // @Test
	   void setFileAddTest() throws Exception {
	      BoardFilesVO boardFilesVO = new BoardFilesVO();
	      boardFilesVO.setFileName("filename");
	      boardFilesVO.setOriName("oriname");
	      boardFilesVO.setNum(3L);
	      int result = boardMapper.setFileAdd(boardFilesVO);
	      assertEquals(1, result);
	   }


}
