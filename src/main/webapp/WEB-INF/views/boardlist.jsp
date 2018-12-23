<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script>
function boardsearch(){
	alert(searchform.keyword.value);
 	var sendData= "pageNum="+searchform.pageNum.value+"&tag="+searchform.tag.value+"&search="+searchform.search.value+"&keyword="+searchform.keyword.value;
	$.post('taglist.do', sendData, function(data) {
		$('#contents').html(data);
	});
}
function boardwritepage(tag){
	alert(tag);
	$.post('boardwritepage.do', "tag=" + tag,function(data){
		$('#contents').html(data);
	});
}
</script>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<div>
<h2 style="color:#337ab7;font-size:40px">${tag}</h2>
<h3 style="position:absoulute;border:none;border:1px double #337ab7"></h3>
<br/>
</div>
	<table class="table table-bordered table-hover">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>날짜</th>
			<th>조회수</th>

		</tr>
		<c:forEach var="list" items="${bl}">

			<tr>
				<td style="width: 10%;">${list.no}</td>
				<td style="width: 50%;"><a href="#" onclick="listview(${list.no},'${tag}','1')">${list.title}</a></td>
				<td style="width: 10%;">${list.writer}</td>
				<td style="width: 20%;">${list.reg_date}</td>
				<td style="width: 10%;">${list.hits}</td>
			</tr>
		</c:forEach>

	</table>
		<c:choose>
		<c:when test="${tag=='knowhow' or tag=='help'}">
		<c:if test="${member!=null}">
	<button class="btn btn-primary" style="float:right" onclick="boardwritepage('${tag}')">글쓰기</button>
	</c:if>
	</c:when>
		<c:when test="${member.grade=='5'}">
	<button class="btn btn-primary" style="float:right" onclick="boardwritepage('${tag}')">글쓰기</button>
	</c:when>
	</c:choose>

	
<div align="center">
		<ul class="pagination">
			<c:if test="${pb.startPage > pb.pagePerBlock }">
				<li><a href="#" onclick="taglist(1,'${tag}')">
						<span class="glyphicon glyphicon-step-backward"></span>
				</a></li>
				<li><li><a href="#" onclick="taglist(${pb.startPage-1},'${tag}')">${i}
						<span class="glyphicon glyphicon-triangle-left"></span>
				</a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage}" end="${pb.endPage}">
				<c:if test="${i!=pb.currentPage }">
					<li><a href="#" onclick="taglist(${i},'${tag}')">${i}</a></li>
				</c:if>
				<c:if test="${i==pb.currentPage }">
					<li class="active"><a href="#" onclick="taglist(${i},'${tag}')" >${i}</a></li>
					<input type="hidden" id="listpageNum" value="${i}">
				</c:if>
			</c:forEach>
			<c:if test="${pb.endPage < pb.totalPage }">
				<li>
					<a href="#" onclick="taglist(${pb.endPage+1},'${tag}')">
					
					 
						<span class="glyphicon glyphicon-triangle-right"></span>
				</a></li>
			</c:if>
			<li><a href="#" onclick="taglist(${pb.totalPage},'${tag}')">
					<span class="glyphicon glyphicon-step-forward"></span>
			</a></li>
		</ul>
	</div>
	<div style="text-align:center; margin-right:100px">
	<form id='searchform' method='post' onsubmit="return false;">
		<input type="hidden" name="pageNum" value="1">
		<input type="hidden" name="tag" value=${tag }>
		
	<!--<select name="search">
			<option value="writer">작성자</option>
			<option value="subject">제목</option>
			<option value="content">내용</option>
			<option value="subcon">제목+내용</option>
		</select> -->
		<select name="search">
			<c:forTokens var="sh" items="writer,title,content,subcon"
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
	<div  style="text-align: center;margin-left: 250px; margin-right:100px"><button class="btn btn-info" style="position:absolute;margin-top: -45px;"id="searchbtn" onclick="boardsearch()">확인</button></div>
</body>
</html>