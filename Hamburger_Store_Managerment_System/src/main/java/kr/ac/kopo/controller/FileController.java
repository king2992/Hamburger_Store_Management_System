package kr.ac.kopo.controller;

import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.service.FileService;
import kr.ac.kopo.util.UploadFileUtils;

@RestController
@RequestMapping("/review/file")
public class FileController {
	
	@Autowired
	private FileService fileService;
	
	// 게시글 파일 업로드
	@RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
		ResponseEntity<String> entity = null;
		try {
			String savedFilePath = UploadFileUtils.uploadFile(file, request);
			entity = new ResponseEntity<String>(savedFilePath, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
	@RequestMapping(value = "/display", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {
		
		// Http 헤더 설정 가져오기
		HttpHeaders httpHeaders =UploadFileUtils.getHttpHeaders(fileName);
		// 업로드 기본경로
		String rootPath = UploadFileUtils.getRootPath(fileName, request);
		
		ResponseEntity<byte[]> entity = null;
		
		// 파일데이터, HttpHeader 전송
		try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
			entity = new ResponseEntity<byte[]>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<byte[]>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 게시글 파일 삭제 : 게시글 작성 페이지
	@RequestMapping(value = "/delete/{number}", method = RequestMethod.POST)
	public ResponseEntity<String> deleteFile(@PathVariable("number") int number, String fileName, HttpServletRequest request) {
		
		ResponseEntity<String> entity = null;
		
		try {
			UploadFileUtils.deleteFile(fileName, request);
			fileService.deleteFile(fileName, number);
			entity = new ResponseEntity<String>("DELETED", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
	// 첨부파일 리스트 출력{글 번호}
	@RequestMapping("/list/{number}")
	public ResponseEntity<List<String>> getFiles(@PathVariable("number") int number) {
		ResponseEntity<List<String>> entity = null;
		try {
			List<String> fileList = fileService.getArticleFiles(number);
			entity = new ResponseEntity<>(fileList, HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	// 게시글 파일 전체 삭제
	@RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
	public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files, HttpServletRequest request) {
		
		if (files == null || files.length == 0)
			return new ResponseEntity<>("DELETED", HttpStatus.OK);
		
		ResponseEntity<String> entity = null;
		
		try {
			for (String fileName : files)
				UploadFileUtils.deleteFile(fileName, request);
			entity = new ResponseEntity<>("DELETED",HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
		}
		
		return entity;
	}
}
