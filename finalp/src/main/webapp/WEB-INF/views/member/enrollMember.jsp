<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:import url="../header.jsp"/>
	
	
	<link href="/finalp/resources/css/enroll.css" rel="stylesheet">
	<div class="wzui account-regist step-signup">
      <div class="account-wrap">
        <div class="account-header">
          <h2 class="title">이메일로 회원가입</h2>
          <p class="desc">추가정보를 입력하고 회원가입을 완료하세요.</p>
        </div>

		<form name="frm_join" id="frm_join" method="post" novalidate="novalidate">
			<div class="account-main">
				<input type="hidden" name="secureStateBagKey" value="" />
			    <input type="hidden" id="isExist" value="" />
			    <input type="hidden" id="isExistCode" value="" />
				<input type="hidden" id="encKey" name="encKey" value="" />
				<input type="hidden" id="pictureURL" name="pictureURL" value="" />
				<input type="hidden" id="loginIdType" name="loginIdType" value="wadiz" />
				<input type="hidden" id="providerUserId" name="providerUserId" value="" />
				<input type="hidden" name="accntType" value="N1000" />
				<input type="hidden" id="hiddenAllowDM" name="allowDM" />
				<!-- S: 일반 이메일 가입 -->
				<div class="check-email-field">
					<label class="field">
					  <div class="inner-container">
						<input id="Email" name="Email" type="email" class="input email large" placeholder="이메일 계정" required aria-required="true">
						<input id="userId" name="member_id" type="hidden" required>
						<button id="btnCheckEmail" class="wz-btn primary large" type="button" disabled="">인증하기</button>
					  </div>
					</label>
					<p class="notice">해당 이메일로 알림 및 펀딩 관련 안내가 발송됩니다.<br>사용하는 이메일이 아닌 경우, 변경하시기 바랍니다.</p>
				</div>

				<div id="emailToken" class="email-token" style="display: none;">
					<label class="field">
					  <div class="inner-container">
						<div class="input-area">
						  <input type="tel" class="input text large block" id="" name="tokenValue" maxlength="6" placeholder="이메일 인증번호 입력" required aria-required="true">
						  <em id="emailTimeOut" class="timeout">03:00</em>
						</div>

						<button id="checkToken" type="button" class="wz-btn primary large">인증확인</button>
					  </div>
					  <!-- <em id="tokenValue-error" class="error">이메일 인증번호를 입력해주세요.</em> -->
					</label>
				</div>

				<label class="field">
					<input id="member_name" name="member_name" type="text" class="input text block large" maxlength="20" placeholder="이름" value readonly="true" required aria-required="true" aria-describedby="member_name-error" aria-invalid="true">
				</label>

				<label class="field">
					<input id="pwd1" type="password" name="member_pwd" class="input text block large" placeholder="비밀번호 입력" readonly="true" required aria-required="true">
					<p class="notice">영문, 숫자, 특수문자 (!@#$%^&amp;*+=-)를 조합한 8자 이상</p>
				</label>

				<label class="field">
					<input id="pwd2" type="password" name="password2" class="input text block large" placeholder="비밀번호 확인" readonly="true" required aria-required="true">
				</label>

          	</div>

			<div class="account-footer">
				<button type="submit" id="btnJoin" class="wz-btn primary block large" disabled="true">완료</button>
			</div>
        </form>
        
      </div>
    </div>
	
	<script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
	<script src="/finalp/resources/jquery-validation-1.17.0/dist/jquery.validate.min.js" type="text/javascript"></script>
	<script src="/finalp/resources/jquery-validation-1.17.0/dist/additional-methods.min.js" type="text/javascript"></script>
	<script src="/finalp/resources/jquery-validation-1.17.0/dist/localization/messages_ko.min.js" type="text/javascript"></script>
	<script src="https://cdn.rawgit.com/alertifyjs/alertify.js/v1.0.10/dist/js/alertify.js"></script>
	<script src="https://www.wadiz.kr/resources/static/js/countdown.js" type="text/javascript"></script>
	
	<!-- <script src="//cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/alertify.min.js"></script>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/alertify.min.css"/>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.11.0/build/css/themes/default.min.css"/> -->
	<!-- <script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/vendor.js?cccfc7afdfbd4b01613f"></script>
	<script type="text/javascript" src="https://cdn.wadiz.kr/resources/assets/base.js?e09dbdea16ec0b37d824"></script> -->
	<script type="text/javascript">
	    (function($){
	      $(function(){
	        // ------------------
	        // 변수 정의
	        // ------------------
	        var $form       = $('#frm_join');                   // 회원가입 폼
	        //var $formAgree  = $('agree-form', $form);           // 동의 폼
	        var idType      = $('#loginIdType', $form).val();   // 회원가입 유형
	        var $btnSubmit  = $('#btnJoin');                    // 가입완료 버튼
	        var $btnCheckEmail        = $('#btnCheckEmail', $form);
	        var $btnChangeEmailModal  = $('#btnChangeEmailModal', $form);
	        
	        // 주요 필드
	        var $Email             = $('#Email', $form);                   // 이메일(아이디) 필드
	        var $member_name             = $('#member_name', $form);                   // 닉네임(이름) 필드
	        //var $agreeContainer       = $('.agree-statement');                   // 동의영역 컨테이너
	        //var $inputAgreeAll        = $('#agreeAllCheckBox', $agreeContainer); // 전체 동의 인풋
	        //var $inputAgreeGroup      = $('#agreeCheckGroup', $agreeContainer);  // 와디즈 서비스 이용약관(필수) 인풋
	        //var $inputAgreeCheckTab1  = $('#agreeCheckTab1', $agreeContainer);   //   ㄴ 회원가입 약관 인풋
	        //var $inputAgreeCheckTab2  = $('#agreeCheckTab2', $agreeContainer);   //   ㄴ 서비스 이용 약관 인풋
	        //var $inputAgreeCheckTab3  = $('#agreeCheckTab3', $agreeContainer);   //   ㄴ 개인정보 처리방침 인풋
	        //var $inputAgreeCheckTabs  = $('#agreeCheckTab1, #agreeCheckTab2, #agreeCheckTab3', $agreeContainer);
	        //var $inputAllowDM         = $('#allowDM', $agreeContainer);          // 쿠폰/포인트, 오픈알림, 뉴스레서 수신(선택) 인풋
	
	        // ------------------
	        // 초기화
	        // ------------------
	        function initPage() {
	          // GA 이벤트 처리
	          //gaEvt.send("conversion_rate", "tryjoin", idType, 1);
	
	          /* if ($('#isExist').val() === 'false') {
	            var $isExistCode = $('#isExistCode');
	            resultIsJoinedEmail($isExistCode.val());
	          } else {
	            $Email.val($('#getEmail').val());
	          } */
	
	          // 타입에 따라 이메일 필드 처리
	          /* if (idType === 'facebook' || idType === 'kakao' || idType === 'google' || idType === 'naver') {
	            activeEmailField(true); // 이메일 인증 필드 활성화
	          } else {
	            activeEmailField(false); // 이메일 인증 필드 비활성화
	          }  */
	
	          // 유효성 검사
	          $form.validate({
	            rules: {
	              //agreeCheckGroup: { required: true},
	              tokenValue: { required: true, maxlength: 6 },
	              Email:   { required: true, email: true},
	              member_name:   { required: true, minlength: 2, maxlength: 20 },
	              member_pwd:   { required: true, minlength: 8, pwcheck: true },
	              password2:  { required: true, equalTo: '#pwd1'},
	            },
	            messages: {
	              //agreeCheckGroup: { required: '이용약관에 동의하셔야 가입이 가능합니다.' },
	              tokenValue: { required: '이메일 인증번호를 입력해주세요.', maxlength: '인증번호 6자리를 확인해주세요.' },
	              Email:   { required: '아이디(이메일 계정)를 입력해주세요.', email: '이메일을 정확히 입력해주세요.'},
	              member_name:   { required: '이름을 입력해주세요.', minlength: '최소 2자 이상입니다.', maxlength: '닉네임 최대 길이는 20자 입니다. 확인해 주세요.' },
	              member_pwd:   { required: '비밀번호를 입력해주세요.', minlength: '최소 8자입니다.', pwcheck: '올바르지 않은 비밀번호 형식입니다.'},
	              password2:  { required: '확인을 위한 비밀번호를 정확히 입력해주세요.', equalTo: '동일한 비밀번호를 입력해주세요.'},
	            },
	            errorElement: 'em',
	            errorPlacement: function(error, element) {
	              $parent = $(element).parent();
	              if (!$parent.hasClass('field')) {
	                $parent = $parent.parent();
	              }
	              if ($(element).prop('name') === 'tokenValue') {
	                $parent = $('#emailToken .field', $form);
	              }
	              error.appendTo($parent);
	
	              // 실패시 확인 버튼 비활성화
	              $btnSubmit.prop('disabled', true);
	            },
	            onfocusout: checkField,
	            onkeyup: checkField,
	            submitHandler: function(form) {
	              if (window.console) {
	                console.log('Go!');
	              }
	              join();
	            }
	          });
	          
	          //$btnSubmit.on('click', join());
	
	          // 에러처리 jQuery Validate.
	          function checkField(element, evt) {
	            $(element).valid();
	            var isInvalid = ($form.valid()) ? false : true;
	            $btnSubmit.prop('disabled', isInvalid);
	          };
	
	          // 커스텀 rules  
	          $.validator.addMethod("pwcheck", function(value, element) {
	            return /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,16}$/.test(value);
	          });
	        }
	
	        // ------------------
	        // 회원가입 약관 내용 보기 
	        // ------------------
	        /**
	         * 그룹인풋 활성화 제어
	         * @params {boolean} setActive
	         */
	        //function activeInputGroup (setActive) {
	          //var checked = setActive;
	          //$inputAgreeGroup.isCheckedAll = checked;
	          //$inputAgreeGroup.prop('checked', checked);
	          //$inputAgreeCheckTabs.prop('checked', checked);
	        //}
	
	        /**
	         * 인증하기 버튼 활성화 제어
	         * @params {boolean} setActive
	         */
	        /* function activeEmailField (setActive) {
	          var disabled = setActive ? false : true;
	          //$Email.prop('readonly', disabled);
	          $btnChangeEmailModal.prop('disabled', disabled);
	          if(disabled == true)
	            $('#btnCheckEmail').prop('disabled', true);
	        } */
	
	        /**
	         * 전체 체크된 경우, 전체동의 활성화
	         */
	        //function isAllChecked() {
	          //var checked = $inputAgreeGroup.isCheckedAll && $inputAllowDM.is(':checked') ? true:false;
	          //$inputAgreeAll.prop('checked', checked);
	          //$form.valid(); // 유효성검사
	        //}
	
	        // 1. 전체동의
	        //$inputAgreeAll.on('change', function(){
	          //var status = $inputAgreeAll.is(':checked') ? true : false;
	          //activeEmailField(status);
	          //$inputAgreeGroup.is(':disabled') ? activeEmailField(false) : activeInputGroup(status); // 인증완료 후 해제되지 않도록 처리
	          //$inputAllowDM.prop('checked', status);
	        //});
	
	        // 2. 와디즈 서비스 이용약관
	        // 2-1. 와디즈 서비스 이용약관 인풋에 이벤트 바인딩
	        //$inputAgreeGroup.on('change', function(){
	          //var status = ($inputAgreeGroup.is(':checked'));
	          //activeInputGroup(status);
	          //activeEmailField(status);
	          //isAllChecked(); //(필수)와 (선택)이 모두 활성화되었는지 확인
	        //});
	
	        // 2-2. 와디즈 서비스 이용약관 하위 인풋에 이벤트 바인딩
	        //$inputAgreeCheckTabs.on('change', function(e){
	          //var checkedLength = $agreeContainer.find('.agreeCheckBox:checked').length;
	          //var status = false;
	          //if (checkedLength === 3) {
	          //  status = true;
	          //  activeInputGroup(status);
	          //} else if (checkedLength === 0) {
	          //  activeInputGroup(status);
	          //} else {
	          //  $inputAgreeGroup.prop('checked', status);
	          //}
	          //$inputAgreeGroup.isCheckedAll = status;
	          //isAllChecked();
	          //activeEmailField(status);
	        //});
	
	        // 3. (필수)와 (선택)이 모두 활성화되었는지 확인
	        //$inputAllowDM.on('change', isAllChecked);
	
	        // 4. Email 값 작성 후 유효성에 따른 버튼 활성화 처리 및 가입된 이메일 여부 확인
	        $Email.on('keyup blur', function(){
	          //if($('#agreeCheckGroup').is(':checked')){
		          var $this = $(this);
		          var isInvalid = !$this.hasClass('valid');
		          $btnCheckEmail.prop('disabled', isInvalid);
	          //}
	        });
	        $Email.on('blur', isJoinedEmail);
	
	        // ------------------
	        // 인증 절차
	        // ------------------
	        // 1. 이메일 변경시 모달 showLyPop();
	        /*$btnChangeEmailModal.on('click', function(){
	          showLyPop('confirmChangeEmail'); // 이메일 변경 모달
	
	          // 모달 내 변경버튼 클릭시 이메일 필드에 값 반영 후 인증절차 진행
	          $('#btnChangeEmail').on('click', function(){
	            var newEmail = $('#changedEmail').val();
	            $Email.val(newEmail);
	
	            // 이메일 인증절차 시작(인증메일 발송)
	            sendEmail();
	            closeLyPop('confirmChangeEmail');
	            $('#check-email').hide(); // 사용중인 이메일이 맞으신가요? 가리기
	          })
	        });*/
	
	        // 2. 이메일 계정 인증하기 시 타이머, 인증번호 입력창.show()
	        // 인증메일 발송
	       	function sendEmail() {
	       	  var Email = $Email.val();
	       	  enablePasswordInput(false);
	       	  
	       	  /* if($('#agreeCheckGroup').is(':checked') == false){
	       	   alertify.alert('이용약관에 동의하셔야 가입이 가능합니다.');
	       	    return;
	       	  } */
	       	
	       	  // 인증코드 이메일 발송 요청
	       	  var param = {"Email": Email}
	       	  
	       		$.ajax({
	              type: 'POST',
	              url: 'ajaxSendEmailAuthCode.do',
	              dataType:"json",
	              data: {Email: Email},
	              success: function(data) {
	            	  var jsonStr = JSON.stringify(data);
						//변환된 문자열을 json 객체로 바꿈
					  var json = JSON.parse(jsonStr);
						
	            	  if (json.code != "SUSS000") {
	    	      	  	  alertify.alert(json.message);
	    	              $Email.val('').focus();
	    	       	  }else {
	    	       	  	  console.log(json.code+" 인증메일 발송");
	    	       	  	  alertify.alert('인증메일이 발송되었습니다. <br/>메일 안에 있는 인증번호를 확인해주세요.');
	    	       	  	  $Email.addClass('disable');
		    	       	  $("#emailToken").show();
		    	      	  enableTokenInput(true);
		    	      	  setTimer();
	    	       	  	
	    	       	  	  $("input[name='secureStateBagKey']").val(json.message);
	    	       	  	  console.log(json.message);
	    	       	  }
	    	       	  	  
	              	}, 
	              fail: function(xhr) {
	        		    alertify.alert("오류가 발생했습니다. 관리자에 문의해주세요. 오류코드 : " + xhr.status);
	              }
	            });
	       	}
	        $btnCheckEmail.on('click', sendEmail);
	
	        // 3. 3분 타이머 시작
	      	function setTimer() {
	      	  var tokenExpirationTime = 180;
	      	  $("#btnCheckEmail").text("재전송").prop('disabled', false);
	      	  $('#emailTimeOut').countdown({
	      	    date: (new Date()).getTime() + (tokenExpirationTime * 1000),
	      	  	end: function() {
	      	   	  enableTokenInput(false);
	              $('#emailTimeOut').text("입력 시간 초과").before().addClass('error');
	      	    }
	          });
	      	}
	
	        // 4. 인증코드 검증
	       	function checkToken() {
	          var Email = $Email.val();
	       	  var tokenValue = $("input[name='tokenValue']").val();
	       	  var secureStateBagKey = $("input[name='secureStateBagKey']").val();
	       	 
	       	  if ($("input[name='tokenValue']").prop("disabled")) {
	       	  	return;
	       	  }
	
			  // 유효성체크 요청
			  $.ajax({
	              url: 'ajaxIsValidToken.do',
	              data: {"token": tokenValue, "secureStateBagKey": secureStateBagKey},
	              success: function(data) {
						
					  if (data != "SUSS000") {
			              alertify.alert("인증번호가 틀렸습니다.");
			       	  }else {
			       	  	  $Email.prop('readonly', true);
			              $member_name.prop("readonly", false).focus();
			              $btnCheckEmail.text("인증완료").addClass('gray disabled').prop('disabled', true);
			              $("#userId").val(Email);
			       	  	  enableTokenInput(false);
			              enablePasswordInput(true); 
			              $('#emailToken').hide();
			       	  	  $("input[name='tokenValue']").prop("disabled", true);
			       	  }
	    	       	  	  
	              	}, 
	              fail: function(xhr) {
	        		    alertify.alert("오류가 발생했습니다. 관리자에 문의해주세요. 오류코드 : " + xhr.status);
	              }
	            });
	          
	        }
	        
	        // 인증하기 버튼 이벤트 바인딩
	        $('#checkToken').on('click', checkToken);
	
	        // 이메일 가입여부 확인
	        function isJoinedEmail(callback) {
	          var Email = $Email.val();
	          if (Email) {
	            $.ajax({
	              type: 'POST',
	              url: 'joinedEmailFind.do',
	              data: {Email: Email},
	              success: function(result) {
	            	  console.log(result);
	                resultIsJoinedEmail(result, callback);
	              }, fail: function(xhr) {
	        		    alertify.alert("오류가 발생했습니다. 관리자에 문의해주세요. 오류코드 : " + xhr.status);
	              }
	            });
	          }
	        }
	        
	        // 가입된 이메일확인 결과 처리
	        function resultIsJoinedEmail(code, callback) {		  
	          if (code === 'SUSBA02') {
	            alertify.alert("이미 가입된 계정입니다.<br>해당 계정으로 로그인 혹은<br>다른 이메일로 회원가입을 진행해 주세요.");
	            $Email.addClass('error');
	            $('#btnCheckEmail').prop('disabled', true);
	          }else if (code === 'SUSS000') {
	            $Email.removeClass('error');
	          	if (typeof callback == 'function') {
	          	  callback();
	          	}
	          } else {
	            alertify.alert('오류가 발생했습니다. 관리자에 문의해주거나, 입력된 정보가 올바른지 다시 한번 확인해주시기 바랍니다.');
	          }
	        }
	
	       	// 인증번호 입력창 활성화/비활성화
	      	function enableTokenInput(isShow) {
	          var $inputTokenValue = $("input[name='tokenValue']");
	          var $emailTimeOut = $("#emailTimeOut");
	      	  if (isShow) {
	            $inputTokenValue.prop("disabled", false).val("").focus();
	            $emailTimeOut.show();
	      	  } else {
	            $inputTokenValue.prop("disabled", true);
	            $emailTimeOut.countdown("destroy");
	            $Email.focus();
	      	  }
	      	  $("[id^=errMsg]").hide();
	      	}
	
	        // 비밀번호, 이름(닉네임) 입력창 활성화
	      	function enablePasswordInput(isShow) {
	          var $inputPassword1 = $("#pwd1");
	          var $inputPassword2 = $("#pwd2");
	          var $inputmember_name = $("#member_name");
	          var readonly = isShow ? false : true;
	          
	          $inputPassword1.prop("readonly", readonly).val("");
	          $inputPassword2.prop("readonly", readonly).val("");
	          $inputmember_name.prop("readonly", readonly).val("");
	      	}
	
	        // ------------------
	        // 회원가입 처리
	        // ------------------
	        
	        function join() {
	        	console.log("join실행");
	          // 마케팅 수신동의 확인/처리
	          //var allowDM = $('input:checkbox[id = allowDM]').is(':checked') ? 1 : 0;
	          //$('#hiddenAllowDM').val(allowDM);
	          var param = $form.serialize();
	
	          // 등록처리
	          $.ajax({
	            url: 'enrollMember.do',
	            data: param,
	            type: 'POST',
	            success: function(result) {
	              if ('SUSS000' === result) {
	                  var idType = $('#loginIdType').val();
	                  //gaEvt.send("conversion_rate", "joincomplete", idType, 1);
	                  alertify.alert("성공적으로 가입이 되었습니다.", function(){
	                	  location.href ='home.do';
	                  });
	                  
	              }else {
	                alertify.alert("오류가 발생했습니다. 관리자에게 문의해주시거나, 입력된 정보가 올바른지 다시 한번 확인해주시기 바랍니다. 오류 코드 : " + result);
	              }
	            },
	            fail: function(xhr) {
	              alertify.alert("오류가 발생했습니다. 관리자에게 문의해주시거나, 입력된 정보가 올바른지 다시 한번 확인해주시기 바랍니다. 오류 코드 : " + xhr.status);              
	            },
	            error: function(xhr) {
	              alertify.alert("오류가 발생했습니다. 관리자에게 문의해주시거나, 입력된 정보가 올바른지 다시 한번 확인해주시기 바랍니다. 오류 코드 : " + xhr.status);
	            }
	          });
	        }
	
	        // 초기화 실행
	        initPage();
	      });
	      
	    }(window.jQuery));
    </script>
	
	
	<c:import url="../footer.jsp"/>
	
	<script type="text/javascript">

	window.intercomSettings={app_id:"lmfb1tir",hide_default_launcher:true,horizontal_padding:95};
	(function(){
		var w=window;
		var ic=w.Intercom;
		if(typeof ic==="function"){
			ic('reattach_activator');
			ic('update',intercomSettings);
		}else{
			var d=document;
			var i=function(){
				i.c(arguments)
			};
			i.q=[];
			i.c=function(args){
				i.q.push(args)
			};
			w.Intercom=i;
			function l(){
				var s=d.createElement('script');s.type='text/javascript';s.async=true;s.src='https://widget.intercom.io/widget/rbpfw0z2';var x=d.getElementsByTagName('script')[0];x.parentNode.insertBefore(s,x);}if(w.attachEvent){w.attachEvent('onload',l);}else{w.addEventListener('load',l,false);}}})()
	</script>
	
</body>
</html>