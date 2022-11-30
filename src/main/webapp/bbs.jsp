<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">

<title>Sketch & Photo</title>
<style type="text/css">
	a, a:hover {
	color: #000000;
	text-decoration: none;
	}	
</style>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		int pageNumber = 1;
		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		String searchCategory = null;
		boolean isSearchCategory = false;
		if(request.getParameter("searchCategory") != null) {
			searchCategory = request.getParameter("searchCategory");
			isSearchCategory = true;
		}
	%>
     <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp" style="margin-left:-100px;">Sketch & Photo</a>
               
                
                 <%
		            if(userID == null) {
	             %>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0 ms-lg-4 ">
                       <div class="position-absolute end-0">
	  						<ul class="nav navbar-nav navbar-left" style="margin-top:-15px">
			 				<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="join.jsp" >로그인</a>	
			 				<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="join.jsp" >회원가입</a>
      						</ul>
    				 	</div>
                    </ul>
                </div>
                   <%
	  			   } else {
					%>
					<div class="position-absolute end-0">
	  					<ul class="nav navbar-nav navbar-left">
	  					<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="myPage.jsp" >마이페이지</a>
   						 <a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" >로그아웃</a>
   					 </ul>
    				</div>
	   
    				<%
						}
					%>
           		 </div>
       		 </nav>
       		 
      <h4 style="text-align:center; margin-top:10px;">자유게시판</h4> 		 
	  <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 3px solid black; margin-top:20px;">
				<thead>
					<tr>
					 	<th style="background-color: #eeeeee; text-align: center;">번호</th>
					 	<th style="backgroun8d-color: #eeeeee; text-align: center;">제목</th>
					 	<th style="background-color: #eeeeee; text-align: center;">작성자</th>
					 	<th style="background-color: #eeeeee; text-align: center;">작성일</th>
					</tr>
				</thead>
				<tbody>
				
				
					<%
						BbsDAO bbsDAO = new BbsDAO();
						ArrayList<Bbs> list = null;
						if(isSearchCategory) {
							list = bbsDAO.getList(pageNumber, searchCategory);
						} else {
							list = bbsDAO.getList(pageNumber);
						}					
						for (int i = 0; i < list.size(); i++) {
							String category = null;
							if(list.get(i).getBbsCategory().equals("photo")) {
								category = "사진";
							} else {
								category = "그림";
							}
					%>
					<tr>
						<td><%= list.get(i).getBbsID() %></td> 
						<td>
						<a href="bbs.jsp?searchCategory=<%=list.get(i).getBbsCategory()%>"><<%=category%>></a>
						<a href="view.jsp?bbsID=<%= list.get(i).getBbsID() %>">
						<%= list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a>
						<td><%= list.get(i).getUserID().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></a></td>
						<td><%= list.get(i).getBbsDate().substring(0, 11) + list.get(i).getBbsDate().substring(11,13) + "시 " + list.get(i).getBbsDate().substring(14,16) + "분" %></td>
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
			
			
			<%
				if(pageNumber != 1) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber - 1%>" class="btn btn btn-outline-dark btn-arrow-left" style="width:100px">이전</a>
			<%
				} if(bbsDAO.nextPage(pageNumber + 1)) {
			%>
				<a href="bbs.jsp?pageNumber=<%=pageNumber + 1%>" class="btn btn-outline-dark btn-arrow-left" style="width:100px">다음</a>
			<%		
				}
			%>
			<a href="write.jsp" class="btn btn-dark" style="width:100px; margin-left:1220px;">글쓰기</a>
		</div>
	</div>
	<!--  검색 부분 -->
    <div class="container">
		<div class="row">
			<form method="post"  action="searchbbs.jsp">
				<table class="pull-right" style="margin-left:-14px">
					<tr>
						<td><select class="form-control" name="searchField" >
								<option value="0">선택</option>
								<option value="bbsTitle">제목</option>
								<option value="userID">작성자</option>
						</select></td>
						<td><input type="text" class="form-control"
							placeholder="검색어 입력" name="searchText" maxlength="100"></td>
						<td><button type="submit" class="btn btn-success">검색</button></td>
					</tr>
				</table>
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>