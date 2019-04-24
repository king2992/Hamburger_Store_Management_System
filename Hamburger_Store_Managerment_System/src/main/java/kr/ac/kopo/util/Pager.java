package kr.ac.kopo.util;

public class Pager {
   int page = 1;
   final int pager = 10;
   float total;
   //寃��깋 異붽�
   String search;
   String keyword;
   
   public String getHtml() {

       String html = "";
         html += "<div style=\"display:inline;\">";
         int maxPage = (int) Math.ceil( total / pager );
         
         if(page > 1)
        	 html += "<a href='?page=" + (page - 1) + "' class='paginate_button previous '>Previous</a>";         
         
         for(int i=1; i <= maxPage; i++) {
            html += "<span><a aria-controls='example' class='paginate_button' href=\"?page=" + i;
            
            if(search != null && keyword != null) {
               html += "&search=" + search + "&keyword=" + keyword;
            }
            
            html += "\">" + i;
            html += "</a></span>";
         }
         
         if(page < maxPage)
        	 html += "<a href='?page=" + (page + 1) + "'class='paginate_button next' >Next</a>";
         
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


