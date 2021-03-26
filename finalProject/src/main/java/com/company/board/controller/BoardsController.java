package com.company.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.company.board.service.BoardsVO;
import com.company.board.service.impl.BoardsMapper;
import com.company.common.FileRenamePolicy;

@Controller
public class BoardsController {
	@Autowired
	BoardsMapper boardsMapper;

	// 등록 폼
	@GetMapping("/insertBoards")
	public String insertBoardForm() {
		return "board/insertBoard";
	}

	// 등록 처리
	@PostMapping("/insertBoards")
	public String insertBoards(BoardsVO vo) throws IllegalStateException, IOException {
		System.out.println(vo);
		
		// 첨부 파일 처리
		MultipartFile[] files = vo.getUploadFile();
		String filenames = "";
		boolean start = true;
		
		// 다중 업로드 -> for문
		for (MultipartFile file : files) { 
			if (file != null && !file.isEmpty() && file.getSize() > 0) {
				String filename = file.getOriginalFilename();
				// 파일명 중복체크 -> rename
				File rename = FileRenamePolicy.rename(new File("C:\\upload", filename));
				if (! start) {
					filenames += ", ";					
				} else {
					start = false;
				}
				filenames += rename.getName();
				file.transferTo(rename); // 임시폴더에서 업로드 폴더로 이동
			}
		}
		vo.setFileName(filenames); // vo 업로드된 파일명 담아서 DB에 저장		
		// 등록 서비스 호출
		boardsMapper.insertBoards(vo);
		return "redirect:/getBoards?seq=" + vo.getSeq();
	}

	// 단건 조회
	@GetMapping("/getBoards")
	public String getBoards(Model model, BoardsVO vo) {
		model.addAttribute("board", boardsMapper.getBoards(vo));
		return "board/getBoard";
	}

	// 파일 다운
	@RequestMapping("/fileDown")
	public void fileDown(BoardsVO vo, HttpServletResponse response) throws IOException {
		vo = boardsMapper.getBoards(vo);
		File file = new File("c:/upload", vo.getFileName());
		if (file.exists()) {
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=\"" 
							  + URLEncoder.encode(vo.getFileName(), "utf-8") + "\"");
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(file));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("<script>")
								.append("alert('파일을 찾을수 없습니다.');")
								.append("history.go(-1);")
								.append("</script>");
		}
	}
	
	@RequestMapping("/fileNameDown")
	public void fileNameDown(BoardsVO vo, HttpServletResponse response) throws IOException {
		File file = new File("c:/upload", vo.getFileName());
		if (file.exists()) {
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.setHeader("Content-Disposition", "attachment; filename=\"" 
							  + URLEncoder.encode(vo.getFileName(), "utf-8") + "\"");
			
			BufferedInputStream in = null;
			BufferedOutputStream out = null;
			try {
				in = new BufferedInputStream(new FileInputStream(file));
				out = new BufferedOutputStream(response.getOutputStream());
				FileCopyUtils.copy(in, out);
				out.flush();
			} catch (IOException ex) {
			} finally {
				in.close();
				response.getOutputStream().flush();
				response.getOutputStream().close();
			}
		} else {
			response.setContentType("text/html; charset=UTF-8");
			response.getWriter().append("<script>")
								.append("alert('파일을 찾을수 없습니다.');")
								.append("history.go(-1);")
								.append("</script>");
		}
	}
	
}
