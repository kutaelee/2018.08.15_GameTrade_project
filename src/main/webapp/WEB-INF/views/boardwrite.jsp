<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

</head>
<body>
<form id="boardinsert" method="post" onsubmit="return false;">
	<table class="table table-bordered table-hover" style="width:90%;margin-left: auto; margin-right: auto;">
		<tr>
			<th>제목</th><td> <input type="text" name="title" style="width:100%"></td>
		</tr>
		<tr>
			<td colspan="2" style="height:500px"><textarea style="resize: none;width: 100%;; height:500px"name="content" ></textarea></td>
		</tr>
	</table>
	<input type="hidden" name="tag" value="${tag}">
	<input type="hidden" name="id" value="${member.id}">
	<input type="hidden" name="pw" value="${member.pw}">
	<button class="btn btn-primary" style="float:right;margin-right: 65; font-size: 20;" onclick=boardinsert()>글쓰기</button>
	</form>
</body>
</html>