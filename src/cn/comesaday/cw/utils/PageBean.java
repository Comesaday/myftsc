package cn.comesaday.cw.utils;

import java.util.List;

public class PageBean<T> {
	
	private int pageSize = 10;//每页记录数
	private int currentPage;//当前页码
	private int totalPage;//总页数
	private int totalCount;//总记录数
	@SuppressWarnings("unused")
	private int beginCount;//每页开始记录数
	private List<T> list;
	
	@SuppressWarnings("unused")
	private boolean hasNext;//是否有下一页
	@SuppressWarnings("unused")
	private boolean hasPre;//是否有上一页
	@SuppressWarnings("unused")
	private boolean hasFirst;//是否有首页
	@SuppressWarnings("unused")
	private boolean hasLast;//是否有尾页
	
	public PageBean() {
		// TODO Auto-generated constructor stub
	}
	
	public PageBean(int totalCount , List<T> list) {
		this.totalCount = totalCount;
		this.list = list;
	}

	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	
	public int getTotalPage() {
		if (this.totalCount == 0) {
			this.totalPage = 1;
		} else if(this.totalCount % this.pageSize == 0){
			this.totalPage = this.totalCount / this.pageSize;
		}else {
			this.totalPage = (this.totalCount / this.pageSize) + 1;
		}
		return this.totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getBeginCount() {
		return this.currentPage == 1 ? 0 : (this.currentPage - 1) * this.pageSize;
	}

	public void setBeginCount(int beginCount) {
		this.beginCount = beginCount;
	}
	public List<T> getList() {
		return list;
	}
	public void setList(List<T> list) {
		this.list = list;
	}	
	
	public boolean isHasNext() {
		return this.currentPage < this.totalPage ? true : false;
	}
	public void setHasNext(boolean hasNext) {
		this.hasNext = hasNext;
	}
	
	public boolean isHasPre() {
		return this.currentPage > 1 ? true : false;
	}
	
	public void setHasPre(boolean hasPre) {
		this.hasPre = hasPre;
	}
	public boolean isHasFirst() {
		return this.isHasPre();
	}
	public void setHasFirst(boolean hasFirst) {
		this.hasFirst = hasFirst;
	}
	public boolean isHasLast() {
		return this.isHasNext();
	}
	public void setHasLast(boolean hasLast) {
		this.hasLast = hasLast;
	}
}
