<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script>
$(function(){
	$("#findid").hide();
	$("#findpw").hide();
	$("#find_user_info").hide();
	$("#backbtn").click(function()
			{
				$("#findid").hide();
				$("#findpw").hide();
				$("#find_user_info").hide();
				$("#findidbtn").show();
				$("#findpwbtn").show();
			});

	
	$("#findidbtn").click(function(){
		$("#findidbtn").hide();
		$("#findpwbtn").hide();
		$("#findid").show();
	
	});
	$("#findpwbtn").click(function(){
		$("#findidbtn").hide();
		$("#findpwbtn").hide();
		$("#findpw").show();
	
	});
});
</script>
</head>
<body>
<div class="modal fade" id="modifyform" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="width: 20%">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle" style=margin-bottom:-10px>아이디/비밀번호 찾기</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="font-size:40px">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
				<div id="modify-body">
				<button class="btn btn-danger" id="findidbtn" style="width:45%; margin-top:10px;margin-bottom:10px;margin-right:10px">아이디 찾기</button>
				<button class="btn btn-danger" id="findpwbtn" style="width:45%; margin-top:10px;margin-bottom:10px">비밀번호 찾기</button>
					
					<form id="findid" style="margin-top:10px;text-align: right" >					
							<input type="email" placeholder="이메일" id="find_email"
							name="email" style="width: 100%;"
							class="form-control form-control-sm" required="required">
							<p style="color: red;" id="emailChk"></p>
						<input type="hidden" name="del" value='N'>
										
					
						
					</form>
					<form id="findpw" style="margin-top:10px;text-align: right">	
						<input type="text" placeholder="아이디" id="find_id"
							name="id" style="width: 100%;"
							class="form-control form-control-sm" required="required">
							<p style="color: red;" id="idChk"></p>		
							<input type="email" placeholder="이메일" id="find_email"
							name="email" style="width: 100%;"
							class="form-control form-control-sm" required="required">
							<p style="color: red;" id="emailChk"></p>
						<input type="hidden" name="del" value='N'>
						
					</form>
						
					 <div id="find_user_info">
			
					</div>
				
					
				 
					
				</div>
				</div>
				<div class="modal-footer">
				
					<button type="button" class="btn btn-primary" id="backbtn" >뒤로</button>
					<button type="button" class="btn btn-primary" id="findbtn"> 확인
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>