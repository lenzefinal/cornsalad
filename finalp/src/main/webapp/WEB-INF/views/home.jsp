<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home.jsp</title>
</head>
<style>
	.wrap{width: 100vw;margin: 0 auto;position: relative;padding: 0;}
	@media (min-width:1080px){
		.wrap{
			width:900px;
			margin:0 auto;
		}
	}
</style>
<body>
	<c:import url="header.jsp"></c:import>
	
	<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
	<link href="/finalp/resources/css/modern-business.css" rel="stylesheet">
	<!-- <script src="/test/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script> -->
	<header class="masthead">
      <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
     	 <div class="main_visual_text" style="position: absolute;left: 0;top: 55%;width: 80%;margin-top: -150px;text-align: center;z-index:990;margin-left:10%">  
             <div class="frame" style="opacity: 1; transform: scaleX(1) scaleY(1);position: absolute;left: 50%;top: 115px;width: 669px;height: 100%;margin-left: -328px;">
                 <p class="topEdge" style="position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;left: 0;top: 0;border-right: 0;"></p>
                 <p class="btmEdge" style="right: 0;bottom: 0;top: 0;position: absolute;width: 29px;height: 145px;box-sizing: border-box;border: 1px solid #fff;border-left: 0;"></p>
             </div>
             <dl style="padding: 70px 0;color: #fff;margin-top: 40px;">
                 <dt class="" style="opacity: 1; transform: translateY(0px);font-size: 60px;font-family: 'nanum_eb';line-height: 55px;margin-left: 15px;">CORNSALAD <br> 개발1팀 PROJECT</dt><!-- [D] 영문 20자 / 한글 16자 내외(공백포함) -->
                 <dd class="" style="opacity: 1; transform: translateY(0px);width: 450px;margin: 0 auto;font-size: 16px;margin-top: 10px;line-height: 26px;word-break: keep-all;">화이팅 합시다 우리</dd>
             </dl>
         </div>
         
         <div class="carousel-inner" role="listbox">
             <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('/finalp/resources/images/sliderimage/airplane.jpg')"></div>
            
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/camera.jpg')"></div>
            
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/man.jpg')"></div>
         </div>
         
         <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" style="top:25% !important">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
         </a>
         <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" style="top:25% !important">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
         </a>
      </div>
   </header>
   
	<link rel="stylesheet" type="text/css"  href="/finalp/resources/css/wmainWrap.css">
	<div id="wmainWrap">
    	<div id="mainSection1">
    		<div id="mainProjectBanner">
    			<div class="banner-key-main-projects none-arr" id="main-projects-keyvisual">		
					<a href="https://www.wadiz.kr/web/wcomingsoon/rwd/6032?_refer_section_st=MB4_0" class="banner-item-container" style="background-image:url('https://cdn.wadiz.kr/ft/images/green001/2018/0302/20180302141213325_154.jpg/wadiz/quality/95/optimize')" onclick="gaEvt.send('wmain', 'click_main_subkeyvisual', '‘우리’가 만든 우리 한복_리네한의 세번째 이야기.', '');" tabindex="0">
						<div class="banner-item-inner">
							<h3 class="banner-item-title">‘우리’가 만든 우리 한복<br>리네한의 세번째 이야기.</h3>
							<p class="banner-item-text">세계 여행을 컨셉으로 한양여대 학생들이<br>직접 생활한복을 디자인했습니다</p>
 						</div>
    				</a>
    			</div>
    		</div>
			
			<div id="rankingSection">
    			<div class="ranking-wrap">
	    			<div class="ranking-tab">
	    				<ul>
	    					<li class="active"><button onclick="selectRankingTab('1')">투자</button></li>
	    					<li class=""><button onclick="selectRankingTab('2')">리워드</button></li>
	    					<li class=""><button onclick="selectRankingTab('3')">오픈예정</button></li>
	    				</ul>
	    			</div>
	    				
	    			<div id="rankContent1" class="ranking-content" style="display: none;">
		    			<a href="/web/ftcampaign/detail/726" title="4차산업의 혁명 인공지능 영상분석 전문가 핀텔">
							<em class="ranking-img" style="background-image:url('https://cdn.wadiz.kr/ft/images/green001/2018/0208/20180208104145664_0.jpg/wadiz/quality/95/optimize')"></em>
						</a>
			    		<div class="ranking-list">
			    			<ol>
			    				<li>
			    					<div>
			    						<p class="real"><em>1</em><a href="/web/ftcampaign/detail/754">한‧중‧일 합작프로젝트 영화 &lt;안녕, 티라노&gt;</a></p>
			    						<p><em>1</em><a href="/web/ftcampaign/detail/754">한‧중‧일 합작프로젝트 영화 &lt;안녕, 티라노&gt;</a></p>
			    					</div>
			    				</li>
			    							
								<li>
									<div>
										<p class="real"><em>2</em><a href="/web/ftcampaign/detail/726">4차산업의 혁명 인공지능 영상분석 전문가 핀텔</a></p>
										<p><em>2</em><a href="/web/ftcampaign/detail/726">4차산업의 혁명 인공지능 영상분석 전문가 핀텔</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>3</em><a href="/web/ftcampaign/detail/751">[앵콜] 친환경 에너지 신기술 기반의 벤처기업, 턴투</a></p>
										<p><em>3</em><a href="/web/ftcampaign/detail/751">[앵콜] 친환경 에너지 신기술 기반의 벤처기업, 턴투</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>4</em><a href="/web/ftcampaign/detail/377">인기 웹툰 원작, 영화 &lt;치즈 인 더 트랩&gt;</a></p>
										<p><em>4</em><a href="/web/ftcampaign/detail/377">인기 웹툰 원작, 영화 &lt;치즈 인 더 트랩&gt;</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>5</em><a href="/web/ftcampaign/detail/685">모든 산업의 경쟁력 UP시키는 점착테이프!</a></p>
										<p><em>5</em><a href="/web/ftcampaign/detail/685">모든 산업의 경쟁력 UP시키는 점착테이프!</a></p>
									</div>
								</li>
								
							</ol>
						</div>
		    		</div>
	    				
	    			<div id="rankContent2" class="ranking-content" style="display: block;">
	    				<a href="/web/campaign/detail/18115" title="스마트 고양이 자동 화장실 라비봇,  고양이와 집사를 위한 집사.">
							<em class="ranking-img" style="background-image:url('https://cdn.wadiz.kr/wwwwadiz/green001/2018/0228/20180228194954615_18115.jpg/wadiz/quality/95/optimize')"></em>
						</a>
						<div class="ranking-list">
							<ol>
								
								<li>
									<div>
										<p class="real"><em>1</em><a href="/web/campaign/detail/18115">스마트 고양이 자동 화장실 라비봇,  고양이와 집사를 위한 집사.</a></p>
										<p><em>1</em><a href="/web/campaign/detail/18115">스마트 고양이 자동 화장실 라비봇,  고양이와 집사를 위한 집사.</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>2</em><a href="/web/campaign/detail/11508">식사의 새로운 패러다임! 마시는 액상형 식사, 밀스 드링크</a></p>
										<p><em>2</em><a href="/web/campaign/detail/11508">식사의 새로운 패러다임! 마시는 액상형 식사, 밀스 드링크</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>3</em><a href="/web/campaign/detail/17732">날마다 손이가는 기능성 데일리 팬츠 T.A.D PANTS</a></p>
										<p><em>3</em><a href="/web/campaign/detail/17732">날마다 손이가는 기능성 데일리 팬츠 T.A.D PANTS</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>4</em><a href="/web/campaign/detail/17654">'우리'가 만든 우리 한복, 리네한 세계여행 편</a></p>
										<p><em>4</em><a href="/web/campaign/detail/17654">'우리'가 만든 우리 한복, 리네한 세계여행 편</a></p>
									</div>
								</li>
								
								<li>
									<div>
										<p class="real"><em>5</em><a href="/web/campaign/detail/16831">Button :  좋은 안경의 기준 ,  좋다고 말하는 안경  그 이상</a></p>
										<p><em>5</em><a href="/web/campaign/detail/16831">Button :  좋은 안경의 기준 ,  좋다고 말하는 안경  그 이상</a></p>
									</div>
								</li>
															
							</ol>
						</div>
	    			</div>
	    				
					<div id="rankContent3" class="ranking-content" style="display: none;">
		    			<a href="/web/wcomingsoon/ivt/740" title="파스텔의 세번째 복합문화공간, 한남동 온다빌레">
							<em class="ranking-img" style="background-image:url(https://cdn.wadiz.kr/ft/images/green001/2018/0213/20180213114334090_0.png/wadiz/resize/516/quality/95/optimize)"></em>
						</a>
	    				<div class="ranking-list">
							<ol>
								<li>
									<div>
										<p class="real"><em>1</em><a href="/web/wcomingsoon/rwd/6033">[착한 종이가구 VOYAGE] 수납공간을 3배 늘려주세요</a></p>
										<p><em>1</em><a href="/web/wcomingsoon/rwd/6033">[착한 종이가구 VOYAGE] 수납공간을 3배 늘려주세요</a></p>
									</div>
								</li>   
								
								<li>
									<div>
										<p class="real"><em>2</em><a href="/web/wcomingsoon/rwd/6005">뉴이스트 전원 출연 영화 &lt;좋아해, 너를&gt; 렌티큘러케이스 Blu-ray 및 DVD 런칭 기념 펀딩</a></p>
										<p><em>2</em><a href="/web/wcomingsoon/rwd/6005">뉴이스트 전원 출연 영화 &lt;좋아해, 너를&gt; 렌티큘러케이스 Blu-ray 및 DVD 런칭 기념 펀딩</a></p>
									</div>
								</li>   
								
								<li>
									<div>
										<p class="real"><em>3</em><a href="/web/wcomingsoon/ivt/740">파스텔의 세번째 복합문화공간, 한남동 온다빌레</a></p>
										<p><em>3</em><a href="/web/wcomingsoon/ivt/740">파스텔의 세번째 복합문화공간, 한남동 온다빌레</a></p>
									</div>
								</li>   
								
								<li>
									<div>
										<p class="real"><em>4</em><a href="/web/wcomingsoon/rwd/6030">50대 막걸리 주조사의 아기같은 손의 비밀은? 한국 막걸리 K-beauty로 알리다</a></p>
										<p><em>4</em><a href="/web/wcomingsoon/rwd/6030">50대 막걸리 주조사의 아기같은 손의 비밀은? 한국 막걸리 K-beauty로 알리다</a></p>
									</div>
								</li>   
								
								<li>
									<div>
										<p class="real"><em>5</em><a href="/web/wcomingsoon/ivt/724">모헤닉게라지스 코스닥 상장전 마지막 투자기회!</a></p>
										<p><em>5</em><a href="/web/wcomingsoon/ivt/724">모헤닉게라지스 코스닥 상장전 마지막 투자기회!</a></p>
									</div>
								</li>   
								
							</ol>
						</div>
					</div>
				</div>
    		</div>
    	</div>
    		
		<div id="noticeList">
			<dl>
				<dt>공지사항</dt>
				<dd><a href="/web/wboard/newsBoardDetail/6049?_refer_section_st=NTB_0">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요!</a></dd>
			</dl>
			<a class="more" href="/web/wboard/newsBoardList?_refer_section_st=NTB_0">전체보기 <i class="icon-chevron-right"></i></a>
		</div>
    </div>
	
	
	
	<!-- list slider -->
	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick-theme.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/css/home.css">
  	<div class="wrap">
  		<p style="margin: 0 20px 10px;">분야별인기리스트</p>
		<section class="responsive slider">
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
	  </section>
	  
	  <p style="margin: 40px 20px 10px;">분야별인기리스트</p>
	  <section class="responsive slider">
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
		    
		    <div>
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
								<rect x="0" y="0" height="2" width="60%" fill="#fa6462"></rect><!--여기서의 width값에 따라-->
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
	  </section>
  </div>

	
  <script src="https://code.jquery.com/jquery-2.2.0.min.js" type="text/javascript"></script>
  <script src="/finalp/resources/slick/slick.js" type="text/javascript" charset="utf-8"></script>
  <script type="text/javascript">
    $(document).on('ready', function() {
     
    	$('.responsive').slick({
    		  dots: true,
    		  infinite: false,
    		  speed: 300,
    		  slidesToShow: 3,
    		  slidesToScroll: 3,
    		  responsive: [
    		    {
    		      breakpoint: 1080,
    		      settings: {
    		        slidesToShow: 2,
    		        slidesToScroll: 2,
    		        infinite: true,
    		        dots: true
    		      }
    		    } ,
    		    {
    		      breakpoint: 600,
    		      settings: {
    		        slidesToShow: 1,
    		        slidesToScroll: 1
    		      }
    		    }
    		    // You can unslick at a given breakpoint now by adding:
    		    // settings: "unslick"
    		    // instead of a settings object
    		  ]
    		});
     
    });
