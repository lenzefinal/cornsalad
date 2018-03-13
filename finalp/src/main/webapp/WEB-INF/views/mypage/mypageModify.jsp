<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
</head>
<body class="skin_main">
<c:import url="../header.jsp"/>
<c:import url="mypageIndexHeader.jsp"/>
<script>
$(function(){
	var fileTarget = $('.filebox .upload-hidden'); 
    
    fileTarget.on('change', function(){ // 값이 변경되면 
       if(window.FileReader){ // modern browser 
          var filename = $(this)[0].files[0].name; 
       } 
       else { // old IE 
          var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출 
       } 
    
       // 추출한 파일명 삽입 
       $(this).siblings('.upload-name').val(filename); 
    });
    
    
    
    //preview image 
    var imgTarget = $('.preview-image .upload-hidden'); 
    
    imgTarget.on('change', function(){ 
       var parent = $(this).parent(); 
       parent.children('.upload-display').remove(); 
       
       if(window.FileReader){ 
          //image 파일만 
          /* if (!$(this)[0].files[0].type.match(/image\//)) return;  */
          
          var reader = new FileReader(); 
          reader.onload = function(e){ 
             var src = e.target.result; 
             parent.prepend('<div class="upload-display"><img src="'
                   + src + '" class="upload-thumb"></div>'); 
          } 
          reader.readAsDataURL($(this)[0].files[0]); 
       } 
       else { 
          $(this)[0].select(); 
          $(this)[0].blur(); 
          
          var imgSrc = document.selection.createRange().text; 
          parent.prepend('<div class="upload-display"><img class="upload-thumb"></div>'); 
          
          var img = $(this).siblings('.upload-display').find('img'); 
          img[0].style.filter = "progid:DXImageTransform.Microsoft.AlphaImageLoader(enable='true',sizingMethod='scale',src=\""
                + imgSrc + "\")"; 
       } 
    });
});

