<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<!DOCTYPE html>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width", initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>Sketch & Photo</title>
</head>
<body>
	<%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'login.jsp'");
			script.println("</script>");
		}
		int bbsID = 0;
		if (request.getParameter("bbsID") != null ) {
			bbsID = Integer.parseInt(request.getParameter("bbsID"));
		}
		if (bbsID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		Bbs bbs = new BbsDAO().getBbs(bbsID);
		if(!userID.equals(bbs.getUserID())) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('권한이 없습니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
	%>
	 <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp">Sketch & Photo</a>
               
                
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
		<form method="post" action="updateAction.jsp?bbsID=<%= bbsID %>">
			<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
				<thead>
					<tr>
					 	<th colspan="2" style="background-color: #eeeeee; text-align: center;">게시판 글 수정 양식</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><input type="text" class="form-control" placeholder="글 제목" name="bbsTitle" maxlength="50" value="<%= bbs.getBbsTitle() %>"></td>
					</tr>
					<tr>
						<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"><%= bbs.getBbsContent() %></textarea></td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글수정">
		</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
</body>
</html>