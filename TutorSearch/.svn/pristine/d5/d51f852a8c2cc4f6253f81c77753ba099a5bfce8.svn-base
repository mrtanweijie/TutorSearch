package tan.code.service;

import javax.annotation.Resource;

import org.springframework.stereotype.Component;

import tan.code.dao.PTJobDao;
import tan.code.model.PTJop;

@Component
public class PTJobService {
	private PTJobDao ptJobDao;
	private String indexPath = "E://PTJop";

	public boolean add(PTJop ptJop) {
		try {
			ptJobDao.add(indexPath, ptJop);
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}

	public PTJobDao getPtJobDao() {
		return ptJobDao;
	}

	@Resource
	public void setPtJobDao(PTJobDao ptJobDao) {
		this.ptJobDao = ptJobDao;
	}

}