</script>
<style type="text/css">
	.modify{
		margin-left:6%;
		width:95px;
		height:40px;
		text-align:center;
	    background-color: #f5f6f8;
	    color: gray;
	    border: 2px solid #F7D358; 
	    -webkit-transition-duration: 0.4s;
   		transition-duration: 0.4s;
   		font-size:14px;
   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
		'Apple SD GothicNeo', Sans-serif;
   		line-hieght:10px;
   		cursor:default;
	}
	.cancel{		
		width:95px;
		height:40px;
		text-align:center;
	    background-color: #f5f6f8;
	    color: gray;
	    border: 2px solid red; 
	    -webkit-transition-duration: 0.4s;
   		transition-duration: 0.4s;
   		font-size:14px;
   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
		'Apple SD GothicNeo', Sans-serif;
   		line-hieght:10px;
    }
   
    .cancel:hover {
    	color:white;
    	background-color:red;	
    }
    dl dt{
    	font-size:12px;
    	margin-bottom:2%;
    }
    dl dd{
  		margin-bottom:5%;
  		height:20px;
    }
   /*  input{
    	width:200px;
    	height:20px;
    } */
    img.profile {
    	border-radius:100%; 
    	width:255px;
    	height:255px;
    }    
    
	/* 업로드 버튼 ------------------------------------------------------------*/
	.filebox {
		margin-left:3%;
	}
   .filebox input[type="file"] { 
      position: absolute; 
      width: 1px; 
      height: 1px; 
      padding: 0; 
      margin: -1px; 
      overflow: hidden; 
      clip:rect(0,0,0,0); 
      border: 0; 
   } 
   .filebox label { 
      display: inline-block; 
      padding: .5em .75em; 
      color: #999; 
      font-size: inherit; 
      line-height: normal; 
      vertical-align: middle; 
      background-color: #fdfdfd; 
      cursor: pointer; 
      border: 1px solid #ebebeb; 
      border-bottom-color: #e2e2e2; 
      border-radius: .25em; 
      margin-top: 8px;
   } 
   /* named upload */ 
   .filebox .upload-name { 
      display: inline-block; 
      padding: .5em .75em; /* label의 패딩값과 일치 */ 
      font-size: inherit; 
      font-family: inherit; 
      line-height: normal; 
      vertical-align: middle; 
      background-color: #f5f5f5; 
      border: 1px solid #ebebeb; 
      border-bottom-color: #e2e2e2; 
      border-radius: .25em; 
      -webkit-appearance: none; /* 네이티브 외형 감추기 */ 
      -moz-appearance: none; 
      appearance: none; 
   }
   
   /* 미리보기 이미지 ----------------------------------------------- */
   /* imaged preview */ 
   .filebox .upload-display { /* 이미지가 표시될 지역 */ 
      margin-bottom: 5px; 
   } 
   @media(min-width: 768px) { 
      .filebox .upload-display { 
         display: inline-block; 
         margin-right: 5px; 
         margin-bottom: 0; 
      } 
   } 
   .filebox .upload-display img { /* 추가될 이미지 */ 
      display: block; 
      max-width: 100%; 
      width: 100% \9; 
      height: auto; 
   }
   select, input, input[type="password"] {
		width:50%;
		height:23px;
	}
	#container .column:first-child {
		width:40%;
	}
   
   @media (max-width:767px) and ( min-width : 0px){
    	.column {
    		float:none;
    	}
    	.modify{
			margin-left:0%;
			width:95px;
			height:40px;
			text-align:center;
		    background-color: #f5f6f8;
		    color: gray;
		    border: 2px solid #F7D358; 
		    -webkit-transition-duration: 0.4s;
	   		transition-duration: 0.4s;
	   		font-size:14px;
	   		font-family: NanumGothic, 'Malgun Gothic', Dotum, Helvetica,
			'Apple SD GothicNeo', Sans-serif;
	   		line-hieght:10px;
		}
		img {
			width:270px;
		}
		select, input, input[type="password"] {
			width:270px;
			height:23px;
		}
		.filebox .upload-display img { /* 추가될 이미지 */ 
		    display: block; 
		    max-width: 270px; 
		    height:270px;
		}
		#container .column:first-child {
			width:100%;
		}
		.filebox {
			margin-left:19%;
		}
	}
	
	.d_form.mini {
    width: 7em;
	}
	.d_form {
	    font-size: 1em;
	    padding: .5em;
	    border: 1px solid #ccc;
	    border-color: #dbdbdb #d2d2d2 #d0d0d0 #d2d2d3;
	    box-shadow: inset 0.1em 0.1em 0.15em rgba(0,0,0,.1);
	    vertical-align: middle;
	    line-height: 1.25em;
	    outline: 0;
	    width: 30em;
	}
	.d_btn {
	    display: inline-block;
	    padding: .5em 1em;
	    margin: .4em .15em;
	    border: 1px solid #ccc;
	    border-color: #dbdbdb #d2d2d2 #b2b2b2 #d2d2d3;
	    cursor: pointer;
	    color: #464646;
	    border-radius: .2em;
	    vertical-align: middle;
	    font-size: 1em;
	    line-height: 1.25em;
	    background-image: -webkit-gradient(linear,left top,left bottom,from(#fff),to(#f2f2f2));
	    background-image: -moz-linear-gradient(top,#fff,#f2f2f2);
	    background-image: -o-gradient(top,#fff,#f2f2f2);
	    background-image: linear-gradient(top,#fff,#f2f2f2);
	    width:140px;
	    height:37px;
	}
</style>
<script>
	function pwdCheck(){
	     var pw = document.getElementById("member_pwd").value;
	     var pwck = document.getElementById("pwd_check").value;
	 
	        if (pw != pwck) {
	            $('#same').html("비밀번호가 일치하지 않습니다!");
	            $('#same').css('color', 'red');
	            $('#modify').attr('disabled', true);
	            $('#modify').css('color', 'gray');
	        	$('#modify').css('background-color', '#f5f6f8');
	        	$('#modify').css('cursor', 'default');
	        } else {
	        	$('#same').html("비밀번호가 잘 맞네요!")
	        	$('#same').css('color', 'blue');
	        	$('#modify').attr('disabled', false);
	        	$('#modify').css('color', 'white');
	        	$('#modify').css('background-color', '#F7D358');
	        	$('#modify').css('cursor', 'pointer');
	        }
	}
	$(function(){          
		$('#btn-upload').click(function(e){
			e.preventDefault();             
			$("input:file").click();               
			var ext = $("input:file").val().split(".").pop().toLowerCase();
			$("input:file").val().toLowerCase();
		});                         
	});      

    function readURL(input) {
        var reader = new FileReader();

        reader.onload = function (e) {
                $('#profileimg').attr('src', e.target.result);
            }

          reader.readAsDataURL(input.files[0]);
        }
    
	$(function() {
	    $("#file").on('change', function(){
	        readURL(this);
	    });
	});
	
	$(function(){
		$('#basicimg').click(function(){
			$('#profileimg').attr('src', 'resources/images/mypageProfiles/defaultProfile.jpg');
		});
	});
</script>

	 <div id="container" style="height:724px;">
		<div id="content" class="section_home">
			<div class="c_header">
				<h2>내 정보 변경</h2>
				<p class="contxt">회원님의 정보를 확인하고 변경할 수 있습니다.</p>
			</div>
		<form action="mModify.do" method="post" enctype="multipart/form-data">
			<div class="column">
			<c:if test="${empty member.profile_img_rename }">
				<img src="resources/images/mypageProfiles/defaultProfile.jpg" class="profile" id="profileimg" /><br>
			</c:if>
			<c:if test="${not empty member.profile_img_rename }">
				<img src="${member.profile_img_rename }" class="profile" id="profileimg" /><br>
			</c:if>
					<div class="filebox preview-image" > 
						<input type='file' id='file' name="memberProfile" accept="image/*"/>
						<button id='btn-upload' class="modify"><b>업로드</b></button>
						<button id="basicimg" class="cancel" style="margin-bottom:5%"><b>이미지 삭제</b></button>
					</div>
			</div>
			<div class="column">
				<dl class="myinfo">
					<dt><b>ID</b></dt>
					<dd>${member.member_id }</dd>
					<dt><b>변경할 비밀번호</b></dt>
					<dd><input type="password" maxlength="16" id="member_pwd" name="member_pwd" onchange="pwdCheck()" required></dd>
					<dt><b>비밀번호 확인</b></dt>
					<dd><input type="password" maxlength="16" id="pwd_check" onchange="pwdCheck()" required>&nbsp;&nbsp;<span id="same"></span></dd>
					
					<dt><b>Phone</b></dt>
					<dd><input type="tel" name="phone" maxlength="16" value="${member.phone }"></dd>
					<dt><b>E-mail</b></dt>
					<dd><input type="email" name="email" value="${member.email }"/>
					<dt><b>은행명</b></dt>
						<select style="margin-bottom:5%; height:30px;" name="bank_id">
							<c:forEach var="bank" items="${bank}">
								<option value="${bank.bank_id }" ${account.bank_id eq bank.bank_id ? 'selected="selected"' : '' }>${bank.bank_name }
								</option>
							</c:forEach>
						</select>
					<dt><b>계좌번호</b></dt>
					<dd><input type="text" style="height:20px;" name="account_number" value="${account.account_number }"></dd>
					<dt><b>주소</b></dt>
					<input type="text" id="sample3_postcode" placeholder="우편번호" class="d_form mini"> -
					<input type="button" onclick="sample3_execDaumPostcode()" value="우편번호 찾기" class="d_btn"><br>
					
					<div id="wrap" style="display:none;border:1px solid;width:500px;height:300px;margin:5px 0;position:relative;">
						<img src="//t1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" 
						id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" 
						onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>
					<input type="text" id="sample3_address" name="address" class="d_form large" placeholder="주소" 
					value="${member.address }">
					
					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
					    // 우편번호 찾기 찾기 화면을 넣을 element
					    var element_wrap = document.getElementById('wrap');
					
					    function foldDaumPostcode() {
					        // iframe을 넣은 element를 안보이게 한다.
					        element_wrap.style.display = 'none';
					    }
					
					    function sample3_execDaumPostcode() {
					        // 현재 scroll 위치를 저장해놓는다.
					        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
					        new daum.Postcode({
					            oncomplete: function(data) {
					                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
					                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					                var fullAddr = data.address; // 최종 주소 변수
					                var extraAddr = ''; // 조합형 주소 변수
					
					                // 기본 주소가 도로명 타입일때 조합한다.
					                if(data.addressType === 'R'){
					                    //법정동명이 있을 경우 추가한다.
					                    if(data.bname !== ''){
					                        extraAddr += data.bname;
					                    }
					                    // 건물명이 있을 경우 추가한다.
					                    if(data.buildingName !== ''){
					                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
					                    }
					                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
					                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
					                }
					
					                // 우편번호와 주소 정보를 해당 필드에 넣는다.
					                document.getElementById('sample3_postcode').value = data.zonecode; //5자리 새우편번호 사용
					                document.getElementById('sample3_address').value = fullAddr;
					
					                // iframe을 넣은 element를 안보이게 한다.
					                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
					                element_wrap.style.display = 'none';
					
					                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
					                document.body.scrollTop = currentScroll;
					            },
					            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
					            onresize : function(size) {
					                element_wrap.style.height = size.height+'px';
					            },
					            width : '100%',
					            height : '100%'
					        }).embed(element_wrap);
					
					        // iframe을 넣은 element를 보이게 한다.
					        element_wrap.style.display = 'block';
					    }
					</script>
				</dl>
				<input type="hidden" name="member_id" value="${loginUser.member_id }">
				<button id="modify" type="submit" class="modify" style="margin-left:0%" disabled>수정하기</button> &nbsp;
		 		<input type="button" onclick="javascript:history.back(-1)" class="cancel" value="취소">
			</div>
			</form> 
		</div>
	</div>
</body>
</html>