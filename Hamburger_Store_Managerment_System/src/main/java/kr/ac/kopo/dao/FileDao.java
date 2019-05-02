package kr.ac.kopo.dao;

import java.util.List;
 
public interface FileDao {
	
    // 파일 추가
    void addFile(String fullName) throws Exception;

    // 파일 목록
    List<String> getArticleFiles(int number) throws Exception;

    // 파일 삭제
    void deleteFile(String fileName) throws Exception;

    // 파일 전체 삭제
    void deleteFiles(int number) throws Exception;

    // 파일 수정
    void replaceFile(String fileName, int number) throws Exception;

    // 파일 갯수 갱신
    void updateFileCnt(int number) throws Exception;

}
