package com.input.service.imple;

import java.util.List;

import com.input.dao.RollFileDao;
import com.input.pojo.RollFiles;
import com.input.service.RollFileService;

public class RollFileServiceImple implements RollFileService {
	RollFileDao rollFileDao;

	public void setRollFileDao(RollFileDao rollFileDao) {
		this.rollFileDao = rollFileDao;
	}

	@Override
	public void save(RollFiles rollFile) {
		rollFileDao.save(rollFile);
	}

	@Override
	public List<RollFiles> find(String queryStr) {
		return rollFileDao.find(queryStr);
	}

	@Override
	public void update(RollFiles rollFile) {
		rollFileDao.update(rollFile);
	}

	@Override
	public void delete(String id) {
		rollFileDao.delete(id);
	}
	
	
}
