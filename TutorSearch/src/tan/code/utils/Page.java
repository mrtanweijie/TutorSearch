package tan.code.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Page implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1955907850247594662L;
	private static int DEFAULT_PAGE_SIZE = 20;// ÿҳ�ļ�¼��
	private int pageSize = DEFAULT_PAGE_SIZE;
	private long start;//��ǰ��һ����¼��list�е�λ��
	@SuppressWarnings({ "rawtypes", "unused" })
	private List data;// ��ǰҳ��ŵļ�¼
	private long totalCount;// �ܼ�¼

	// ������
	@SuppressWarnings("rawtypes")
	public Page() {
		this(0, 0, DEFAULT_PAGE_SIZE, new ArrayList());
	}

	// Ĭ�Ϲ��췽��
	@SuppressWarnings("rawtypes")
	public Page(int pageSize, long start, long totalCount, List data) {
		super();
		this.pageSize = pageSize;
		this.start = start;
		this.data = data;
		this.totalCount = totalCount;
	}

	// ��ȡ��ҳ��
	public long getTotalPage() {
		if (totalCount % pageSize == 0) {
			return totalCount / pageSize;
		} else {
			return totalCount / pageSize + 1;
		}
	}

	// ��ȡ��ǰҳ��,ҳ���1��ʼ
	public long getCurrentPageNo() {
		return start / pageSize - 1;
	}

	// ��ҳ�Ƿ�����һҳ
	public boolean isHasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPage();
	}

	// ��ҳ�Ƿ�����һҳ
	public boolean isHasPerviousPage() {
		return this.getCurrentPageNo() > 1;
	}

	// ��ȡ��һҳ��һ�����������ݼ���λ��
	protected static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}
}
