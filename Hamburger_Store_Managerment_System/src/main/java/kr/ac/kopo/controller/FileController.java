package kr.ac.kopo.controller;


  
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.apache.commons.io.IOUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.List;
import kr.ac.kopo.service.FileService;
import kr.ac.kopo.util.UploadFileUtils;

@RestController 
@RequestMapping("/review/file")
public class FileController {
	
	@Autowired
	private FileService fileService;
	
	// 寃뚯떆湲� �뙆�씪 �뾽濡쒕뱶
    @RequestMapping(value = "/upload", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
    public ResponseEntity<String> uploadFile(MultipartFile file, HttpServletRequest request) {
        ResponseEntity<String> entity = null;
        try {
            String savedFilePath = UploadFileUtils.uploadFile(file, request);
            entity = new ResponseEntity<>(savedFilePath, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 寃뚯떆湲� �뙆�씪 異쒕젰
    @RequestMapping(value = "/display", method = RequestMethod.GET)
    public ResponseEntity<byte[]> displayFile(String fileName, HttpServletRequest request) throws Exception {

        HttpHeaders httpHeaders = UploadFileUtils.getHttpHeaders(fileName); // Http �뿤�뜑 �꽕�젙 媛��졇�삤湲�
        String rootPath = UploadFileUtils.getRootPath(fileName, request); // �뾽濡쒕뱶 湲곕낯寃쎈줈 寃쎈줈

        ResponseEntity<byte[]> entity = null;

        // �뙆�씪�뜲�씠�꽣, HttpHeader �쟾�넚
        try (InputStream inputStream = new FileInputStream(rootPath + fileName)) {
            entity = new ResponseEntity<>(IOUtils.toByteArray(inputStream), httpHeaders, HttpStatus.CREATED);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(HttpStatus.BAD_REQUEST);
        }
        return entity;
    }

    // 寃뚯떆湲� 泥⑤� �뙆�씪 紐⑸줉
    @RequestMapping(value = "/list/{number}", method = RequestMethod.GET)
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

    // 寃뚯떆湲� �뙆�씪 �궘�젣 : 寃뚯떆湲� �옉�꽦
    @RequestMapping(value = "/delete", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(String fileName, HttpServletRequest request) {
        ResponseEntity<String> entity = null;

        try {
            UploadFileUtils.deleteFile(fileName, request);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 寃뚯떆湲� �뙆�씪 �궘�젣 : 寃뚯떆湲� �닔�젙
    @RequestMapping(value = "/delete/{number}", method = RequestMethod.POST)
    public ResponseEntity<String> deleteFile(@PathVariable("number") int number, String fileName, HttpServletRequest request) {
        ResponseEntity<String> entity = null;

        try {
            UploadFileUtils.deleteFile(fileName, request);
            fileService.deleteFile(fileName, number);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }

    // 寃뚯떆湲� �뙆�씪 �쟾泥� �궘�젣
    @RequestMapping(value = "/deleteAll", method = RequestMethod.POST)
    public ResponseEntity<String> deleteAllFiles(@RequestParam("files[]") String[] files, HttpServletRequest request) {

        if (files == null || files.length == 0)
            return new ResponseEntity<>("DELETED", HttpStatus.OK);

        ResponseEntity<String> entity = null;

        try {
            for (String fileName : files)
                UploadFileUtils.deleteFile(fileName, request);
            entity = new ResponseEntity<>("DELETED", HttpStatus.OK);
        } catch (Exception e) {
            e.printStackTrace();
            entity = new ResponseEntity<>(e.getMessage(), HttpStatus.BAD_REQUEST);
        }

        return entity;
    }
}