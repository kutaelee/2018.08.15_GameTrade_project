<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<html>
<script>
	/* $(function() {
		$("#pullid").hide();
		$("#pullpw").hide();
		$("input").on("keyup", function() {

			if ($("#" + this.name).val().length > 12) {
				$("#pull" + this.name).show();
			}
			if ($("#" + this.name).val().length < 12) {
				$("#pull" + this.name).hide();
			}
		});
		
		$("input").on("keyup",function(){
			if ($("#pw").val()==$("#pwchk").val()) {
				
				$("#pwchkerror").hide();
			}
			else 
				{
				$("#pwchkerror").show();
				}
		});
	}); */
	
	$(function() {
	     /*  $('.modal-body').keypress(function(event){
	         if(event.keyCode==13)
	        	 $('#joinbtn').trigger('click');
	      });
 */	      
	      var chkId = 1;
	      var chkPw = 1;
	      var chkPw2 = 1;
	      var chkEmail = 1;
	    $(".modal-body").on("mouseover",function(){
	    	if(chkId==0&&chkPw==0&&chkPw2==0&&chkEmail==0)
				{
					$joinbtn=$('#joinbtn').attr('disabled', false);
				}
			else{
					$joinbtn=$('#joinbtn').attr('disabled',true);
				}
		 
	    });
	   	$("input").on("blur", function() {
	  			if(chkId==0&&chkPw==0&&chkPw2==0&&chkEmail==0)
	  				{
	  					$joinbtn=$('#joinbtn').attr('disabled', false);
	  				}
	  			else{
	  					$joinbtn=$('#joinbtn').attr('disabled',true);
	  				}
	  		 
	   	});
	        
	      $('#join_id').bind("blur", function() {
	         if (!joininfo.id.value) {
	        	 
	            $('#idChk').html("아이디를 입력하세요<br>");
	       
	            return false;
	         }else if(joininfo.id.value.length < 3 || joininfo.id.value.length > 12 ){
	            $('#idChk').html("아이디는 3글자 이상 12글자 이하입니다<br>");
	       
	            return false;
	         }else if(joininfo.id.value.indexOf(" ") >= 0) {
	               $('#idChk').html("아이디에 공백을 사용할 수 없습니다<br>");
	               
	               return false;
	           }else{
	              $.post('idChk.do', 'id=' + joininfo.id.value, function(data) {
	            	
	                 var str = data;
	                 if(str == "1"){
	                    $('#idChk').html("중복된 아이디입니다<br>");
	                    chkId = 1;
	                 }else{
	                  $('#idChk').html("사용가능한 아이디입니다<br>");
	                  chkId = 0;
	                 } 
	            });
	              
	           }
	         
	      });
	      $('#join_password').bind("blur",function(){
	         if(!joininfo.pw.value){

	        	 chkpw = 1;
	            $('#pwChk').html("비밀번호를 입력하세요<br>");
	            
	            return false;
	         }else if(joininfo.pw.value.length<6 || joininfo.pw.value.length >12){
	            $('#pwChk').html("비밀번호는 6글자 이상 12글자 이하입니다<br>");
	            chkpw = 1;
	            return false;
	         }else {
	            $('#pwChk').html("<br>");
	            chkPw = 0;
	         }
	      });
	      $('#join_password2').bind("blur",function(){
	         if(joininfo.pw.value != joininfo.pw2.value){
	            $('#pwChk2').html("비밀번호와 비밀번호확인이 틀립니다<br>");
	            chkpw2 = 1;
	         }else{ 
	            $('#pwChk2').html("<br>");
	            chkPw2 = 0;
	         }
	      });
	      
	      $('#join_email').bind("blur",function(){
	         var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	         if(!joininfo.email.value.match(regEmail)){
	        	 chkEmail = 1;
	            $('#emailChk').html("이메일을 형식에 맞춰서 입력하세요<br>");
	         }else {
	            $('#emailChk').html("<br>");
	            chkEmail = 0;
	         }
	      });
	     
	   
	   })
	
	//기본 펑션 끝
</script>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<div class="modal fade" id="joinform" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLongTitle" aria-hidden="true">
		<div class="modal-dialog" role="document" style="width: 40%">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">회원가입</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" style="font-size:40px">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form id="joininfo">
						<input type="text" placeholder="아이디" id="join_id" name="id" style="width: 60%;"
							class="form-control form-control-sm" required="required">
						<p style="color: red;" id="idChk"></p>
						
						<p />
						<input type="password" placeholder="비밀번호" id="join_password" name="pw"
							style="width: 60%;" class="form-control form-control-sm"
							required="required">
							<p style="color: red;" id="pwChk"></p>
					
						<p />
						<input type="password" placeholder="비밀번호 확인" id="join_password2" name="pw2"
							style="width: 60%;" class="form-control form-control-sm"
							required="required"> 		
							<p style="color: red;" id="pwChk2"></p>
							<p/>
							<input type="email" placeholder="이메일" id="join_email"
							name="email" style="width: 60%;"
							class="form-control form-control-sm" required="required">
							<p style="color: red;" id="emailChk"></p>
						<input type="hidden" name="del" value=''>
					</form>

				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" id="joinclose">닫기</button>
					<button type="button" class="btn btn-primary" id="joinbtn">가입
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>