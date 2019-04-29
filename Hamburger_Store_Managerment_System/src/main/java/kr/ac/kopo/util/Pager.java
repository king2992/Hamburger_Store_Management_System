package kr.ac.kopo.util;

public class Pager {
	int page = 1;
	final int pager = 10;
	float total;
	String keyword;
	String search;
	String theme;
	

	public String getTheme() {
		return theme;
	}

	public void setTheme(String theme) {
		this.theme = theme;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getHtml() {
		String html = "";

		html += "<div>";

		int maxPage = (int) Math.ceil(total / pager);
		for (int i = 1; i <= maxPage; i++) {

			html += "<span><a href=\"?page=" + i;

			html += "\">" + i;
			html += "</a></span>";
		}
		html += "</div>";

		return html;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public float getTotal() {
		return total;
	}

	public void setTotal(float total) {
		this.total = total;
	}

	public int getOffset() {
		return (page - 1) * pager;
	}

	public int getPager() {
		return pager;
	}

}
