<%@page import="user.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<title>Sketch & Photo</title>
 <head>
       
 <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
  <link href="css/styles.css" rel="stylesheet" />
  </head>
   <body>

   <%
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		String userName = null;
		UserDAO userDAO=new UserDAO();
        userName = userDAO.getUser(userID);
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
					<div class="dropdown">
  						<button class="btn btn-secondary dropdown-toggle dropdown-toggle-split" 
  						type="button" data-bs-toggle="dropdown" aria-expanded="false"
  						style="margin-right:-200px">
    					환영합니다 ! <%=userName%> 님
  						</button>
  						<ul class="dropdown-menu">
    					<li><a class="dropdown-item" href="myPage.jsp">마이페이지</a></li>
    					<li><a class="dropdown-item" href="bbs.jsp">게시판</a></li>
    					<li><a class="dropdown-item" href="logoutAction.jsp">로그아웃</a></li>
  						</ul>
					</div>
    				<%
						}
					%>
           		 </div>
       		 </nav>
        <!-- Header-->
        <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
                <div class="text-center text-white">
                    <h1 class="display-4 fw-bolder">사람들과의 그림과 사진을 공유해보세요!</h1>
                    <p>게시판에서 다른 사람들의 작품을 보며 즐겨보세요!</p>
                </div>
            </div>
        </header>
        
        
        
        <!-- Section-->
        <section class="py-5">
        
        <p class="lead fw-normal fw-bolder" style="margin-left:155px">Artwork</p>
        
         <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist" style="margin-left:150px">
  			<li class="nav-item" role="presentation">
    		<button class="nav-link active" id="pills-home-tab" 
    		data-bs-toggle="pill" data-bs-target="#pills-home" 
    		type="button" role="tab" aria-controls="pills-home" aria-selected="true" >Sketch</button>
 		 	</li>
 		 	
 		 	
  			<li class="nav-item" role="presentation">
    		<button class="nav-link" id="pills-profile-tab" 
    		data-bs-toggle="pill" data-bs-target="#pills-profile" 
    		type="button" role="tab" aria-controls="pills-profile" aria-selected="false">Photo</button>
  			</li>
		</ul>
		
		<hr>
		<div class="tab-content" id="pills-tabContent">
  			<div class="tab-pane fade show active" id="pills-home" role="tabpanel" aria-labelledby="pills-home-tab" tabindex="0">
    			<div class="container px-4 px-lg-5 mt-5">
                	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    	<div class="col mb-5">
                        	<div class="card h-100">
						    <img class="card-img-top" src="img/sketch1.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">    
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col mb-5">
                        	<div class="card h-100">
                            <img class="card-img-top" src="img/sketch2.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">      
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    
                    <div class="col mb-5">
                        	<div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="img/sketch3.jpg"/>
                            <div class="card-body p-4">
                                <div class="text-center">
                                </div>
                            </div>
                        </div>
                    </div>
 
 
                    <div class="col mb-5">
                        	<div class="card h-100">
                            <!-- Product image-->
                            <img class="card-img-top" src="img/sketch4.jpg"/>
                            <!-- Product details-->
                            <div class="card-body p-4">
                                <div class="text-center">
                                </div>
                            </div>
                        </div>
                    </div>
                  </div>
               </div>
   			</div>
   			
  			  <div class="tab-pane fade" id="pills-profile" role="tabpanel" aria-labelledby="pills-profile-tab" tabindex="0">
   				<div class="container px-4 px-lg-5 mt-5">
                	<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
                    	<div class="col mb-5">
                        	<div class="card h-100">                           
                            <img class="card-img-top" src="img/photo1.jpg" />                         
                            <div class="card-body p-4">
                                <div class="text-center">                                                         
                                </div>
                            </div>                        
                        </div>
                    </div>
                    
                    <div class="col mb-5">
                        <div class="card h-100">                           
                            <img class="card-img-top" src="img/photo2.jpg" />                       
                            <div class="card-body p-4">
                                <div class="text-center">                              
                                </div>
                            </div>                       
                        </div>
                    </div>
                    
                    
                    <div class="col mb-5">
                        <div class="card h-100">                          
                            <img class="card-img-top" src="img/photo3.jpg"/>                         
                            <div class="card-body p-4">
                                <div class="text-center">                              
                                </div>
                            </div>                         
                        </div>
                    </div>
                   
                   
                    <div class="col mb-5">
                       <div class="card h-100">                     
                            <img class="card-img-top" src="img/photo4.jpg" />                 
                              <div class="card-body p-4">
                                <div class="text-center">                                
                                </div>
                            </div>                       
                        </div>
                    </div>                    
                  </div>
               </div>
            </div>
  		</div>                 
        </section>  
            
        <footer class="py-5 bg-dark">          
        </footer>
 
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="js/scripts.js"></script>
    </body>
</html>