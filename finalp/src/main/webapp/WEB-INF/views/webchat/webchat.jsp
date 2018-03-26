<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>

<head>

	<meta charset="UTF-8">

    <title>Testing websockets</title>

</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
 deleteroom = function(){
	
	var form = document.createElement("form");
	var room_id = '<c:out value="${webchat.room_id}"/>';
	
	
	form.setAttribute("method","post");
	form.setAttribute("action","/finalp/wcdelete.do");
	
	var input_rid = document.createElement("input");
	
	input_rid.setAttribute("type","hidden");
	input_rid.setAttribute("name","room_id");
	input_rid.setAttribute("value",room_id);
	
	form.appendChild(input_rid);
	document.body.appendChild(form);
	form.submit();
}
 window.onbeforeunload = function (e) {
	 deleteroom();
 }
$(function(){
    //페이지 나갈 때 실행되는 함수 ============================================================================
    $(window).on("beforeunload", function (){
    	deleteroom();
    	outsend();
    });
    $(window).bind("beforeunload", function (){
    	deleteroom();
    });
    $(window).unbind("beforeunload", function (){
    	deleteroom();
    });
   
 });
 
function Enter_Check(){
    // 엔터키의 코드는 13입니다.
	if(event.keyCode == 13){
     send();  // 실행할 이벤트
}
}
document.getElementById("inputMessage").addEventListener("keydown", Enter_Check);


</script>


<body onbeforeunload="deleteroom()" onunload = "deleteroom()" beforeunload="deleteroom()">
	
    <fieldset>
		<h2>${webchat.room_name}</h2>
        <textarea id="messageWindow" rows="10" cols="50" readonly="true"></textarea>
        <br/>
        <input id="inputMessage" type="text" onkeydown="Enter_Check()"/>

        <input type="submit"  value="보내기" onclick="send()" />

    </fieldset>

</body >
	
    <script type="text/javascript">

        var textarea = document.getElementById("messageWindow");

        var webSocket = new WebSocket('ws://localhost:8765/finalp/broadcasting');

        var inputMessage = document.getElementById('inputMessage');

    webSocket.onerror = function(event) {
	  deleteroom();
      onError(event);

    };



    webSocket.onopen = function(event) {

      onOpen(event);

    };



    webSocket.onmessage = function(event) {
      onMessage(event);
    };


	//메시지가 왔을경우
    function onMessage(event) {
		var strArr = event.data.split('/!@');
		var str="";
		for(var a=0;a<strArr.length;a++){
			if(a!=0){
			str+=strArr[a];
			}
		}
			if(strArr[0] == '${webchat.room_reply_id}'){
			   	textarea.value +=  str + "\n";
			}
    }
    function onOpen(event) {

    	inputMessage.value += "${webchat.room_reply_id}/!@"+"${loginUser.member_id} 님이 접속했습니다 "+"\n";

        webSocket.send(inputMessage.value);

        inputMessage.value = "";

    }



    function onError(event) {
	  deleteroom();
      alert(event.data);

    }



    function send() {

        textarea.value += "${loginUser.member_id} : " + inputMessage.value + "\n";
        
		webSocket.send("${webchat.room_reply_id}/!@"+"${loginUser.member_id} : "+inputMessage.value);
		
        inputMessage.value = "";

    }
    function outsend(){
    	inputMessage.value += "${webchat.room_reply_id}/!@"+"${loginUser.member_id} 님이 나갔습니다 "+"\n";
        webSocket.send(inputMessage.value);
        inputMessage.value = "";
   }
  </script>

</html>