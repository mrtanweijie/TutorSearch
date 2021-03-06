package tan.code.utils;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import org.apache.lucene.document.Document;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.store.SimpleFSDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

public class RelateWords {
	private static final String TEXT_FIELD = "text";

	/**
	 * 
	 * @param words
	 *            候選相関詞列表
	 * @param word
	 *            相關搜索詞的種子詞
	 * @return
	 * @throws IOException
	 * @throws ParseException
	 */
	static public List<String> filterRelated(HashSet<String> words, String word) throws IOException, ParseException {

		RAMDirectory directory = new RAMDirectory();
		//Directory directory = new SimpleFSDirectory(new File("/WEB-INF/data/tutor"));
		IndexWriter indexWriter = new IndexWriter(directory, new IndexWriterConfig(Version.LUCENE_43, new IKAnalyzer(
				true)));
		for (String text : words) {
			Document document = new Document();
			document.add(new TextField(TEXT_FIELD, text, Store.YES));
			indexWriter.addDocument(document);
		}
		indexWriter.close();
		IndexReader indexReader = DirectoryReader.open(directory);
		IndexSearcher indexSearcher = new IndexSearcher(indexReader);
		QueryParser queryParser = new QueryParser(Version.LUCENE_43, TEXT_FIELD, new IKAnalyzer(true));
		Query query = queryParser.parse(word);
		TopDocs td = indexSearcher.search(query, 10);
		ScoreDoc[] sd = td.scoreDocs;
		String relateWords[] = new String[sd.length];
		for (int i = 0; i < sd.length; i++) {
			int z = sd[i].doc;
			Document doc = indexSearcher.doc(z);
			relateWords[i] = doc.get(TEXT_FIELD);
		}
		indexReader.close();
		// ramDirectory.close();
		directory.close();
		
		//System.out.println("搜索内容：" + word);
		//System.out.println("相關搜索匹配結果：");

		//去掉重复的词
		List<String> list=new ArrayList<String>();
		for (int i = 0; i < relateWords.length; i++) {
			if (!list.contains(relateWords[i])) {
				list.add(relateWords[i].toString());
			}
		}
		return list;
	}

}
