<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Sketch & Photo</title>
</head>
<body>
	   <%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
   %>
   
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp"style="margin-left:-100px;">Sketch & Photo</a>
                            
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
	  						<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="bbs.jsp" >게시판</a>
   						<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" >로그아웃</a>
   					 </ul>
    				</div>
	   
    				<%
						}
					%>
           		 </div>
       		 </nav>
       		 
			<div class="container">
			<div class="row">
			<form method="post" action="writeAction.jsp" encType = "multipart/form-data">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
					 	<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글쓰기 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>
			            <select name="bbsCategory" class="form-select">
			                <option value="sketch">그림</option>
			                <option value="photo">사진</option>
			            </select>
			            </td>
					</tr>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50"></td>
					</tr>
					
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height:350px;">
						 </textarea></td>
					</tr>
					
					<tr>
						<td><input type="file" style="margin-left:-980px;" name="file"></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
		</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>