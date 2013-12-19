package tan.code.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Page implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1955907850247594662L;
	private static int DEFAULT_PAGE_SIZE = 20;// 每页的记录数
	private int pageSize = DEFAULT_PAGE_SIZE;
	private long start;//当前第一条记录在list中的位置
	@SuppressWarnings({ "rawtypes", "unused" })
	private List data;// 当前页存放的记录
	private long totalCount;// 总记录

	// 構造空頁
	@SuppressWarnings("rawtypes")
	public Page() {
		this(0, 0, DEFAULT_PAGE_SIZE, new ArrayList());
	}

	// 默认构造方法
	@SuppressWarnings("rawtypes")
	public Page(int pageSize, long start, long totalCount, List data) {
		super();
		this.pageSize = pageSize;
		this.start = start;
		this.data = data;
		this.totalCount = totalCount;
	}

	// 获取总页数
	public long getTotalPage() {
		if (totalCount % pageSize == 0) {
			return totalCount / pageSize;
		} else {
			return totalCount / pageSize + 1;
		}
	}

	// 获取当前页码,页码从1开始
	public long getCurrentPageNo() {
		return start / pageSize - 1;
	}

	// 该页是否有下一页
	public boolean isHasNextPage() {
		return this.getCurrentPageNo() < this.getTotalPage();
	}

	// 该页是否有上一页
	public boolean isHasPerviousPage() {
		return this.getCurrentPageNo() > 1;
	}

	// 获取任一页第一条数据在数据集的位置
	protected static int getStartOfPage(int pageNo) {
		return getStartOfPage(pageNo, DEFAULT_PAGE_SIZE);
	}

	public static int getStartOfPage(int pageNo, int pageSize) {
		return (pageNo - 1) * pageSize;
	}
}
