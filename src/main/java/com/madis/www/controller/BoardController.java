package com.madis.www.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.madis.www.model.dao.impl.BoardImpl;
import com.madis.www.model.dao.impl.CommentImpl;
import com.madis.www.model.dto.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardImpl boardImpl;
	
	@Autowired
	private CommentImpl commentImpl;
	
	// 글 쓰기 페이지 출력 (.jsp 출력)
	@RequestMapping(value="/write")
	public String writeBoard(Board board, Model model) {
		System.out.println("write");
		if (board.getIndex() != 0) {
			System.out.println("writeBoard1");
			model.addAttribute("board", boardImpl.getBoard(board.getIndex()));
		}
		else {
			System.out.println("writeBoard2");
			model.addAttribute("board", board);
		}
		// Model 정보 저장
		return "board/writeBoard";
	}
	
	// 글 등록
	@RequestMapping(value="/insert")
	public String insertBoard(Board board) throws IOException {
		System.out.println("insertBoard");
		System.out.println(board.getTitle());
		/*
		// 파일 업로드 처리
		MultipartFile uploadFile = vo.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String fileName = uploadFile.getOriginalFilename();
			uploadFile.transferTo(new File("/Users/harrimkim/" + fileName));
		}
		*/
		boardImpl.insertBoard(board);
		return "redirect:/board";
	}
	
	// 글 수정
	@RequestMapping("/{index}/update")
	public String updateBoard(@PathVariable int index, Board board) {
		System.out.println("updateBoard");
		boardImpl.updateBoard(board);
		return "redirect:/board";
	}
	
	// 글 삭제
	@RequestMapping("/{index}/delete")
	public @ResponseBody Map<String, Object> deleteBoard(@PathVariable int index) {
		System.out.println("board/{index}/delete");

		boardImpl.deleteBoard(index);
		System.out.println("success");
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("result", 1);
		
		return resultMap;
	}

	// 글 상세 조회 (.jsp 출력)
	@RequestMapping("/{index}")
	public String getBoard(@PathVariable int index, Model model) {
		// Model 정보 저장
		model.addAttribute("board", boardImpl.getBoard(index));
		model.addAttribute("CommentList", commentImpl.getCommentList(index));
		return "board/getBoard";
	}
	
	// 글 목록 검색 (.jsp 출력)
	@RequestMapping("")
	public String getBoardList(Board board, Model model){
		System.out.println("getBoardList");
		
		List<Board> boardList = boardImpl.getBoardList(board);
		List<Integer> commentCount = new ArrayList<Integer>();
		for(int i=0; i<boardList.size();i++) {
			Integer count = commentImpl.getCommentList(boardList.get(i).getIndex()).size();
			commentCount.add(count);
		}
		
		// Model 정보 저장
		model.addAttribute("boardList", boardImpl.getBoardList(board));
		model.addAttribute("CommentCountList", commentCount);
		return "board/getBoardList";
	}
}
