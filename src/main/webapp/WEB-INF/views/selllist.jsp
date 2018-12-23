<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<script>
//검색부분
function tardesearch(){
	alert(searchform.keyword.value);
 	var sendData= "pageNum="+searchform.pageNum.value+"&tag="+searchform.tag.value+"&search="+searchform.search.value+"&keyword="+searchform.keyword.value;
	$.post('tradelist.do', sendData, function(data) {
		$('#contents').html(data);
	});
}
	$(function() {
		$("#pullitem").hide();
		$("#pullprice").hide();
		$("#pullwriter").hide();
	
		
		$("input").on("keydown", function() {

			if ($("#" + this.name).val().length > 20) {
				$("#pull" + this.name).show();
			}
			if ($("#" + this.name).val().length < 20) {
				$("#pull" + this.name).hide();
			}
		});
		$("#submitact").click(
				function() {
					if ($("#item").val().length > 20) {
						alert("아이템명이 너무 길어요!");
					} else if ($("#price").val().length > 20) {
						alert("금액이 너무 길어요!.");
					} else if ($("#writer").val().length > 20) {
						alert("닉네임이 너무 길어요!");
					} else if ($("#item").val() == "" 
							|| $("#price").val() == ""
							|| $("#writer").val() == "")
							{
						alert("모두 입력해주세요");
					}
						
					else {
						sellinsert();
					}

				});
		$("#myselllistbtn").click(function(){
			if('${member}'=="")
			{
				alert("로그인 후 사용가능합니다.");
			}else{
				mytradelist('1','sell');
			}
		});
				
		
		$("#selllistbtn").click(function(){
			tradelist('1','sell');
		});
	
			
				
	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	<h2 class="text-primary">판매 게시판</h2>
	<h3 style="position:absoulute;border:none;border:1px double #337ab7"></h3>
	<form id="sellinsert" method="post" onsubmit="return false;">
	<input type="hidden" name="loc" value="sell">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pw" value="${member.pw}">
	

		<table class="table table-bordered">
		
			<tr>
				<th style="width: 20%;"><input type="text"
					placeholder="아이템명 (최대 20자)" name="item" id="item"
					required="required">
					<p />
					<p style="color: red;" id="pullitem">최대 글자수를 초과했습니다.</p></th>
				<th style="width: 10%;"><input type="text"
					placeholder="금액 (최대 20자)" name="price" id="price"
					required="required">
					<p />
					<p style="color: red;" id="pullprice">최대 글자수를 초과했습니다.</p></th>
				<th style="width: 10%;"><input type="text"
					placeholder="거래할 닉네임 (최대 20자)" name="writer" id="writer"
					required="required">
					<p />
					<p style="color: red;" id="pullwriter">최대 글자수를 초과했습니다.</p></th>
				<th style="width: 10%;">흥정여부 <br /> <input type="radio"
					name="discount" value="O" checked="checked"> O <input
					type="radio" name="discount" value="X"> X
				</th>
			</tr>
			<tr>
			
				<th colspan="4"
					style="border-bottom: 1px solid white; border-left: 1px solid white; border-right: 1px solid white;">
					<button class="btn btn-info" style="float: right;" id="submitact">등록</button>

				</th>
			</tr>

		</table>
		<input type="hidden" name="tag" value="${tag}">
	</form>


	<ul class="nav nav-tabs">
		<li class="nav-item"><a class="nav-link active" href="#" id="selllistbtn">판매글
				목록</a></li>
		<li class="nav-item"><a class="nav-link active" href="#" id="myselllistbtn">내
				판매글 </a></li>
	</ul>

	<table class="table table-bordered table-hover">

		<tr>
			<th style="width: 20%;">아이템명</th>
			<th style="width: 15%;">금액</th>
			<th style="width: 10%;">게임 닉네임</th>
			<th style="width: 15%;">흥정여부</th>
			<th style="width: 15%;">구매신청</th>

		</tr>
		<c:forEach var="list" items="${tl}">
			<tr>
				<td>${list.item}</td>
				<td>${list.price}</td>
				<td>${list.writer}</td>
				<td>${list.discount}</td>
				<td><button class="btn btn-info" id="buyrequest">구매신청</button></td>
			</tr>
		</c:forEach>
	</table>
	<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li><a onclick="tradelist(1,'sell')">
						<span class="glyphicon glyphicon-step-backward"></span>
				</a></li>
				<li><li><a onclick="tradelist(${pb.startPage-1},'sell')">${i}
						<span class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${i!=pb.currentPage }">
					<li><a onclick="tradelist(${i},'sell')">${i}</a></li>
				</c:if>
				<c:if test="${i==pb.currentPage }">
					<li class="active"><a onclick="tradelist(${i},'sell')">${i}</a></li>
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage }">
				<li>
					<a onclick="tradelist(${pb.endPage+1},'sell')">
					
					
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
			</c:if>
			<li><a onclick="tradelist(${pb.totalPage},'sell')">
					<span class="glyphicon glyphicon-step-forward"></span>
			</a></li>
		</ul>
	</div>
	<div style="text-align:center; margin-right:100px">
	<form id='searchform' method='post' onsubmit="return false;">
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="tag" value="sell">
		
		<select name="search">
			<c:forTokens var="sh" items="item,writer"
				 delims="," varStatus="i">
				 <c:if test="${sh!=search}">
				 	<option value="${sh}">${t[i.index]}</option>
				 </c:if>
				<c:if test="${sh==search}">
				 	<option value="${sh}" 
				 		selected="selected">${t[i.index]}</option>
				 </c:if>
			</c:forTokens>
		</select>
		<input type="text" name="keyword">
	
	</form></div>
	<div  style="text-align: center;margin-left: 250px; margin-right:100px"><button class="btn btn-info" style="position:absolute;margin-top: -45px;"id="searchbtn" onclick="tardesearch()">확인</button></div>

</body>
</html>