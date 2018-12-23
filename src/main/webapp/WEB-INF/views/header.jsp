<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link href="${path}/css/bootstrap.min.css" rel="stylesheet">
<script src="${path}/js/jquery.js"></script>
<script src="${path}/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.js"></script> <!-- 웹소켓 -->
<!-- <script type="text/javascript">
        var sock = null;
        $(document).ready(
        function() {
            sock = new SockJS("/won/echo-ws");
            sock.onopen = function() {}
            sock.onmessage = function(evt) {
                var jsontext = evt.data;
                var contact = JSON.parse(jsontext);
                for (var i = 0; i < contact.length; i++) {
                    $("#chatMessage").append(contact[i].id + " : " + contact[i].pw  + "<br/>");
                }
            }
            sock.onclose = function() {
                sock.send("서버 끝");
            }
        $("#sendMessage").click(
        function() {
            if ($("#message").val() != "") {
                sock.send($("#message").val());
                $("#chatMessage").append("나->" + $("#message").val()+ "<br/>");
                $("#message").val("");
            }
        });
    });
    </script> -->
<style>
.err {
	color: red;
	font-weight: bold;
}

th {
	text-align: center;
}

td {
	text-align: center;
}

.loginbox {
	border: 0.5px solid gray;
	border-radius: 5px;
	padding-left: 10px;
	padding-bottom: 10px;
	margin-top: 20px;
	background-color: 337ab7
}
.logoutbox {
	border: 0.5px solid gray;
	border-radius: 5px;
	padding-left: 10px;
	padding-bottom: 10px;
	margin-top: 20px;
	background-color: 337ab7
}
#mypage_li{
font-size: 18px;
margin-top:25px;
margin-bottom:25px
}

/* All Device */ /* 모든 해상도를 위한 공통 코드를 작성한다. 모든 해상도에서 이 코드가 실행됨.*/





/* Mobile Device */ /* 768px 미만 해상도의 모바일 기기를 위한 코드를 작성한다.

모든 해상도에서 이 코드가 실행된다.

미디어 쿼리를 지원하지 않는 모바일 기기를 위해 미디어 쿼리 구문을 사용하지 않는다. */





/* Tablet & Desktop Device */ @media all and (min-width:768px) { /* 사용자 해상도가 768px 이상일 때 이 코드가 실행됨.

태블릿과 데스크탑의 공통 코드를 작성한다. */
}



/* Tablet Device */ @media all and (min-width:768px) and (max-width:1024px) {
	
	#container{width:100%;}
	#contents{class:col-sm-10;}
	#rmenu{class:col-sm-0;}
	.loginbox{inline-size: max-content;width:100%}
/* 사용자 해상도가 768px 이상이고 1024px 이하일 때 이 코드가 실행됨.

아이패드 또는 비교적 작은 해상도의 랩탑이나 데스크톱에 대응하는 코드를 작성한다. */ }



/* Desktop Device */

@media all and (min-width:1025px) {

	#container{width:100%;}

}




</style>
<script>
$(function(){
	
	$.post('loginbox.do', function(data) {
		$('#rmenu').html(data); //menu(loginbox.jsp)를 가져와서 rmenu에 붙여 넣습니다
	
		});
	
		$.post('joinbox.do', '', function(data) { // joinform.jsp를 콘텐츠영역에 이어붙여넣습니다.

			$("#joinbox").append(data);
			$("#joinbtn").click(function() {//조인폼안의 가입버튼 클릭 시 데이터를 전송합니다.
			
				var sendData = $('#joininfo').serialize();
				$.ajax({
					
				    type : 'POST',
				    url : 'join.do',
				    data : sendData,
				    error : function(error) {
				        alert("가입 실패!");
				    },
				    success : function(data) {
				        alert("가입 성공!");
				        $('#joinclose').trigger('click');
				    	$.post('loginbox.do', function(data) {
				    		$('#rmenu').html(data); //menu(loginbox.jsp)를 가져와서 rmenu에 붙여 넣습니다
				    	
				    		});
				    }
				
				});
				
				/* 	var sendData = $('#joininfo').serialize();
				$.post('join.do', sendData, function(data) {//가입 완료후 메세지를 출력합니다.
				
					alert("가입완료");
					

				}); */

			});
		});

		
		
		$.post('modifybox.do', '', function(data) { // modifybox.jsp를 콘텐츠영역에 이어붙여넣습니다.

			$("#modifybox").html(data);
			$("#findbtn").click(function() {//모디파이폼안의 가입버튼 클릭 시 데이터를 전송합니다.
				$("#findid").hide();
				$("#findpw").hide();
				$("#findidbtn").hide();
				$("#findpwbtn").hide();
				
				if(findid.email.value)
					{
						var sendData = $('#findid').serialize();
					}
				if(findpw.email.value){
					var sendData = $('#findpw').serialize();
				}
				
				$.ajax({
					
				    type : 'POST',
				    url : 'find.do',
				    data : sendData,
				    error : function(error) {
				        alert("조회 실패!");
				    },
				    success : function(data) {
				        alert("조회 성공");
								$("#find_user_info").html("");
				       			$("#find_user_info").prepend(data);
				        		$("#find_user_info").show();
				        	
				        	
				     
				        	
				    }
				
				});
				

			});
		});
	
	
	
	

});//기본 펑션 끝
	
	
</script>