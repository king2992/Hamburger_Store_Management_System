package kr.ac.kopo.service;

import java.util.List;

public interface FileService {
	
	List<String> getArticleFiles(int number) throws Exception;

	void deleteFile(String fileName, int number);
}
