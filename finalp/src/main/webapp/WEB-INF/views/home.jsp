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
         
         <div class="carousel-inner" role="listbox">
             <!-- Slide One - Set the background image for this slide in the line below -->
            <div class="carousel-item active" style="background-image: url('/finalp/resources/images/sliderimage/season.jpg')"></div>
            
            <!-- Slide Two - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/pizza.jpg')"></div>
            
            <!-- Slide Three - Set the background image for this slide in the line below -->
            <div class="carousel-item" style="background-image: url('/finalp/resources/images/sliderimage/box.jpg')"></div>
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
	    					<li class="active"><button onclick="selectRankingTab('1')">기대 상승!</button></li>
	    					<li class=""><button onclick="selectRankingTab('2')">최대 후원금</button></li>
	    					<li class=""><button onclick="selectRankingTab('3')">인기</button></li>
	    				</ul>
	    			</div>
	    				
	    			<div id="rankContent1" class="ranking-content" style="display: none;">
		    			
		    		</div>
	    				
	    			<div id="rankContent2" class="ranking-content" style="display: block;">
	    				
	    			</div>
	    				
					<div id="rankContent3" class="ranking-content" style="display: none;">
		    			
					</div>
				</div>
    		</div>
    	</div>
    		
		<div id="noticeList">
			<dl>
				<dt>공지사항</dt>
				<dd><a href="noticeMain.do">홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요!</a></dd>
			</dl>
			<a class="more" href="notictMain.do">전체보기 <i class="icon-chevron-right"></i></a>
		</div>
		
		<div id="noticeList" style="margin-top:20px;">
			
			<ul>
				<li style="padding:5px;"><p style="font-size:17px;float:left;">채팅방</p> <a style="float:right;font-size:13px;">전체보기</a><br><br>
				<li style="border-bottom:1px solid lightgray;padding: 5px;">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요! <a style="float:right">입장하기</a></li>
				<li style="border-bottom:1px solid lightgray;padding: 5px;">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요! <a style="float:right">입장하기</a></li>
				<li style="border-bottom:1px solid lightgray;padding: 5px;">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요! <a style="float:right">입장하기</a></li>
				<li style="border-bottom:1px solid lightgray;padding: 5px;">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요! <a style="float:right">입장하기</a></li>
				<li style="border-bottom:1px solid lightgray;padding: 5px;">[이벤트] [리워드 메이커 프로모션] 홈리빙 제품/서비스 펀딩 오픈하고 다양한 혜택 받으세요! <a style="float:right">입장하기</a></li>
			</ul>
			
		</div>
    </div>
	
	
	
	<!-- list slider -->
	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick-theme.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/css/home.css">
  	<div class="wrap">
	  <p style="margin-left: 25px;margin-bottom: 20px;font-size: 1.2rem;"><strong>마감 임박 펀딩 프로젝트</strong></p>
	  <section class="responsive slider">
	 	 <c:forEach var="project" items="${ comingEndProject }">
		      <div class="thumnailContent">
					<a class="thumnailAtag" href="projectDetailView.do?member_id=${loginUser.member_id }&project_id=${project.project_id}">
						<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/${ project.image_rename }" alt="${ project.project_name }">
						<div class="thumnailTextWrap">
							<div class="fundingTitle">
								<h1 class="projectTitle">${ project.project_name }</h1>
								<p class="creatorName">${ project.member_name }</p>
							</div>
	
							<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
								<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
								<rect x="0" y="0" height="2" width="${ project.percent }" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
							</svg>
	
							<div class="fundingInfo">
								<span style="font-size: 0.8rem;">
									<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
									<span style="font-weight: 700;">${ project.dday }</span>
									<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
								</span>
	
								<div>
									<span class="fundingMoney">
										<!-- react-text: 239 -->${ project.total_amount }<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
									</span>
									<span class="fundingRate">
										<!-- react-text: 242 -->${ project.percent }<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->
									</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
	  </section>
	  
	  <p style="margin-left: 25px;margin-bottom: 20px;font-size: 1.2rem;"><strong>마감 임박 공동구매</strong></p>
		<section class="responsive slider">
		      <c:forEach var="product" items="${ comingEndProduct }">
		      <div class="thumnailContent">
					<a class="thumnailAtag" href="projectDetailGPView.do?member_id=${ loginUser.member_id }&project_id=${ product.project_id }">
						<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/${ product.image_rename }" alt="${ product.project_name }">
						<div class="thumnailTextWrap">
							<div class="fundingTitle">
								<h1 class="projectTitle">${ product.project_name }</h1>
								<p class="creatorName">${ product.member_name }</p>
							</div>
	
							<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
								<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
								<rect x="0" y="0" height="2" width="${ product.percent }" fill="#F79F81"></rect><!--여기서의 width값에 따라-->
							</svg>
	
							<div class="fundingInfo">
								<span style="font-size: 0.8rem;">
									<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
									<span style="font-weight: 700;">${ product.dday }</span>
									<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
								</span>
	
								<div>
									<span class="fundingMoney">
										<!-- react-text: 239 -->${ product.total_count }<!-- /react-text --><!-- react-text: 240 -->개 판매<!-- /react-text -->
									</span>
									<span class="fundingRate">
										<!-- react-text: 242 -->${ product.percent }<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->
									</span>
								</div>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
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
		
		//처음에는 무조건 실행
		getExpectationTop5();  
		getPaymentAmountTop5();
		getPaymentCountTop5(); 
		
		
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
		
		//jieun
		//ajax 실행
		//console.log("tabNum]"+tabNum);
		switch(tabNum){
			case 0: getExpectationTop5();   break;
			case 1: getPaymentAmountTop5(); break;
			case 2: getPaymentCountTop5();  break;
		}
		
		
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
	
	
	
	//-----------
	//jieun
	//-----------
	//후원금에 비해 결제 건수가 높은 경우(기대치) top5
	function getExpectationTop5(){
		
		//컨트롤러로 부터 리스트를 받아서 출력 처리함
		$.ajax({
			url: "realTimeExpectationTopRank.do",
			type: "post",
			dataType: "json",
			success: function(data){
				//리턴된 하나의 객체를 문자열로 변환
				var jsonStr = JSON.stringify(data);
				//변환된 문자열을 json 객체로 변환
				var json = JSON.parse(jsonStr);
				
				var renameImg = "";
				var proName = "";
				for(var i in json.list){
					var rank = i + 1;
					if(rank == json.list[i].rankNum){
						
						projectId = json.list[i].projectId;
						renameImg = json.list[i].imageRename;
						proName = (decodeURIComponent(json.list[i].projectName)).replaceAll("+", " ");
						break;
					}
				}
				
				var values = '<a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+projectId+'" title="'+ proName +'">' +
								'<em class="ranking-img" style="background-image:url('+ "/finalp/resources/uploadProPreImages/" +  renameImg +')"></em>' +
							 '</a>';
				
				//json.list[i]
				
				values += '<div class="ranking-list">' +
							'<ol>';
				
				for(var i=0; i<5; ++i){
					for(var j in json.list){
						var rank = i + 1;
						if(rank == json.list[j].rankNum){
							
							var projectN = (decodeURIComponent(json.list[j].projectName)).replaceAll("+", " ");
							values += '<li><div>';
							
							if(json.list[j].projectCategoryId === "PC-FUND"){
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}else{
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}
							values+='</div></li>';
							break;
						}							
					}
				}
				
				values += 	'</ol>' +
						'</div>';
						
				$("#rankContent1").html(values);
			}/* ,
			error: function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			} */
		});
	}
	
	//후원금 top5
	function getPaymentAmountTop5(){
		
		//컨트롤러로 부터 리스트를 받아서 출력 처리함
		$.ajax({
			url: "realTimePaymentAmountTopRank.do",
			type: "post",
			dataType: "json",
			success: function(data){
				//리턴된 하나의 객체를 문자열로 변환
				var jsonStr = JSON.stringify(data);
				//변환된 문자열을 json 객체로 변환
				var json = JSON.parse(jsonStr);
				
				var renameImg = "";
				var proName = "";
				for(var i in json.list){
					var rank = i + 1;
					if(rank == json.list[i].rankNum){
						
						projectId = json.list[i].projectId;
						renameImg = json.list[i].imageRename;
						proName = (decodeURIComponent(json.list[i].projectName)).replaceAll("+", " ");
						break;
					}
				}
				
				var values = '<a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+projectId+'" title="'+ proName +'">' +
								'<em class="ranking-img" style="background-image:url('+ "/finalp/resources/uploadProPreImages/" +  renameImg +')"></em>' +
							 '</a>';
				
				//json.list[i]
				
				values += '<div class="ranking-list">' +
							'<ol>';
				
				for(var i=0; i<5; ++i){
					for(var j in json.list){
						var rank = i + 1;
						if(rank == json.list[j].rankNum){
							
							var projectN = (decodeURIComponent(json.list[j].projectName)).replaceAll("+", " ");
							values += '<li><div>';
							
							if(json.list[j].projectCategoryId === "PC-FUND"){
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}else{
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}
							values+='</div></li>';
							break;
						}							
					}
				}
				
				values += 	'</ol>' +
						'</div>';
						
				$("#rankContent2").html(values);
			}/* ,
			error: function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			} */
		});
	}
	
	//결제 수 top5
	function getPaymentCountTop5(){
		
		//컨트롤러로 부터 리스트를 받아서 출력 처리함
		$.ajax({
			url: "realTimePaymentCountTopRank.do",
			type: "post",
			dataType: "json",
			success: function(data){
				//리턴된 하나의 객체를 문자열로 변환
				var jsonStr = JSON.stringify(data);
				//변환된 문자열을 json 객체로 변환
				var json = JSON.parse(jsonStr);
				
				var renameImg = "";
				var proName = "";
				for(var i in json.list){
					var rank = i + 1;
					if(rank == json.list[i].rankNum){
						
						projectId = json.list[i].projectId;
						renameImg = json.list[i].imageRename;
						proName = (decodeURIComponent(json.list[i].projectName)).replaceAll("+", " ");
						break;
					}
				}
				
				var values = '<a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+projectId+'" title="'+ proName +'">' +
								'<em class="ranking-img" style="background-image:url('+ "/finalp/resources/uploadProPreImages/" +  renameImg +')"></em>' +
							 '</a>';
				
				//json.list[i]
				
				values += '<div class="ranking-list">' +
							'<ol>';
				
				for(var i=0; i<5; ++i){
					for(var j in json.list){
						var rank = i + 1;
						if(rank == json.list[j].rankNum){
							
							var projectN = (decodeURIComponent(json.list[j].projectName)).replaceAll("+", " ");
							values += '<li><div>';
							
							if(json.list[j].projectCategoryId === "PC-FUND"){
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}else{
								values+='<p class="real"><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>' +
								 		'<p><em>'+ rank +'</em><a href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+ json.list[j].projectId +'">'+ projectN +'</a></p>';
							}
							values+='</div></li>';
							break;
						}							
					}
				}
				
				values += 	'</ol>' +
						'</div>';
						
				$("#rankContent3").html(values);
			}/* ,
			error: function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+ "message : " + request.responseText + "\n"
						+ "error : " + errorData);
			} */
		});
	}
	
	String.prototype.replaceAll = function(org, dest) {
	    return this.split(org).join(dest);
	}


</script>

<c:import url="footer.jsp"/>
</body>
</html>
