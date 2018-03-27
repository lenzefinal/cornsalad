<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>projectSendRequestView.jsp</title>
</head>
<body>
<c:import url="/WEB-INF/views/header.jsp"/>

<style>
		.project-outter-div-margin{
		display: block;
	    max-width: 100%!important;
	    
	    /* border:1px solid rgba(0,0,0,0.3);
	    border-radius: .28571429rem; */
	}
	
	@media only screen and (min-width: 1200px){
		.project-outter-div-margin {
		    width: 1071px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
		
	}
	@media only screen and (max-width: 1199px) and (min-width: 992px){
		.project-outter-div-margin {
		    width: 891px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
		
	}
	@media only screen and (max-width: 991px) and (min-width: 768px){
		.project-outter-div-margin {
		    width: 695px;
		    margin-left: auto!important;
		    margin-right: auto!important;
		}
		
	}
	@media only screen and (max-width: 767px){
		.project-outter-div-margin {
		    width: auto!important;
		    margin-left: 0.8em!important;
		    margin-right: 0.8em!important;
		}
	}
	
	.btn-primary{
		background-color: rgba(0,0,0,0);
		color: #FFC72B;
		border-color: #FFC72B;
	}
	.btn-primary:hover{
		background-color: #FFC72B;
		border-color: #FFC72B;
	}
	
	.request-div{
		border: 1px solid rgba(62, 75, 83, 0.2);
		margin-top: 170px;
		margin-bottom: 50px;
		background-color: white;
		/* padding: 30px 30px 30px 30px; */
	}
	
	.request-main{
		background: rgba(62, 75, 83, 0.9);
	
		height:600px;
		border-right: 1px solid #3e4b53;
		color: white;
	}
	
	.request-top{
		text-align:center;
		height: 400px;
		color: rgba(62, 75, 83, 0.8);
		font-size: 11pt;
		/* font-weight: bold; */
	}
	
	.request-bottom{
		background: rgba(62, 75, 83, 0.1);
		height: 200px;
		color: rgba(62, 75, 83, 0.8);
		font-size: 9pt;
		font-weight: bold;
	}
	
	.request-in-name{
		margin: 0% 13% 0% 13%;
		border: 1px solid rgba(250,250,250,0.4);
		padding: 30px 10px 10px 10px;
		box-shadow: 0px 0px 5px white;
	}
</style>

<script>
	function goMyProjectPage(){
		location.href="myProject.do";
	}
</script>

<div class="request-div project-outter-div-margin">
	<table cellspacing="0" style="width:100%;">
		<colgroup>
			<col style="width:40%;">
			<col style="width:60%;">
		</colgroup>
		<tr>
			<td rowspan="2">
				<div class="request-main">
					<table cellspacing="0" style="width:100%;height:100%;align:center;text-align:center;">
						<tr><td style="padding:35px 0px 0px 0px;height:50%;">
							<svg width="85" height="90" xmlns="http://www.w3.org/2000/svg" xmlns:svg="http://www.w3.org/2000/svg">
							  <path fill="white" d="m60.67976,19.75163a1.11969,1.11969 0 0 0 -1.6046,-1.5517l-20.10157,17.06871l-10.57978,-4.09966a2.57441,2.57441 0 0 1 -0.29976,-4.67273l43.96779,-24.61561a2.16885,2.16885 0 0 1 3.21802,2.09832l-3.88807,40.19433a2.64494,2.64494 0 0 1 -3.60594,2.22175l-12.88969,-4.98131l-7.2207,6.77106a2.64494,2.64494 0 0 1 -4.40824,-1.89554l0,-4.78735l17.41255,-21.75026l-0.00001,-0.00001zm20.84216,30.46094a5.74834,5.74834 0 0 0 -8.09353,0.49372l-13.94767,15.9402a6.51538,6.51538 0 0 1 -4.8667,2.18649l-12.99549,0a1.83383,1.83383 0 0 1 0,-3.65884l11.46142,0a5.53675,5.53675 0 1 0 0,-11.06468l-14.74115,0a23.08154,23.08154 0 0 0 -24.82721,4.99013l-11.9816,11.80527l20.86861,17.09515l4.73445,-4.73445l27.19002,0a13.66554,13.66554 0 0 0 10.30647,-4.68155l17.42136,-20.2779a5.73953,5.73953 0 0 0 -0.52899,-8.09353l0.00001,-0.00001z" id="svg_1"/>
							</svg>
							<h4 style="margin-top:20px;">Request Success!</h4>
						</td></tr>
						<tr><td style="height:10%;">
							<div class="request-in-name">
								<p style="font-size: 12pt;">${ projectName }</p>
							</div>
						</td></tr>
						<tr><td style="padding-bottom: 80px;">
							<button class="btn btn-primary" onclick="goMyProjectPage()"><b>프로젝트 목록</b></button>
						</td></tr>
					</table>	
				</div>
			</td>
			<td>
				<div class="request-top">
					<div style="padding: 160px 20px 20px 20px;">
						<b style="font-size:14pt">프로젝트 검토 요청이 정상적으로 완료되었습니다!</b><br>
						<br>
						검토 결과는 등록 당일 이후 7일 안으로 완료됩니다.<br>
						좀 더 자세한 피드백을 원하신다면 1:1 문의로 연락주시면 됩니다.<br>
						<br>
					</div>
				</div>
			</td>
		</tr>
		<tr>
			<td>
				<div class="request-bottom">
					<div style="padding: 40px 20px 20px 50px;">
						<div>
							<img src="/finalp/resources/images/icon/noticeIcon.png" style="width:30px; height:30px;"/>
						</div>
						<br>
						검토 요청이 등록된 프로젝트는 검토가 끝날 때까지 수정과 삭제가 불가능합니다.<br>
						프로젝트의 수정과 삭제를 원하신다면 관리자게 1:1문의를 해주시길 바랍니다.<br>
						기본 사항의 내용이 불성실한 결과일 경우 해당 회원 본인에게 불이익이 발생할 수 있습니다.<br>
						검토 결과는 이메일 인증에 입력하셨던 이메일 주소로 발송됩니다.<br>
					</div>
				</div>
			</td>
		</tr>
	</table>
	<%-- <h1>${ projectName }</h1> --%>
</div>


<c:import url="/WEB-INF/views/footer.jsp"/>
</body>
</html>