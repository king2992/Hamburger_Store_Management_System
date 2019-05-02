package kr.ac.kopo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.kopo.dao.FileDao;

@Service
public class FileServiceImpl implements FileService {
 
	@Autowired
	private FileDao fileDao;

	@Override
	public List<String> getArticleFiles(int number) throws Exception {
		return fileDao.getArticleFiles(number);
	}
	
	@Transactional
	@Override
	public void deleteFile(String fileName, int number) throws Exception {
		fileDao.deleteFile(fileName);
		fileDao.updateFileCnt(number);
	}

}
