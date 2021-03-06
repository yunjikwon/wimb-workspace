<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.wimb.mypage.model.vo.Inquiry, com.wimb.common.model.vo.PageInfo"%>
<%
	ArrayList<Inquiry> list = (ArrayList<Inquiry>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<style>
  .outer{
  width: 850px;
  height: 550px;
  margin: auto;
  margin-top: 50px;
  }
  /* 수정, 삭제 button */
  #bt{
      background-color: white;
      width: 90px;
      height: 30px;
      margin-bottom: 5px;
      border: 2px solid black;
      border-radius: 5px;
  }
  a { text-decoration:none}
  /* table */
  .table{
    font-size: 10pt;
  }
  #num, #writer, #title, #type, #writeDate, #status{
    border-top: 2px solid black;
  }
  #bt a{
    color: black;
  }
  #num{
    width: 30px;
  }
  #writer{
    width: 50px;
  }
  #title{
    width: 200px;
  }
  #type{
    width: 75px;
  }
  #writeDate{
    width: 80px
  }
  #status{
    width: 20px;
  }

  /* modal button */
  .modal-body button{
    color: white;
    background: rgb(155,213,188);
    border-radius: 5px;
    text-align: center;
    width: 100px;
    height: 40px;
    margin-left: 30px;
  }
  .modal-content{
    width: 350px;
  }
    /* 페이징바 */
    .paging-area button{
        margin-top: 20px;
        border: 0;
    }
    .paging-area{
        /*border: 1px solid coral;*/
        width: 100%;
        text-align: center;
        margin-top: 20px;
        padding-bottom: 50px;     
    }
    .paging-area>button{
        width: 20px;
        height: 20px;
        font-size: 10px;
        border: none;
        border-radius: 5%;
    }
</style>
</head>
<body>
	<%@ include file="../common/myPage.jsp" %>
	
  <div class="outer">
      
    <div class="container" style="width: 500; margin-left: 70px;">
      <h5>1 : 1 문의</h5>
      <hr style="border-color: gray;">
      <table id="report" class="table">
        <thead class="thead-light" align="center">
          <tr>
          	<th id="num">번호</th>
            <th id="writer">작성자</th>
            <th id="title">제목</th>
            <th id="type">문의유형</th>
            <th id="writeDate">작성일</th>
            <th id="status">답변상태</th>
          </tr>
        </thead>
        <tbody>
            <% if(list.isEmpty()) { %>
              <!-- 1:1 문의가  없을 경우 -->
              <tr align="center">
                  <td colspan="6" style="padding-top: 100px;">1 : 1문의 내역이 없습니다.</td>
              </tr>
            <% } else { %>
              <% for(Inquiry i : list) { %>
           	   <!--  1:1 문의가  있는데 답변이 안달린경우 -->
              	<% if(i.getiAnswer().equals("N")){ %>
	                <tr align="center" class="answerTr noneAnswer">
	                  <td><%= i.getiCode() %></td>
	                  <td><%= loginUser.getmName() %></td>
	                  <td><%= i.getiTitle() %></td>
	                  <td><%= i.getiCategory() %></td>
	                  <td><%= i.getiDate() %></td>
	                  <td style="color: rgb(155,213,188);">
	                  	<button id="bt" type="button" class="updatebtn">수정</button>
	                    <button id="bt" type="button" onclick="modify()">삭제</button>
	                  </td>
	                </tr>
	                <tr class="answer" style="display:none; border-bottom: 1px solid #dee2e6;">
	                	<td id="FAQ_List_anw_anw" colspan="6">
	                		<br><%= i.getiContent() %><br><br>
	                	</td>
	                </tr>
                <% } else {%>
                	<!-- 1:1 문의가  있고 답변이 달린경우 -->
	                <tr align="center" class="answerTr" style="border-bottom: 1px solid #dee2e6;">
	                  <td><%= i.getiCode() %></td>
	                  <td><%= loginUser.getmName() %></td>
	                  <td><%= i.getiTitle() %></td>
	                  <td><%= i.getiCategory() %></td>
	                  <td><%= i.getiDate() %></td>
	                  <td style="color: rgb(155,213,188); font-weight:bold; font-size:20px;">답변완료</td>
	                </tr>
	                <tr class="answer" style="display:none; border-bottom: 1px solid #dee2e6;">
	                	<td id="FAQ_List_anw_anw" colspan="6">
	                		<br><%= i.getiContent() %><br><br>
	                	</td>
	                </tr>
	                <tr class="answer" style="display:none; border-bottom: 1px solid #dee2e6;">
	                	<td id="FAQ_List_anw_anw" colspan="6">
	                		<p>
	                			<b>답변내용 : <%= i.getaContent() %><br><br><br>
	                			<b>답변일 : <%= i.getaDate() %>
	                		</p>
	                	</td>
	                </tr>
              	<% } %>
              <% } %>      
			<% } %>
			
           </table>
           
		<div class="paging-area">
            
            <% if(currentPage != 1) { %>
            	<button onclick="location.href='<%= contextPath %>/inquiryList.my?cpage=<%=currentPage-1%>';">&lt;</button>
            <% } %>
            
            <% for(int p=startPage; p<=endPage; p++) { %>
            	<% if(p == currentPage) { %>
            		<button disabled><%= p %></button>
            	<% } else { %>
            		<button onclick="location.href='<%= contextPath %>/inquiryList.my?cpage=<%= p %>';"><%= p %></button>
            	<% } %>
            <% } %>
            
            <% if(currentPage != maxPage) { %>
            <button onclick="location.href='<%= contextPath %>/inquiryList.my?cpage=<%=currentPage+1%>';">&gt;</button>
        	<% } %>
		</div>
	
	</div>

	</div> 
      
      
      
      
      
	<script>
		function modify(){
			location.href = "<%= contextPath %>/myPage.my" // 고객센터 1:1문의로 이동하는 링크걸기
		}
		
	    $(document).ready(function(){
	        $(".answerTr .answer").hide(); 
	        $(".answerTr tr:first-child").show(); //열머리글 보여주기
	        $(".answerTr").click(function(){
	            $(this).siblings(".answer").toggle();
	        });
	    });
		
	    $(function(){
	    	$(".noneAnswer .updatebtn").click(function(){
	    		location.href="<%= contextPath %>/InquiryUpdatForm.my?num=" + $(this).parent().siblings().eq(0).text();
	    	})
	    })
	</script>      
	        
    
</body>
	<footer>
		<%@ include file="../common/footer.jsp" %>
	</footer>
	
	
</html>