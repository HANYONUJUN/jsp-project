<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="user.UserDAO" %>
<%@ page import="user.User" %>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Sketch & Photo</title>
</head>
<body>


<%
		String userID = (String)session.getAttribute("userID");
        String userPassword= (String)request.getParameter("userPassword2");
        String userPassword1= (String)request.getParameter("userPassword3");
        
		if(!userPassword.equals(userPassword1)) //�����ͺ��̽��� �ҷ���
		{
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('�Է��Ͻ� �����ȣ�� ���� �ʽ��ϴ�.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{ 
			UserDAO userDAO = new UserDAO();
			int result = userDAO.update(userID,userPassword);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('��й�ȣ ���� ����.')");
			script.println("location.href = 'myPage.jsp'");
			script.println("</script>");
		}
	
%>
</body>
</html>