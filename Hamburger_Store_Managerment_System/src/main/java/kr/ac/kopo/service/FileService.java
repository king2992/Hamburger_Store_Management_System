package kr.ac.kopo.service;

import java.util.List;

public interface FileService {
  	
    // 파일 목록
    List<String> getArticleFiles(int number) throws Exception;

    // 파일 삭제
    void deleteFile(String fileName, int number) throws Exception;

}
