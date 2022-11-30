<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList"%>
<%@ page import="user.UserDAO" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<jsp:useBean id="user" class="user.User" scope="page" />
<jsp:setProperty name="user" property="userID" />
<link href="css/profile.css" rel="stylesheet" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sketch & Photo</title>
</head>
<body>
    <%! 
        public Connection conn;
	    public ResultSet rs;
	%>
	    
	    
	<%
	   
	   String userID = (String)session.getAttribute("userID");
	  
		try {
			String dbURL = "jdbc:mysql://localhost:3306/userdb?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "root";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
			System.out.println(e);
		}
		ArrayList<Bbs> list = new ArrayList<>();
		String SQL = "SELECT * FROM BBS WHERE userID = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Bbs bbs = new Bbs();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setUserID(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setBbsContent(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				bbs.setFileName(rs.getString(7));
				bbs.setBbsCategory(rs.getString(8));
				list.add(bbs);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}

	%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp" style="margin-left:-100px;">Sketch & Photo</a>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    
					<div class="position-absolute end-0">
	  					<ul class="nav navbar-nav navbar-left">
	  					<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="main.jsp" >메인으로</a>
	  					<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="bbs.jsp" >게시판</a>
   						<a class="btn btn-outline-dark me-md-2 btn-sm" type="button" href="logoutAction.jsp" >로그아웃</a>
   					 </ul>
    				</div>
           		 </div>
       		 </nav>
			<div class="container">
    		 <div class="row">
        	  <div class="col-md-12">
                <div class="fb-profile-block">
                 <div class="fb-profile-block-thumb cover-container"></div>
                  <div class="profile-img">
                    <a href="#">
                       <img src="img/profile.png" alt="" title="">        
                    </a>
                </div>
                <div class="profile-name">
                    <h2>
   					<%
   				
  	 					String userName = null;
  	 					int pageNumber=1;
  	 	
						if (session.getAttribute("userID") != null) {
						  userID = (String) session.getAttribute("userID");
						  UserDAO userDAO=new UserDAO();
       		              userName = userDAO.getUser(userID);
					%>
	
						<%=userName%>
	
						<%} else{%>
    					<%}%>             
                    </h2>
                </div>
                
                <div class="fb-profile-block-menu">
                    <div class="block-menu">
                        <ul>
                          <a class="btn btn-outline-dark btn-sm" type="button" href="pwdupdate.jsp" style="margin-top:3.2px;" >비밀번호 변경</a>
                        </ul>
                    </div>
                </div>    
            </div>
        </div>
    </div>
</div>

      <div class="container">
		<div class="row">
			<table class="table table-striped" style="text-align: center; border: 3px solid black; margin-top:20px;">
				<thead>
					<tr>
					
					 	<th style="background-color: #eeeeee; text-align: center;">제목</th>
					 	<th style="background-color: #eeeeee; text-align: center;" width="150">작성자</th>
					</tr>
				</thead>
				<tbody>
		
					<%
						
						for (int i = 0; i < list.size(); i++) {
					%>
					<tr>
						<td><a href="view.jsp?bbsID=<%=list.get(i).getBbsID()%>" style="text-decoration:none; color:black;"><%=list.get(i).getBbsTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;")
						.replaceAll(">", "&gt;").replaceAll("\n", "<br>")%></a></td>
						<td witdh="100"><%= list.get(i).getUserID() %></td>						
					</tr>
					<%
						}
					%>
				</tbody>
			</table>
	     </div>
	    </div>	
</body>
</html>