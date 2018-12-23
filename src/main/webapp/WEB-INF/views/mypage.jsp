<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<script>
$(function() {
	 var chkPw = 1;
     var chkPw2 = 0;
     var chkEmail = 0;
     var regEmail = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
     $('#pwChk2').html("수정을 원하지 않으시면 비워두시면 됩니다.<br>");
	 $('#emailChk').html("수정을 원하지 않으시면 비워두시면 됩니다.<br>");
	 $("#contents").on("mouseover",function(){
		 if(mypage_form.imsi.value)
			 {
				 if(mypage_form.imsi.value.length<6 || mypage_form.imsi.value.length >12){
		  		   $('#pwChk2').html("변경할 비밀번호는 6글자 이상 12글자 이하입니다<br>");
		    		 chkPw2 = 1;
		  		
		 		}
			 }else 
				 { $('#pwChk2').html("수정을 원하지 않으시면 비워두시면 됩니다.<br>");
				 	chkPw2=0;
				 }
		 
		 if(mypage_form.email.value)
			 {
			  if(!mypage_form.email.value.match(regEmail)){		   	
			       $('#emailChk').html("이메일을 형식에 맞춰서 입력하세요<br>");
			       chkEmail = 1;
			 
			  }
			  else    
				  { 				 
				  chkEmail = 0;
				  }
			 }
	    	if(chkPw==0&&chkPw2==0&&chkEmail==0)
				{
					$joinbtn=$('#mypage_modify_btn').attr('disabled', false);
				}
			else{
					$joinbtn=$('#mypage_modify_btn').attr('disabled',true);
				}
		 
	    });
$('#mypage_pw').bind("blur",function(){
    if(!mypage_form.pw.value){

   	 chkpw = 1;
       $('#pwChk').html("현재 비밀번호를 입력하세요<br>");
       
       return false;
    }else if(mypage_form.pw.value.length<6 || mypage_form.pw.value.length >12){
       $('#pwChk').html("비밀번호는 6글자 이상 12글자 이하입니다<br>");
       chkpw = 1;
       return false;
    }else {
       $('#pwChk').html("OK!");
       chkPw = 0;
    }
    

 	});
$('#mypage_imsi').bind("blur",function(){
 if(!mypage_form.imsi.value)
	 {
		 $('#pwChk2').html("수정을 원하지 않으시면 비워두시면 됩니다.<br>");
		 return false;
	 }
else if(mypage_form.imsi.value.length<6 || mypage_form.imsi.value.length >12){
     $('#pwChk2').html("변경할 비밀번호는 6글자 이상 12글자 이하입니다<br>");
     chkPw2 = 1;
     return false;
  }else {
     $('#pwChk2').html("OK!");
     chkPw2 = 0;
  }
	});
	$('#mypage_email').bind("blur",function(){
    
    if(!mypage_form.email.value)
	 { 
    		chkEmail = 0;
		 $('#emailChk').html("수정을 원하지 않으시면 비워두시면 됩니다.<br>");
		 return false;
	 }
    else if(!mypage_form.email.value.match(regEmail)){
   	 chkEmail = 1;
       $('#emailChk').html("이메일을 형식에 맞춰서 입력하세요<br>");
       return false;
    }else {
       $('#emailChk').html("OK!");
       chkEmail = 0;
    }
 });
 }); //기본펑션 끝
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<h1 style="text-align:center;color:#337ab7">My Page</h1>
<div class="col-sm-3"></div>
<div class="col-sm-6">
	<div><h3 style="position:absoulute;border:none;border:1px double #337ab7; "></h3></div>
	<form id="mypage_form">
	<ul id="mypage_ul">
	<li><p style="color: blue;">양식에 맞게 입력하지 않으시면 확인버튼이 활성화 되지 않습니다.</p></li>
	<li><p style="color: blue">입력한 후에도 확인버튼이 활성화 되지 않으시면 흰 배경을 한번 클릭해주세요!</p></li>
	
	<li id="mypage_li">아이디: &nbsp; ${member.id} <input type="hidden" value='${member.id}'>
	</li>
	
	<li id="mypage_li">현재 비밀번호<p/> <input type="password" name="pw" id="mypage_pw">
	<p style="color: red;" id="pwChk"></p></li>
	<li id="mypage_li">변경할 비밀번호<p/> <input type="password" name="imsi"id="mypage_imsi">
	<p style="color: red;" id="pwChk2"></p></li>
	<li id="mypage_li">이메일<p/> <input type="email" name="email" id="mypage_email">
	<p style="color: red;" id="emailChk"></p></li>
	
	
	</ul>
	</form>
	<div><h3 style="position:absoulute;border:none;border:1px double #337ab7; "></h3></div>
	<button class="btn btn-primary" id="mypage_modify_btn" onclick="modifyinfo()" style="float:right;margin-top:30px">확인</button>
</div>
<div class="col-sm-3"></div>
</body>
</html>