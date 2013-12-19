package tan.code.dao;

import org.springframework.stereotype.Component;

import tan.code.model.PTJop;
import tan.code.utils.LuceneHelper;
@Component
public class PTJobDao {
	private LuceneHelper<PTJop> luceneHelper = new LuceneHelper<PTJop>();
	
	// ±£´æ-Ìí¼ÓË÷Òý
	public void add(String indexWriterPath, PTJop ptJop) {
		luceneHelper.add(indexWriterPath, ptJop);
	}
}
