package com.woniu.pojo;


public class PageBean {
	//当前页
	private Integer nowPage = 1;
	//每页几条
	private Integer pageRow = 5;
	//一共多少条
	private Integer countRow;
	//一共多少页
	private Integer countPage;

	public Integer getNowPage() {
		return nowPage;
	}

	public void setNowPage(Integer nowPage) {
		this.nowPage = nowPage;
	}

	public Integer getPageRow() {
		return pageRow;
	}

	public void setPageRow(Integer pageRow) {
		this.pageRow = pageRow;
	}

	public Integer getCountRow() {
		return countRow;
	}

	public void setCountRow(Integer countRow) {
		this.countRow = countRow;
	}

	public Integer getCountPage() {
		return countPage;
	}

	public void setCountPage(Integer countPage) {
		this.countPage = countPage;
	}

	@Override
	public String toString() {
		return "PageBean{" +
				"nowPage=" + nowPage +
				", pageRow=" + pageRow +
				", countRow=" + countRow +
				", countPage=" + countPage +
				'}';
	}


}
