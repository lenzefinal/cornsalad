<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/*---------기본설정--------------------*/
	div, h3, p {word-break: break-all;}
	*, :after, :before {box-sizing: inherit;}
	body {margin: 0;overflow-x: hidden;min-width: 320px;background: #f6f5f5;font-size: 14px;line-height: 1.7em;color: rgba(0,0,0,.87);font-smoothing: antialiased;}
	html {font-family: sans-serif;font-size: 12.5px;-ms-text-size-adjust: 100%;-webkit-text-size-adjust: 100%;}
	::selection {background-color: #cce2ff;color: rgba(0,0,0,.87);}
	@media only screen and (max-width: 768px){
		body, html {
			font-size: 13px;
		}
	}
	@media (min-width: 1080px){
		html {
			font-size: 14px;
		}
	}
	/*------------큰틀---------------------*/

	.wrap{width: 100vw;margin: 0 auto;position: relative;padding: 0;}
	@media (min-width:1080px){
		.wrap{
			width:1080px;
			margin:0 auto;
		}
	}
	

	/*-------------구분선-------------------*/
	.hEIXJa {border-top: 1px solid lightgray;margin: 1.5rem 0;height: 0;}

	/*------------썸네일 부분----------------------*/
	a, a:hover {text-decoration: none;}
	a {color: #fa6462;}
	a {background: transparent;}


	.thumnailContainer {
		/* display: -webkit-box;display: -webkit-flex;display: -ms-flexbox;display: flex;margin: 0 -1rem;padding: 0 1rem;-webkit-box-pack: center;-webkit-justify-content: center;
		-ms-flex-pack: center;justify-content: center;-webkit-flex-direction: column;-ms-flex-direction: column;flex-direction: column; */
		display: flex;-webkit-box-pack: center;justify-content: center;flex-wrap: wrap;width: 100%;margin: 10px 0px 30px;}
	
	.thumnailContent {
		/*width: 100%;*/
		margin: 1rem;
	}
	.thumnailContent:hover{
		background-image:url('img_ov.png');
	}

	
	
	.thumnailAtag {
		cursor: pointer;
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		-webkit-flex-direction: row;
		-ms-flex-direction: row;
		flex-direction: row;
		position: relative;
		width: 100%;
		background-color: #ffffff;
		min-height: 105px;
		height: auto;
		padding-bottom: 0.75rem;
		border-bottom: 1px solid rgba(0, 0, 0, 0.05);
	}
	
	.thumnailImage {
		min-width: 120px;
		width: 120px;
		height: 90px;
		margin-right: 1rem;
		background-color: #efefef;
		-webkit-transition: background-color 0.2s ease;
		transition: background-color 0.2s ease;
	}
	
	
	img {
		border: 0;
	}

	.thumnailImage:hover{
		background-image:url('img_ov.png');
	}

	.thumnailTextWrap {
		-webkit-order: 2;
		-ms-flex-order: 2;
		order: 2;
		color: black;
		font-size: 0.9rem;
		line-height: 1.6;
		max-width: 60%;
		padding-bottom: 0;
	}

	.fundingTitle {
		height: 60px;
	}

	
	.projectTitle {
		color: #3c3737;
		font-size: 1.1rem;
		font-weight: bold;
		margin-bottom: 0;
		line-height: 1.5;
		word-break: keep-all;
		word-wrap: break-word;
	}
	

	.creatorName {
		font-size: 0.8rem;
		margin-bottom: 0;
		color: #3c3737;
	}

	svg:not(:root) {
		overflow: hidden;
	}
	.percentageLine {
		max-width: 100%;
		height: 2px;
		font-size: 0;
	}
	

	.fundingInfo {
		margin-top: 0.4rem;
		display: -webkit-box;
		display: -webkit-flex;
		display: -ms-flexbox;
		display: flex;
		-webkit-box-pack: space-between;
		-webkit-justify-content: space-between;
		-ms-flex-pack: space-between;
		justify-content: space-between;
		-webkit-align-items: center;
		-webkit-box-align: center;
		-ms-flex-align: center;
		align-items: center;
	}
	

	i._1DLNFgQRrQNEosKFB0zOK5._1QY7TzdLHKX3-BKPDNNYKF, i._1DLNFgQRrQNEosKFB0zOK5.JXDnh3ZF3p-Ajae7ENKXc {
		line-height: 1;
		font-size: .71428571rem;
	}
	i._3fJsfvAPykJzj2xoMnxzWW._1QY7TzdLHKX3-BKPDNNYKF {
		color: #767676!important;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF, i.JXDnh3ZF3p-Ajae7ENKXc {
		font-size: 1em;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF {
		display: inline-block;
		opacity: 1;
		margin: 0 .25rem 0 0;
		width: 1.18em;
		height: 1em;
		font-family: Icons;
		font-style: normal;
		font-weight: 400;
		text-decoration: inherit;
		text-align: center;
		speak: none;
		font-smoothing: antialiased;
		-moz-osx-font-smoothing: grayscale;
		-webkit-font-smoothing: antialiased;
		-webkit-backface-visibility: hidden;
		backface-visibility: hidden;
	}
	i._1QY7TzdLHKX3-BKPDNNYKF._2CeNIUhLMEIh6Reaatfs8t:before {
		content: "\F073";
	}
	i._1QY7TzdLHKX3-BKPDNNYKF:before {
		background: none!important;
	}

	.fundingMoney {
		font-size: 0.8rem;
		font-weight: 700;
		color: #3c3737;
	}
	.fundingRate {
		margin-left: 0.2rem;
		font-size: 0.6rem;
		font-weight: 700;
		color: #3c3737;
	}

	#noticeSection {
    margin-bottom: 25px;
    padding: 15px;
    text-align: center;
    background: #F9EDEE;
    border: 1px solid #F98F9B;
}
#noticeSection p.title {
    margin-bottom: 8px;
    font-size: 14px;
    line-height: 22px;
    color: #FF6879;
}
#noticeSection p.text {
    font-size: 12px;
    line-height: 18px;
}

	@media (max-width: 320px){
		.thumnailAtag {
			min-height: 90px;
			height: auto;
		}
		.fundingTitle {
			height: 40px;
		}
		.projectTitle {
			font-size: 1rem;
			line-height: 1.4;
			word-break: break-all;
			margin-bottom: 0.3rem;
		}
	}

	@media (max-width: 1080px){
		.thumnailImage {
			margin-right: 0;
			position: relative;
			top: 0;
			bottom: 0;
			margin: auto 0;
			left: 0;
		}
		.fundingTitle {
			padding: 0 1rem 0 0.6rem;
		}
		.projectTitle {
			overflow: hidden;
			text-overflow: ellipsis;
			white-space: nowrap;
		}
		.percentageLine {
			padding: 0 1rem 0 0.6rem;
		}
		.fundingInfo {
			padding: 0 1rem 0 0.6rem;
		}
	}

	@media (min-width: 1080px){
		.thumnailContainer {
			/* -webkit-flex-direction: row;
			-ms-flex-direction: row;
			flex-direction: row; */

			-webkit-box-pack: start;
			justify-content: flex-start;
			margin: 20px 0px 40px;
		}
		.thumnailContent {
			-webkit-flex: 0 0 20%;
			-ms-flex: 0 0 20%;
			flex: 0 0 20%;
		}
		.thumnailAtag {
			-webkit-flex-direction: column;
			-ms-flex-direction: column;
			flex-direction: column;
			height: 100%;
			padding-bottom: 0;
			border: 1px solid rgba(0, 0, 0, 0.05);
			border-radius: 2px !important;
			box-shadow: 0 1px 1px rgba(0, 0, 0, 0.1);
			-webkit-transition: box-shadow 0.2s ease;
			transition: box-shadow 0.2s ease;

			max-width: 240px;
		}
		.thumnailImage {
			width: 240px; 
			/* width:100%; */
			height: 180px;
			border-radius: 2px 2px 0 0;
			margin-right: 0;
		}
		.thumnailTextWrap {
			max-width: 100%;
			padding: 1rem 1.2rem 1rem 1.2rem;
		}
		.projectTitle {
			font-size: 1rem;
			word-spacing: -1px;
		}
	}
</style>
</head>
<body>
	<c:import url="../header.jsp"/>
	<div class="wrap">
		<div id="noticeSection" style="margin-top:100px;">
		    <p class="title">알려드립니다.</p>
		    <p class="text">콘샐러드는 결제 즉시 배송되는 쇼핑몰이 아닙니다. 정해진 기간 내 목표를 달성해야 물품이 제공되는 크라우드펀딩 서비스입니다.<br>
		    			프로젝트에 따라 제공일 지연, 진행 취소 등의 이슈가 있을 수 있으니 결제하시기 전, 프로젝트 하단의 '위험요인과 해결방안' 정책을 꼭 읽어주세요!</p>
		</div>

		<div class="hEIXJa"></div>
		<div class="thumnailContainer">
			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			
			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>

			<div class="thumnailContent">

				<a class="thumnailAtag" href="#">

					<img class="thumnailImage" src="https://tumblbug-pci2.imgix.net/17ab7961bf0169b14c9d3d9d3f30a7f21e8884c7/46bfc9ff587c3cab9b078e766398a02803cc11bb/31bf3b28d9a093ae996a6fcd979129a3a13202fd/1c04c0e2-cb61-4eee-9460-5d0540f63ae1.jpeg?w=620&h=465&auto=format%2Ccompress&lossless=true&fit=crop&q=60" alt="당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’ 이미지">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">당신의 하루를 반짝이게 만들어줄, 우주를 담은 ‘썬캐쳐’</h1>
							<p class="creatorName">ANE</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="60%" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">21</span>
								<!-- react-text: 235 -->분<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->4,062,000<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->4061<!-- /react-text --><!-- react-text: 243 -->%<!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>
		</div>
	</div>
	
	<c:import url="../footer.jsp"/>
</body>
</html>