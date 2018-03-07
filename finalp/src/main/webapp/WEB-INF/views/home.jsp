<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<title>Home.jsp</title>
</head>
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

	
	<!-- list slider -->
	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/slick/slick-theme.css">
  	<link rel="stylesheet" type="text/css" href="/finalp/resources/css/home.css">
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
    		    }/*,
    		    {
    		      breakpoint: 480,
    		      settings: {
    		        slidesToShow: 1,
    		        slidesToScroll: 1
    		      }
    		    } */
    		    // You can unslick at a given breakpoint now by adding:
    		    // settings: "unslick"
    		    // instead of a settings object
    		  ]
    		});
     
    });
</script>

<c:import url="footer.jsp"/>
</body>
</html>
