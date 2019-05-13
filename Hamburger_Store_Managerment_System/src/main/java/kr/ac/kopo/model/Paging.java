package kr.ac.kopo.model;

public class Paging {
//	첫 페이지를 1 5글 씩 보여지겟다 토탈은 실수형으로 
   private int page = 1;
   private final int pager = 10;
   private float total;
   //검색 추가
   private String search;
   private String keyword;
   
   public String getHtml() {

       String html = "";
//div 스타일 적용 가운데 1 ~         
         html += "<div style=\"display:inline;\">";
//         형변환 (int) total 나누기 페이지 정수형으로 형변환 식 
         int maxPage = (int) Math.ceil( total / pager );
//         반복문 실행 i = 1 첫번째페이지 지정 
         
         if(page > 1)
        	 html += "<a class='pre_p' href='?page=" + (page - 1) + "'>이전</a>";         
         
         for(int i=1; i <= maxPage; i++) {
//            퍼블리싱 시 클래스 이름을 넣고 css 를 하면 적용됨
            html += "<span class='now_p'><a href=\"?page=" + i;
            
            if(search != null && keyword != null) {
               html += "&search=" + search + "&keyword=" + keyword;
            }
            
            html += "\">" + i;
            html += "</a></span>";
         }
         
         if(page < maxPage)
        	 html += "<a class='next_p' href='?page=" + (page + 1) + "'>다음</a>";
         
         html += "</div>";
         
         return html;
   }
   
   public int getOffset() {
      return (page - 1) * pager;
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
   public String getSearch() {
      return search;
   }

   public void setSearch(String search) {
      this.search = search;
   }

   public String getKeyword() {
      return keyword;
   }

   public void setKeyword(String keyword) {
      this.keyword = keyword;
   }
   
   public int getPager() {
	return pager;
   }
} 