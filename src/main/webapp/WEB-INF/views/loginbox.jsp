<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<script>
$("#loginbtn").click(function(){
	
	var sendData = $("#loginform").serialize();
	$.post('login.do',sendData,function(data) {
	
			alert(data);
			
	});
	$.post('loginbox.do', function(data) {
		$('#rmenu').html(data); //menu(loginbox.jsp)를 가져와서 rmenu에 붙여 넣습니다

		});
	
});
$("#logoutbtn").click(function(){
	$.post('logout.do',function(data){
		location.reload();
	});
	$.post('loginbox.do', function(data) {
		$('#rmenu').html(data); //menu(loginbox.jsp)를 가져와서 rmenu에 붙여 넣습니다
	
		});
	
});
$("#mypagebtn").click(function() {
	$.post('mypage.do',function(data) {
		$('#contents').html(data);
	});
});
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<c:if test="${member==null}">
	<div class="loginbox" style="width:65%;">
		<form id="loginform">
		<br/>
			<input type="text" placeholder="아이디" name="id" style="width:80%;" class="form-control form-control-sm" required="required"><p/>
			<input type="password" placeholder="비밀번호" name="pw"  style="width:80%;" class="form-control form-control-sm" required="required">
			<input type="hidden" name="del" value="x">
		</form>
		
		<button class="btn btn-danger" id="loginbtn">로그인</button>
		<button class="btn btn-danger" data-toggle="modal" data-target="#joinform">회원가입</button><p/>
		<button class="btn btn-success" data-toggle="modal" data-target="#modifyform">ID / 비밀번호 찾기</button>
	</div>
	</c:if>
	<c:if test="${member!=null}">
	<div class="logoutbox" style="width:100%;">
	<br/>
	<p style="font-size:20px;color:white">반갑습니다 <br/>${member.id} 님<p><br/>
	<button class="btn btn-success" id="mypagebtn" style="width:60%; margin-bottom:5px">My Page</button>
	<button class="btn btn-danger" id="logoutbtn">로그아웃</button>
	</div>
	</c:if>
</body>
</html>