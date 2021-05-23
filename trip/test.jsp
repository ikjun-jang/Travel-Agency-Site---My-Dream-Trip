<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#next").on('click',function(){
			var $a = $("input[name='score']");
			console.log($a);
			console.dir($a);
			for(var i = 0; i<5; i++){
				if($a[i].checked){
					$(form).submit();
				}
			}
			alert("평점을 선택해주세요.");			
		});
});

</script>
</head>
<body>
<table>
<tr>
			<td><input type="radio" name="score" id="" value="1"/>최악이에요</td>
			<td><input type="radio" name="score" id="" value="2"/>그저 그래요</td>
			<td><input type="radio" name="score" id="" value="3"/>평범해요</td>
			<td><input type="radio" name="score" id="" value="4"/>괜찮았어요</td>
			<td><input type="radio" name="score" id="" value="5"/>정말 좋아요</td>
			<td colspan="2"><input type="button" id="next" value="평가하기" />
</tr>
</table>
</body>
</html>