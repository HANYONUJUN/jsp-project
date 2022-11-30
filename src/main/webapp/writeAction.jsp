<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.io.File" %>
<%@ page import="java.util.Enumeration" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page import="com.oreilly.servlet.MultipartRequest"%>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="bbs" class="bbs.Bbs" scope="page" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
   <%
          BbsDAO bbsDAO= new BbsDAO();
          String directory = application.getRealPath("/bbs/"+bbsDAO.getNext());
          int maxSize= 1024 * 1024 *100;
          String encoding = "UTF-8";
          
          
          File Folder = new File(directory);

          // 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
          if (!Folder.exists()) {
              try{
                  Folder.mkdir(); //폴더 생성합니다.
                  } 
                  catch(Exception e){
                  e.getStackTrace();
                  }
               }
          
          directory=directory+"/";
          
          MultipartRequest multipartRequest 
          = new MultipartRequest(request, directory, maxSize, encoding,
        		  new DefaultFileRenamePolicy());
          
          String fileName = multipartRequest.getOriginalFileName("file");
          fileName="/201944008_project/bbs/"+bbsDAO.getNext()+"/"+fileName;
          bbs.setBbsTitle(multipartRequest.getParameter("bbsTitle"));
          bbs.setBbsContent(multipartRequest.getParameter("bbsContent"));
          bbs.setFileName(fileName);
          bbs.setBbsCategory(multipartRequest.getParameter("bbsCategory"));
          
    %>
	
	<%
	
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		if (userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요.')");
			script.println("location.href = 'join.jsp'");
			script.println("</script>");
		} else {
			if(bbs.getBbsTitle() == null || bbs.getBbsContent() == null) {
						PrintWriter script = response.getWriter();
						script.println("<script>");
						script.println("alert('입력이 안 된 사항이 있습니다.')");
						script.println("history.back()");
						script.println("</script>");
						
					} else {
						int result = bbsDAO.write(bbs.getBbsTitle(), userID, bbs.getBbsContent(),bbs.getFileName(),bbs.getBbsCategory());
						if (result == -1){
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("alert('글쓰기에 실패했습니다.')");
							script.println("history.back()");
							script.println("</script>");
						}
						else {
							PrintWriter script = response.getWriter();
							script.println("<script>");
							script.println("location.href = 'bbs.jsp'");
							script.println("</script>");
						}
					}
		}
%>
</body>
</html>