package tan.code.utils;

import java.io.File;
import java.io.IOException;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.lucene.analysis.Analyzer;
import org.apache.lucene.analysis.TokenStream;
import org.apache.lucene.document.Document;

import org.apache.lucene.document.FloatField;
import org.apache.lucene.document.IntField;
import org.apache.lucene.document.LongField;
import org.apache.lucene.document.StringField;
import org.apache.lucene.document.TextField;
import org.apache.lucene.document.Field.Store;
import org.apache.lucene.index.DirectoryReader;
import org.apache.lucene.index.IndexReader;
import org.apache.lucene.index.IndexWriter;
import org.apache.lucene.index.IndexWriterConfig;
import org.apache.lucene.index.Term;
import org.apache.lucene.queryparser.classic.MultiFieldQueryParser;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.search.BooleanClause.Occur;
import org.apache.lucene.search.BooleanQuery;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.NumericRangeQuery;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.search.TermQuery;
import org.apache.lucene.search.TopDocs;
import org.apache.lucene.search.highlight.Highlighter;
import org.apache.lucene.search.highlight.QueryScorer;
import org.apache.lucene.search.highlight.SimpleHTMLFormatter;
import org.apache.lucene.search.highlight.SimpleSpanFragmenter;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.FSDirectory;
import org.apache.lucene.store.RAMDirectory;
import org.apache.lucene.util.Version;
import org.wltea.analyzer.lucene.IKAnalyzer;

import tan.code.model.Tutor;
import tan.code.model.UserInfo;

public class LuceneHelper<T> {
	public static Directory directory;
	private EntityHelper entityHelper = new EntityHelper();

	/**
	 * 返回IndexWriter
	 * */
	public static IndexWriter getWriter() throws Exception {
		Analyzer analyzer = new IKAnalyzer(true); // 使用ik分詞器
		IndexWriterConfig iwc = new IndexWriterConfig(Version.LUCENE_43, analyzer);
		return new IndexWriter(directory, iwc);
	}