</script>

<script type="text/javascript">

	$(document).ready(function(){
		var rankingTabNum = 0;
		if(false){
			rankingTabNum = 1;
			selectRankingTab(''+rankingTabNum);
		}else if(true){
			rankingTabNum = 2;
			selectRankingTab(''+rankingTabNum);
		}else{
			rankingTabNum = 3;
			selectRankingTab(''+rankingTabNum);
		}
		
		var rankingSet = setInterval(function(){
			if(rankingTabNum == 3){
				rankingTabNum = 1;
			}else{
				rankingTabNum++;
			}
			selectRankingTab(''+rankingTabNum);
		}, 10000);
		
		$('#rankingSection').mouseenter(function() {
			  clearInterval(rankingSet);
		  }).mouseleave(function() {
			  rankingSet = setInterval(function(){
					if(rankingTabNum == 3){
						rankingTabNum = 1;
					}else{
						rankingTabNum++;
					}
					selectRankingTab(''+rankingTabNum);
				}, 10000);
		  });

		
		
		/* $.each($('.slick-slider'), function(idx){
			var slickOpts = {
				infinite: true,
				dots:true
			}
			
			if($(this).find('.slick-slide').length == 1){
				$(this).slick('slickSetOption', 'slidesToShow', 0 , true).addClass('none-arr');
				$('.slick-dots a').on('click', function(){
					return false;
				});
			}
		}); */
		
		 
	});

	function selectRankingTab(num){
		var tabNum = num-1;
		$('#rankingSection .helpinfo').removeClass('invest').removeClass('reward').removeClass('coming');
		if(num == 1){
			$('#rankingSection .helpinfo').addClass('invest');
		}else if(num == 2){
			$('#rankingSection .helpinfo').addClass('reward');
		}else{
			$('#rankingSection .helpinfo').addClass('coming');
		}
		$('.ranking-content').hide();
		$('#rankContent'+num).show();
		$('.ranking-tab li').removeClass('active');
		$('.ranking-tab li:eq('+tabNum+')').addClass('active');
	}
	function scrollToTop(){
		$('html, body').animate({scrollTop : 0},600);
		return false;
	}
    
</script>

<c:import url="footer.jsp"/>
</body>
</html>
