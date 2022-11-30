<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reply.Reply" %>
<%@ page import="reply.ReplyDAO" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.io.PrintWriter" %>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SSketch & Photo</title>
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
		
		
		int replyID = 0;
		if (request.getParameter("replyID") != null ) {
			replyID = Integer.parseInt(request.getParameter("replyID"));
		}
		
		if (replyID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글입니다.')");
			script.println("location.href = 'bbs.jsp'");
			script.println("</script>");
		}
		
			ReplyDAO replyDAO = new ReplyDAO();
			int result = replyDAO.delete(replyID,userID);
			if (result == 0){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('권한이 없습니다.')");
				script.println("history.back()");
				script.println("</script>");
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('글 삭제가 완료되었습니다.')");
				script.println("location.href = 'bbs.jsp'");
				script.println("</script>");
			}
	%>
	
</body>
</html>