	/**
	 * 添加索引
	 * 
	 * @param indexWriterPath
	 * @param entity
	 */
	public void add(String indexWriterPath, T entity) {
		IndexWriter writer = null;
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		try {
			directory = FSDirectory.open(new File(indexWriterPath));// 打开存放索引的路径
			//directory = new RAMDirectory();
			writer = getWriter();
			Document doc = new Document();
			for (int i = 0; i < list.size(); i++) {
				if ((list.get(i).get("f_value") != null)) {
					if (list.get(i).get("f_type").equals("int") && !list.get(i).get("f_name").toString().equals("id")) {
						doc.add(new IntField(list.get(i).get("f_name").toString(),
								(Integer) list.get(i).get("f_value"), Store.YES));
					} else if (list.get(i).get("f_type").equals("float")) {
						doc.add(new FloatField(list.get(i).get("f_name").toString(),
								(Float) list.get(i).get("f_value"), Store.YES));
					}

					else if (list.get(i).get("f_name").toString().equals("date")) {
						doc.add(new LongField("date", Long.valueOf(list.get(i).get("f_value").toString()), Store.YES));
					} else if (list.get(i).get("f_name").toString().equals("end")) {
						doc.add(new LongField("end", Long.valueOf(list.get(i).get("f_value").toString()), Store.YES));
					} else {
						doc.add(new TextField(list.get(i).get("f_name").toString(), String.valueOf(list.get(i).get(
								"f_value")), Store.YES));
					}
				}

			}
			writer.addDocument(doc);// 添加进写入流里
			writer.forceMerge(1);
			writer.commit();// 提交数据
			System.out.println("添加成功");
		} catch (Exception e) {

			e.printStackTrace();

		} finally {

			if (writer != null) {
				try {
					writer.close();// 关闭流
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}

	/**
	 * 删除索引
	 * 
	 * @param indexPath
	 *            索引路徑
	 * 
	 * @param id
	 */
	public void delete(String indexPath, String id) {
		// TODO Auto-generated method stub
		try {
			directory = FSDirectory.open(new File(indexPath));// 打开文件索引目录
			//directory = new RAMDirectory();
			IndexWriter writer = getWriter();

			IndexReader reader = DirectoryReader.open(directory);// 读取目录
			Query q = new TermQuery(new Term("id", id));
			writer.deleteDocuments(q);// 删除指定ID的Document
			writer.commit();// 提交
			writer.close();// 关闭
			reader.close();// 关闭
			System.out.println("删除id为" + id + "的记录成功");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/***
	 * Tutor简单查询的方法
	 * 
	 * @param indexReadPath
	 *            读取的索引路径
	 * @param filed
	 *            查询的字段类型
	 * @param searchText查询的文本
	 * */
	public List<Tutor> simpleSearch(String indexReadPath, String[] fields, String searchText) {
		List<Tutor> tutors = new ArrayList<Tutor>();
		Tutor tutor;
		try {
			directory = FSDirectory.open(new File(indexReadPath));// 打开索引文件夹
			//directory = new RAMDirectory();
			IndexReader reader = DirectoryReader.open(directory);// 读取目录
			IndexSearcher search = new IndexSearcher(reader);// 初始化查询组件

			// 一次性搜索多个域
			MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser(Version.LUCENE_43, fields,
					new IKAnalyzer(true));
			Query query = multiFieldQueryParser.parse(searchText);

			TopDocs td = search.search(query, 10000);// 获取匹配上元素的一个docid
			ScoreDoc[] sd = td.scoreDocs;// 加载所有的Documnet文档

			System.out.println("本次命中数据:" + sd.length);

			// 自定义标注高亮文本标签
			SimpleHTMLFormatter htmlFormatter = new SimpleHTMLFormatter("<span style=\"font-family: 宋体; color:red\">",
					"</span>");

			// 標題和內容高亮-20131009-twj
			QueryScorer queryScorer = new QueryScorer(query, "title");
			QueryScorer queryScorer2 = new QueryScorer(query, "content");

			Highlighter highlighter = new Highlighter(htmlFormatter, queryScorer);
			highlighter.setTextFragmenter(new SimpleSpanFragmenter(queryScorer));

			Highlighter highlighter2 = new Highlighter(htmlFormatter, queryScorer2);
			highlighter2.setTextFragmenter(new SimpleSpanFragmenter(queryScorer2));

			for (ScoreDoc scoreDoc : sd) {
				Document document = search.doc(scoreDoc.doc);
				String title = document.get("title");
				String content = document.get("content");
				TokenStream tokenStream = new IKAnalyzer(true).tokenStream("title", new StringReader(title.toString()));
				TokenStream tokenStream2 = new IKAnalyzer(true).tokenStream("content",
						new StringReader(content.toString()));

				String title_highlighter = highlighter.getBestFragments(tokenStream, title, 100, "...");
				String content_highlighter = highlighter2.getBestFragments(tokenStream2, content, 100, "...");

				tutor = new Tutor();
				tutor.setId(scoreDoc.doc);// 設置文檔的id爲查找出来的结果的id,查看详情的时候根据id获取全部数据

				if (title_highlighter == null || title_highlighter.equals("")) {
					tutor.setTitle(document.get("title"));
				} else {
					tutor.setTitle(title_highlighter);
				}

				if (content_highlighter == null || content_highlighter.equals("")) {
					tutor.setContent(document.get("content"));
				} else {
					tutor.setContent(content_highlighter);
				}

				// tutor.setContent(document.get("content"));
				// tutor.setContent(content_highlighter);
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

				tutors.add(tutor);
			}
			reader.close();// 关闭资源
			directory.close();// 关闭连接

		} catch (Exception e) {
			e.printStackTrace();
		}
		return tutors;
	}

	/***
	 * Tutor简单查询的方法,無高亮顯示
	 * 
	 * @param indexReadPath
	 *            读取的索引路径
	 * @param filed
	 *            查询的字段类型
	 * @param searchText查询的文本
	 * @throws IOException
	 * @throws ParseException
	 * */
	public List<Tutor> simpleSearchNoHighlighter(String indexReadPath, String[] fields, String searchText)
			throws IOException, ParseException {
		directory = FSDirectory.open(new File(indexReadPath));// 打开索引文件夹
		//directory = new RAMDirectory();
		IndexReader reader = DirectoryReader.open(directory);// 读取目录
		IndexSearcher search = new IndexSearcher(reader);// 初始化查询组件

		MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser(Version.LUCENE_43, fields,
				new IKAnalyzer(true));
		Query query = multiFieldQueryParser.parse(searchText);

		TopDocs td = search.search(query, 10000);// 获取匹配上元素的一个docid

		return Create_tutorlist(search, td);
	}

	/**
	 * 更新文档
	 * 
	 * @param indexPath
	 * @param id
	 * @param entity
	 */
	@SuppressWarnings("unchecked")
	public void updateById(String indexPath, String id, T entity) {
		List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		try {
			directory = FSDirectory.open(new File(indexPath));// 打开文件索引目录
			//directory = new RAMDirectory();
			IndexWriter writer = getWriter();
			Document doc = new Document();
			for (int i = 0; i < list.size(); i++) {
				if ((list.get(i).get("f_value") != null)) {
					if (list.get(i).get("f_type").equals("int")) {
						doc.add(new IntField(list.get(i).get("f_name").toString(),
								(Integer) list.get(i).get("f_value"), Store.YES));
					} else if (list.get(i).get("f_type").equals("float")) {
						doc.add(new FloatField(list.get(i).get("f_name").toString(),
								(Float) list.get(i).get("f_value"), Store.YES));
					} else {
						doc.add(new TextField(list.get(i).get("f_name").toString(), String.valueOf(list.get(i).get(
								"f_value")), Store.YES));
					}
				}
			}

			writer.updateDocument(new Term("id", id), doc);

			writer.commit();
			writer.close();// 关闭
			directory.close();// 关闭
			System.out.println("更新成功!");

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public void updateBrowse(String indexPath, String id, int browse) {
		// List<Map<String, Object>> list = entityHelper.getFiledsInfo(entity);
		try {
			directory = FSDirectory.open(new File(indexPath));// 打开文件索引目录
			//directory = new RAMDirectory();
			IndexWriter writer = getWriter();
			Document doc = new Document();
			doc.add(new StringField("id", id, Store.YES));
			doc.add(new IntField("browse", browse, Store.YES));

			writer.updateDocument(new Term("id", id), doc);

			writer.commit();
			writer.close();// 关闭
			directory.close();// 关闭
			System.out.println("更新成功!");

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public Document getDocumentById(String indexReadPath, int docid) throws IOException {
		directory = FSDirectory.open(new File(indexReadPath));// 打开索引文件夹
		//directory = new RAMDirectory();
		IndexReader reader = DirectoryReader.open(directory);// 读取目录
		return reader.document(docid);

	}

	// 组合查询
	/**
	 * 
	 * @param num
	 *            返回的数据数量
	 * @param indexReadPath
	 * @param province
	 * @param city
	 * @param date
	 * @param subject
	 * @param grade
	 * @return
	 */
	public List<Tutor> booleanQuery(int num, String indexReadPath, String province, String city, String date,
			String subject, String grade) {
		BooleanQuery booleanQuery = Create_booleanQuery(indexReadPath, province, city, date, subject, grade);
		List<Tutor> tutors = new ArrayList<Tutor>();
		try {
			directory = FSDirectory.open(new File(indexReadPath));// 打开索引文件夹
			//directory = new RAMDirectory();
			IndexReader reader = DirectoryReader.open(directory);// 读取目录
			IndexSearcher search = new IndexSearcher(reader);// 初始化查询组件
			TopDocs td = search.search(booleanQuery, num);

			tutors = Create_tutorlist(search, td);
			reader.close();// 关闭资源
			directory.close();// 关闭连接

		} catch (Exception e) {
			// TODO: handle exception
		}

		return tutors;
	}

	/**
	 * 根据发布日期范围查找
	 * 
	 * @param indexReadPath
	 * @param begin
	 *            开始日期
	 * @param end
	 *            搜索结束日期
	 * @return 家教列表
	 */
	public List<Tutor> searchByDateRange(String indexReadPath, long begin, long end) {

		List<Tutor> tutors = new ArrayList<Tutor>();
		try {
			directory = FSDirectory.open(new File(indexReadPath)); // 打开索引文件夹
			//directory = new RAMDirectory();
			IndexReader reader = DirectoryReader.open(directory);// 读取目录
			IndexSearcher search = new IndexSearcher(reader);// 初始化查询组件
			Query query = NumericRangeQuery.newLongRange("date", begin, end, true, true);
			TopDocs td = search.search(query, 1000);
			tutors = Create_tutorlist(search, td);
			reader.close();// 关闭资源
			directory.close();// 关闭连接
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return tutors;
	}

	// 创建BooleanQuery
	public BooleanQuery Create_booleanQuery(String indexReadPath, String province, String city, String date,
			String subject, String grade) {
		BooleanQuery booleanQuery = new BooleanQuery();
		if (province != null) {
			TermQuery p_term = new TermQuery(new Term("province", province));
			booleanQuery.add(p_term, Occur.MUST);
		}
		if (city != null) {
			TermQuery c_term = new TermQuery(new Term("city", city));
			booleanQuery.add(c_term, Occur.MUST);
		}
		if (date != null) {
			TermQuery d_term = new TermQuery(new Term("date", date));
			booleanQuery.add(d_term, Occur.MUST);
		}
		if (subject != null) {
			TermQuery s_term = new TermQuery(new Term("subject", subject));
			booleanQuery.add(s_term, Occur.MUST);
		}
		if (grade != null) {
			TermQuery g_term = new TermQuery(new Term("grade", grade));
			booleanQuery.add(g_term, Occur.MUST);
		}
		return booleanQuery;
	}

	public List<Tutor> Create_tutorlist(IndexSearcher search, TopDocs td) throws IOException {
		List<Tutor> tutors = new ArrayList<Tutor>();
		Tutor tutor;
		ScoreDoc[] sd = td.scoreDocs;// 加载所有的Documnet文档

		System.out.println("本次命中数据:" + sd.length);

		for (ScoreDoc scoreDoc : sd) {
			Document document = search.doc(scoreDoc.doc);

			tutor = new Tutor();
			tutor.setId(scoreDoc.doc);// 設置文檔的id爲查找出来的结果的id,查看详情的时候根据id获取全部数据
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

			tutors.add(tutor);
		}
		return tutors;

	}

	public List<UserInfo> simpleSearchUserInfo(String indexReadPath, String[] fields, String searchText) {
		List<UserInfo> userInfos = new ArrayList<UserInfo>();
		UserInfo userInfo;
		try {
			directory = FSDirectory.open(new File(indexReadPath));// 打开索引文件夹
			//directory = new RAMDirectory();
			IndexReader reader = DirectoryReader.open(directory);// 读取目录
			IndexSearcher search = new IndexSearcher(reader);// 初始化查询组件

			// 一次性搜索多个域
			MultiFieldQueryParser multiFieldQueryParser = new MultiFieldQueryParser(Version.LUCENE_43, fields,
					new IKAnalyzer(true));
			Query query = multiFieldQueryParser.parse(searchText);

			TopDocs td = search.search(query, 10000);// 获取匹配上元素的一个docid
			ScoreDoc[] sd = td.scoreDocs;// 加载所有的Documnet文档

			System.out.println("本次命中数据:" + sd.length);

			for (ScoreDoc scoreDoc : sd) {
				Document document = search.doc(scoreDoc.doc);
				userInfo=new UserInfo();
				userInfo.setUniversity(document.get("university"));
				userInfo.setMajor(document.get("major"));
				userInfo.setAcademic(document.get("academic"));
				userInfo.setRealname(document.get("realname"));
				userInfo.setGrade(document.get("grade"));
				userInfo.setU_id(Integer.valueOf(document.get("u_id")));
				
				userInfos.add(userInfo);
			}
			
			reader.close();// 关闭资源
			directory.close();// 关闭连接

		} catch (Exception e) {
			e.printStackTrace();
		}
		return userInfos;
	}

}
