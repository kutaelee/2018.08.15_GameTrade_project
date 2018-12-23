<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>

<html>
<script>

	//게시판 리스트를 가져와서 컨텐츠 영역에 보여줍니다
	$(function() {
	
		$.post("banner.do", function(data) {
			$('#contents').html(data);
		});
	
	
	});
	
	function banner(){
		$.post("banner.do", function(data) {
			$('#contents').html(data);
		});

	}
	//제목을 누르면 글번호에 맞는 내용을 가져옵니다
	function listview(no,tag,pageNum) {
	
		$.post("listview.do", "no=" + no+"&pageNum="+pageNum+"&tag=" + tag, function(data) {
			$('#contents').html(data);
		});
	}

	function taglist(pageNum,tag) {
		$.post('taglist.do', "pageNum="+pageNum+"&tag=" + tag, function(data) {
			$('#contents').html(data);
		});
	}
	function boardupdateform(no,tag,pageNum) {
		$.post('boardupdateform.do', "no=" + no+"&pageNum="+pageNum+"&tag=" + tag, function(data) {
			$('#contents').html(data);
		});
	}
	function boardupdate() {
		
		var sendData = $("#boardupdate").serialize();
	
			$.post('boardupdate.do', sendData, function(data) {
				$('#contents').html(data);
			});
	
}
	function boarddelete(no,tag) {
	
			$.post('boarddelete.do', "no="+no+"&tag="+tag, function(data) {
				$('#contents').html(data);
			});
	
}
/* 	function tradelist(pageNum,keyword,tag) {
		$.post('tradelist.do', "tag=" + tag, function(data) {
			$('#contents').html(data);
		});
	} */
	function tradelist(pageNum,tag) {
	
	
		var sendData= "pageNum="+pageNum+"&tag="+tag;
		$.post('tradelist.do', sendData, function(data) {
			$('#contents').html(data);
		});
	}
	function sellinsert() {
	
			var sendData = $("#sellinsert").serialize();
	
				$.post('tradeinsert.do', sendData, function(data) {
					$('#contents').html(data);
				});
		
	}
	function buyinsert() {

		var sendData = $("#buyinsert").serialize();
		
		
			$.post('tradeinsert.do', sendData, function(data) {
				$('#contents').html(data);
			});

}	
	function boardinsert() {
		
		var sendData = $("#boardinsert").serialize();
	
			$.post('boardwrite.do', sendData, function(data) {
				$('#contents').html(data);
			});
	
}
	function mytradelist(pageNum,tag)
{
	
	var sendData="id="+'${member.id}'+"&tag="+tag+"&pageNum="+pageNum;
	
	$.post('mytradelist.do',sendData,function(data){
		$("#contents").html(data);
	});


}

	function mylistdel(no,pageNum,tag)
	{
		alert(tag);
		var sendData="id="+'${member.id}'+"&tag="+tag+"&pageNum="+pageNum;
		$.post('mylistdel.do',"no="+no);
	
		
		$.post('mytradelist.do',sendData,function(data){
			$("#contents").html(data);
		});
	}
	function modifyinfo(){
	
		var sendData=$("#mypage_form").serialize();
			$.ajax({
				
			    type : 'POST',
			    url : 'modifyinfo.do',
			    data : sendData,
			    error : function(error) {
			        alert("변경 실패! 현재 비밀번호 확인 또는 양식에 맞게 입력해주세요.");
			    },
			    success : function(data) {
			        alert("정보를 수정하였습니다 다시 로그인 부탁드립니다.");
			        location.reload();
			        $('#contents').html(data);
			    }
			
			
			});		
	}
		</script>
		
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Main</title>
</head>
<body>
	<div id="container">
	
		<div id="banner" 
			style="width: 100%; height: 20%; text-align:center">
			<div class="col-sm-12"> <a href="#"><img onclick="banner()" src="img/logo.png" onmouseover="this.src='img/logo2.png'" onmouseout="this.src='img/logo.png'" style="width:20%;height:100%;margin-top:20px"></a></div>
			<!-- <div class="col-sm-8"><img src="img/mainbanner.jpg" style="width:60%;height:100%;margin-left:100px;"/></div> -->
			 <div><h3 style="position:absoulute;border:none;border:1px double #337ab7; "></h3></div>
			
		</div>
		<div><h3 style="position:absoulute;border:none;border:1px double #337ab7; "></h3></div>
		
		<div id="lmenu" class="col-sm-2" style="height: 100%; margin-top:20px;">
		
		<ul class="nav nav-pills nav-stacked" style="text-align:center;">
		
		  
  <li role="presentation" class="active" id="mainmenu" onclick="banner()"><a href="#">홈</a></li>
  <li role="presentation" id="notice" onclick="taglist(1,this.id)"> <a href="#" >공지사항</a></li>
  <li role="presentation" id="sell" onclick="tradelist(1,this.id)"><a href="#">판매글</a></li>
  <li role="presentation" id="buy" onclick="tradelist(1,this.id)"><a href="#">구매글</a></li>
  <li role="presentation" id="knowhow" onclick="taglist(1,this.id)"><a href="#">자유글</a></li>
  <li role="presentation" id="event" onclick="taglist(1,this.id)"><a href="#">이벤트</a></li>
  <li role="presentation" id="help" onclick="taglist(1,this.id)"><a href="#">문의 게시판</a></li>

</ul>
			
		</div>
		<div id="contents" class="col-sm-8" style="height: 100%; margin-top:20px;" >
			
		</div>
		<div id="joinbox" ></div>
		<div id="modifybox"></div>
	
		<div id="rmenu" class="col-sm-2" style="height: 100%;"></div>
	</div>


</body>
</html>