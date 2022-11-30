<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link href="css/login.css" rel="stylesheet" />
<title>Sketch & Photo</title>
</head>
<body>
<head>
        
               <nav class="navbar navbar-expand-lg navbar-light bg-light">
               <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="main.jsp" style="margin-left:-100px;">Sketch & Photo</a>
                <a class="btn btn-outline-dark btn-sm" type="button" href="main.jsp" style="margin-right:-200px;">메인으로</a>
                </div>
                </nav>
                
         
        		<div class="wrap">
            	  <div class="form-wrap">
                	<div class="button-wrap">
                  	  <div id="btn"></div>     
                    	<button type="button" class="togglebtn" onclick="login()">로그인</button>
                    	<button type="button" class="togglebtn" onclick="register()">회원가입</button>
                	</div>
                
                
                <form id="login" action="loginAction.jsp" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디" name="userID" maxlength="20" >
                    <input type="password" class="input-field" placeholder="비밀번호" name="userPassword" maxlength="20" >
                    <button class="submit" style="margin-top:60px;margin-left:20px;">로그인</button>
                </form>
                
                <form id="register" action="joinAction.jsp" class="input-group">
                    <input type="text" class="input-field" placeholder="아이디" name="userID" maxlength="20">
                    <input type="password" class="input-field" placeholder="비밀번호" name="userPassword" maxlength="20" >
                    <input type="text" class="input-field" placeholder="이름" name="userName" maxlength="20">
                    <input type="email" class="input-field" placeholder="이메일" name="userEmail" maxlength="50">
                    <button class="submit" style="margin-top:60px;margin-left:20px;">회원가입</button>
                </form>
            </div>
        </div>

        
        <script>
            var x = document.getElementById("login");
            var y = document.getElementById("register");
            var z = document.getElementById("btn");
            function login(){
                x.style.left = "50px";
                y.style.left = "450px";
                z.style.left = "0";
            }
            function register(){
                x.style.left = "-400px";
                y.style.left = "50px";
                z.style.left = "120px";
            }
        </script>
       
</body>
</html>