package tan.code.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import javax.annotation.Resource;

import org.apache.lucene.document.Document;
import org.apache.lucene.queryparser.classic.ParseException;
import org.springframework.stereotype.Component;

import tan.code.dao.TutorDao;
import tan.code.model.Tutor;

@Component
public class TutorService {
	private TutorDao tutorDao;

	public TutorDao getTutorDao() {
		return tutorDao;
	}

	@Resource
	public void setTutorDao(TutorDao tutorDao) {
		this.tutorDao = tutorDao;
	}

	
	String path=System.getenv("MOPAAS_FILESYSTEM4321_LOCAL_PATH");
	String name=System.getenv("MOPAAS_FILESYSTEM4321_NAME");
	String fullPath=path+"/"+name;
	private String indexPath = fullPath;
	
	public void add(Tutor tutor) {
		tutorDao.add(indexPath, tutor);
	}

	public List<Tutor> search(String searchText) {

		return tutorDao.search(indexPath, searchText);
	}
	
	public List<String> relatewords(HashSet<String> words, String word){
		List<String> list=new ArrayList<String>();
		try {
			list= tutorDao.relatewords(words, word);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	public Tutor getTutorByDocmentId(int docid) {
		Tutor tutor = null;
		try {
			Document document=tutorDao.getDocumentById(indexPath, docid);
			tutor=new Tutor();
			tutor.setTitle(document.get("title"));
			tutor.setContent(document.get("content"));
			tutor.setReq_major(document.get("req_major"));
			tutor.setReq_sex(document.get("req_sex"));
			tutor.setPay(Float.valueOf(document.get("pay")));
			tutor.setPatriarch(document.get("patriarch"));
			tutor.setPhone(document.get("phone"));

			tutor.setGrade(document.get("grade"));
			tutor.setSubject(document.get("subject"));
			tutor.setBrowse(Integer.valueOf(document.get("browse")));

			tutor.setProvince(document.get("province"));
			tutor.setCity(document.get("city"));
			tutor.setRegion(document.get("region"));

			tutor.setDate(document.get("date"));
			tutor.setEnd(document.get("end"));
			tutor.setOthers(document.get("others"));
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return tutor;
	}
	
	public void update(String id,Tutor tutor) {
		tutorDao.update(indexPath, id, tutor);
	}
	public void updateBrowse(String id,int browse) {
		tutorDao.updateBrowse(indexPath, id, browse);
	}
	public List<Tutor> searchByCity(int num,String city){
		//return null;
		return tutorDao.searchByCity(num,indexPath, city);
	}
	
	public List<Tutor> searchByDateRange(long begin, long end) {
		return tutorDao.searchByDateRange(indexPath, begin, end);
	}
}
