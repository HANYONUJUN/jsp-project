<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="reply.Reply" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Sketch & Photo</title>
</head>
<body>
	<% 
		String userID=null;	
		if(session.getAttribute("userID")!=null){
			userID=(String)session.getAttribute("userID");
		}
		
		int bbsID=0;
		if(request.getParameter("bbsID")!=null){
			bbsID=Integer.parseInt(request.getParameter("bbsID"));
		}
		
		int replyID =0;
		if (request.getParameter("replyID") != null ) {
			replyID = Integer.parseInt(request.getParameter("replyID"));
		}
		
		int pageNumber=1;
		// pageNumber는 URL에서 가져온다.
		if(request.getParameter("pageNumber")!=null){
			pageNumber=Integer.parseInt(request.getParameter("pageNumber"));
		}
		
		if(bbsID==0){
			PrintWriter script=response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href='bbs.jsp'");
			script.println("</script>");	
		}
		Bbs bbs=new BbsDAO().getBbs(bbsID);	
		session.setAttribute("bbsID",bbs.getBbsID());	
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
			<table class="table table-striped" style="text-align:center; border :3px solid black; margin-top:50px" > 
				<thead>
					<tr>
						<th colspan="3" style="background-color : #eeeeeee; text-align:center;">게시판 글 보기</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="width:20%;">글 제목 </td>	
						<td colspan="2"><%= bbs.getBbsTitle() %></td>
					</tr>
					<tr>
						<td >작성자 </td>	
						<td colspan="2"><%= bbs.getUserID() %></td>
					</tr>
					<tr>
						<td >작성일자</td>	
						<td colspan="2"><%= bbs.getBbsDate().substring(0,11)+bbs.getBbsDate().substring(11,13)+"시"+bbs.getBbsDate().substring(14,16)+"분" %></td>
					</tr>
					<tr>
						<td>내용</td>
						<td><%= bbs.getBbsContent().replaceAll(" ", "&nbsp;").replaceAll("<","&lt;").replaceAll(">","&gt;").replaceAll("\n", "<br>") %></td>
					</tr>
					<tr>
					    <td>
					      <td colspan="2" style="min-height: 200px; ">
						<img style="height:330px; margin-top:50px" src="<%=bbs.getFileName()%>">
					    </td>
					</tr>
				</tbody>
			</table>
			
			
			<form method="post" action="replyAction.jsp?bbsID=<%= bbsID %>">
				<table class="table table-striped"
					style="text-align: center; border: 1px solid #dddddd">
					<%-- 홀,짝 행 구분 --%>
					<thead>
						<tr>
							<th colspan="3"style="background-color: #eeeeeee; text-align: center;">댓글</th>
						</tr>
					</thead>
					<tbody>
						<%
							ReplyDAO replyDAO=new ReplyDAO();
						    
							ArrayList<Reply> list=replyDAO.getList(bbsID, pageNumber);
							for(int i=list.size()-1;i>=0;i--){
						%>

						<tr>
							<td style="text-align: center;"><%= list.get(i).getReplyContent() %></td>
							<td style="text-align: right;"><%= list.get(i).getUserID() %>
						
							<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="ReplydeleteAction.jsp?replyID=<%=list.get(i).getReplyID()%>" style="text-decoration:none; color:black;">삭제</a>
						
							</td>
						</tr>
					
							<%
								}
							%>
						
						
						<td style="border-bottom:none;" valign="middle"><%= userID %></td>
						<td>
						<textarea type="text" class="form-control"placeholder="댓글을 입력하세요." name="replyContent" maxlength="2048"></textarea>
						</td>
					</tbody>
				</table>
				<td style="text-align:right;"><input type="submit" class="btn-dark" value="댓글입력" style="margin-left:1220px;"></td>
				</form>
				
				
			<div class="d-grid gap-2 d-md-block" style="margin-top:-10px;">
			<a href="bbs.jsp" class="btn btn-outline-dark btn-sm" style="width:100px; margin-left:-10px;">목록</a>
			<%
				if(userID != null && userID.equals(bbs.getUserID())) {
			%>
					<a href="update.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-dark btn-sm" style="width:100px">수정</a>
					<a onclick="return confirm('정말로 삭제하시겠습니까?')" href="deleteAction.jsp?bbsID=<%= bbsID %>" class="btn btn-outline-dark btn-sm" style="width:100px">삭제</a>
			<%
				}
			%>
		
			</div>
		</div>
	</div>

	<script src="https://ajax.aspnetcdn.com/ajax/jQuery/jquery-3.3.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>