package com.madis.www.controller;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.madis.www.model.dao.impl.BoardImpl;
import com.madis.www.model.dto.Board;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired
	private BoardImpl boardImpl;
	
	// 글 쓰기 페이지 출력
	@RequestMapping(value="/writeBoard")
	public String writeBoard(Board board, Model model) {
		if (board.getIndex() != 0) {
			System.out.println("writeBoard1");
			model.addAttribute("board", boardImpl.getBoard(board));
		}
		else {
			System.out.println("writeBoard2");
			model.addAttribute("board", board);
		}
		// Model 정보 저장
		return "board/writeBoard";
	}
	
	// 글 등록
	@RequestMapping(value="/insertBoard")
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
		System.out.println("after");
		return "redirect:getBoardList";
	}
	
	// 글 수정
	@RequestMapping("/updateBoard")
	public String updateBoard(Board board) {
		System.out.println("updateBoard");
		boardImpl.updateBoard(board);
		return "redirect:getBoardList";
	}
	
	// 글 삭제
	@RequestMapping("/deleteBoard")
	public String deleteBoard(Board board) {
		boardImpl.deleteBoard(board);
		return "redirect:getBoardList";
	}

	// 글 상세 조회
	@RequestMapping("/getBoard")
	public String getBoard(Board board, Model model) {
		// Model 정보 저장
		model.addAttribute("board", boardImpl.getBoard(board));
		return "board/getBoard";
	}
	
	// 글 목록 검색
	@RequestMapping("/getBoardList")
	public String getBoardList(Board board, Model model){
		System.out.println("getBoardList");
		// Model 정보 저장
		model.addAttribute("boardList", boardImpl.getBoardList(board));
		return "board/getBoardList";
	}
}
