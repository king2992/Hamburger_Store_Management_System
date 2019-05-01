package kr.ac.kopo.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileDaoImpl implements FileDao {

	@Autowired
	private SqlSession db;

	@Override
	public void addFile(String fileName) throws Exception {
		System.out.println("야야야야ㅑ야야야ㅑ야야야야야야야야야ㅑ야야야야야야야야");
		db.insert("file.addFile",fileName);
	}

	@Override
	public List<String> getArticleFiles(int number) throws Exception {
		return db.selectList("file.getArticleFiles",number);
	}

	@Override
	public void deleteFile(String fileName) throws Exception {
		db.delete("file.deleteFile",fileName);
	}

	@Override
	public void deleteFiles(int number) throws Exception {
		db.delete("file.deleteFiles",number);
	}

	@Override
	public void replaceFile(String fileName, int number) throws Exception {
		Map<String,Object> map = new HashMap<>();
		map.put("fileName",fileName);
		map.put("number", number);
		db.insert("file.replaceFile",map);
	}

	@Override
	public void updateFileCnt(int number) throws Exception {
		db.update("file.updateFileCnt",number);
	}

}
