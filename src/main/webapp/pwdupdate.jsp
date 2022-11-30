<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<meta charset="EUC-KR">
<link href="css/login.css" rel="stylesheet" />
<title>Sketch & Photo</title>
</head>
<body style=" background: linear-gradient(to right bottom, white, black); height:1px;">

		     	<%
		     		String userID = null;
					if (session.getAttribute("userID") != null) {
						userID = (String) session.getAttribute("userID");
					}  
				
			  		String userPassword= null;
			 	 	if (session.getAttribute("userPassword") != null) {
			 			userPassword = (String) session.getAttribute("userPassword");
					} 
		     	%>
		     	
		     	
		    	<nav class="navbar navbar-expand-lg navbar-light bg-light">
            	<div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp" style="margin-left:-100px;">Sketch & Photo</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                       
                 <%
		            if(userID != null) {
	             %> 
	             
				 <div class="position-absolute end-0">
	  					<ul class="nav navbar-nav navbar-left">
	  					<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="main.jsp" >메인으로</a>
	  					<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="bbs.jsp" >게시판</a>
   						<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" >로그아웃</a>
   					 	</ul>
    			    </div>
           		 </div>
       		  </nav>
		       <%
	  			   } else {
			   %>
		         
               <%
					}
			   %>
		     
		         
				<form action="pwdupdateAction.jsp" method="post">		
				<div class="card" style="width: 30rem; height:600px ; margin-left:610px; margin-top:80px; text-align: center; border:5px solid black; border-radius:50px;">
  					<div class="card-body">
    				<h3 class="card-title">비밀번호 변경</h3><br><br>
     				<input type="password" class="input-field" id="pass" placeholder="현재 비밀번호" name="userPassword" maxlength="20"  required="required"><br>
     				<input type="password" class="input-field" id="pass" placeholder="새 비밀번호" name="userPassword2" maxlength="20" required="required"><br>
     				<input type="password" class="input-field" id="pass" placeholder="새 비밀번호 확인" name="userPassword3" maxlength="20" required="required">
     			    <button class="submit" style="margin-top:60px;margin-left:20px;">변경</button>
 			 	</div>
			</div>   	 
		</form>
<script src="js/scripts.js"></script>
</body>
</html>