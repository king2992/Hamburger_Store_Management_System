package kr.ac.kopo.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.kopo.dao.FileDao;

@Service
public class FileServiceImpl implements FileService {

	@Autowired
	private FileDao fileDao;
	
	@Override
	public List<String> getArticleFiles(int number) throws Exception {
		return fileDao.getArticleFiles(number);
	}

	@Override
	public void deleteFile(String fileName, int number) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("fileName", fileName);
		map.put("number", number);
		
		fileDao.deleteFile(map);
	}

}
