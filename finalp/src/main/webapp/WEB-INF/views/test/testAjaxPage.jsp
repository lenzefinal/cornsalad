<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>testAjaxPage.jsp</title>
	<script type="text/javascript" src="/finalp/resources/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript">
		$(function(){
			$("#test1").on("click", function(){
				//alert("test1 button click!");
				$.ajax({
					url: "test1.do", 
					data: {name : '지으니', age: 15},
					type: "post", 
					success: function(result){
						if(result === "ok")
							alert("전송 성공");
						else
							alert("전송 실패");
					},
					error: function(request, status, errorData){
						//error 500 : 서버 관련
						//error 400 : 요청 관련
						//200번은 성공
						//http error code 참고할 것
						alert("error code: " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
			});
			
			$("#test2").on("click", function(){
				//test2.do 로 부터 json객체를 리턴 받아
				//div에 출력
				$.ajax({
					url: "test2.do",
					type: "post",
					dataType: "json",
					success: function(data){
						console.log("data : " + data);
						$('#d2').html("번호 : " + data.no
								+ "<br>제목 : " + data.title
								+ "<br>작성자 : " + decodeURIComponent(data.writer)
								//한글로 인코딩
								+ "<br>내용 : " + decodeURIComponent(data.content.replace(/\+/g, " ")));
					},
					error: function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
			});
			
			$("#test3").on("click", function(){
				//컨트롤러로 부터 리스트를 받아서 출력 처리함
				$.ajax({
					url: "test3.do",
					type: "post",
					dataType: "json",
					success: function(data){
						console.log(data); //object라고 출력됨
						//리턴된 하나의 객체를 문자열로 변환
						var jsonStr = JSON.stringify(data);
						//변환된 문자열을 json 객체로 변환
						var json = JSON.parse(jsonStr);
						
						var values = $('#d3').html();
						
						for(var i in json.list){
							values += json.list[i].userId + ", "
								+ json.list[i].userPwd + ", "
								+ decodeURIComponent(json.list[i].userName) + ", "
								+ json.list[i].age + ", "
								+ json.list[i].email + ", "
								+ json.list[i].phone + "<br>";
						}
						
						$("#d3").html(values);
					},
					error: function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+ "message : " + request.responseText + "\n"
								+ "error : " + errorData);
					}
				});
			});
			
			$("#test4").on();
		
			$("#test5").on();
			
			$("#test6").on();
			
			
			
		});//document.ready
	</script>
</head>
<body>
<h1>Spring에서의 Ajax 사용 테스트 페이지</h1>
<ol>
<li>서버 쪽 컨트롤러로 값 보내기</li>
<button id="test1">테스트1</button>
<div id="d1"></div>

<li>컨트롤러에서 리턴하는 JSON 객체 받아서 출력하기</li>
<button id="test2">테스트2</button>
<div id="d2"></div>

<li>컨트롤러에서 리턴하는 JSON 배열 받아서 출력하기</li>
<button id="test3">테스트3</button>
<div id="d3"></div>

<li>컨트롤러에서 맵(Map) 객체를 받아서 출력하기</li>
<button id="test4">테스트4</button>
<div id="d4"></div>

<li>뷰에서 JSON객체를 컨트롤러로 보내기</li>
<button id="test5">테스트5</button>
<div id="d5"></div>

<li>뷰에서 JSON 배열을 컨트롤러로 보내기</li>
<button id="test6">테스트6</button>
<div id="d6"></div>

</ol>
</body>
</html>