<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
	
	<table class="table table-bordered table-hover">
		<tr>
			<th style="width:10%;">제목</th><td style="width:60%;font-weight:bold">${lv.title}</td>
			<th style="width:10%;">조회수</th>
			<td style="width:10%;font-weight:bold">${lv.hits}</td>
		</tr>
		<tr>
			<td style="width:100%;height:70%;text-align:left;" colspan="4">${lv.content}</td>
		</tr>
		
	</table >
	<div style="text-align:right">
	<h3 style="text-align:right"><a href="#" onclick="taglist(${pageNum},'${lv.tag}')" style="float:left">글 목록</a></h3>
	<c:choose>
	<c:when test="${member.grade=='5' or member.id==lv.writer}">
	<button class="btn btn-primary" style="font-size:20" onclick="boardupdateform(${lv.no},'${lv.tag}','1')">수정</button>
	<button class="btn btn-primary" style="font-size:20" onclick="boarddelete(${lv.no},'${lv.tag}')">삭제</button>
	</c:when>
	
	
	</c:choose>
	</div>
</body>
</html>