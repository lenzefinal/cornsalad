<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/finalp/resources/css/projectListView.css" rel="stylesheet">
<script src="/finalp/resources/js/search.js" type="text/javascript"></script>
</head>
<body style="background:#f6f5f5;">
	<c:import url="../header.jsp"/>
	<div class="wrap">
		<div id="noticeSection" style="margin-top:100px;">
		    <p class="title">알려드립니다.</p>
		    <p class="text">콘샐러드는 결제 즉시 배송되는 쇼핑몰이 아닙니다. 정해진 기간 내 목표를 달성해야 물품이 제공되는 크라우드펀딩 서비스입니다.<br>
		    			프로젝트에 따라 제공일 지연, 진행 취소 등의 이슈가 있을 수 있으니 결제하시기 전, 프로젝트 하단의 '위험요인과 해결방안' 정책을 꼭 읽어주세요!</p>
		</div>

		
		<div class="con_menu_wrap">
			<ul class="tour_menu">
				<li class="on">
					<a href="#" id="fund">펀딩프로젝트</a>
					<input type="hidden" name="category_id" value="PC-FUND">
				</li>
				<li>
					<a href="#" id="prod">공동구매</a>
					<input type="hidden" name="category_id" value="PC-PROD">
				</li>		
			</ul>
		</div>
		
		<div class="hEIXJa"></div>
		
		<div class="form" align="center">
			<form id="" action="" method="GET" name="searchForm">
					<div class="search_sel">
						<select name="category" id="areaCode" class="search_category" title="중분류">
							<option >전체</option>
							<option value="CA-DS" id="c1">디자인</option>
							<option value="CA-FB" id="c2">패션/뷰티</option>
							<option value="CA-CK" id="c3">요리</option>
							<option value="CA-SH" id="c4">공연</option>
						</select>
					</div>
					
	
					<div id="s1" data-type="multiple" class="search_tab" style="display:block;">
						<ul>
							<li><button name="category_sub_id" value="CASB-SP" class="go-button " type="button">공간디자인</button></li>
							<li><button name="category_sub_id" value="CASB-VI" class="go-button " type="button">시각디자인</button></li>
							<li><button name="category_sub_id" value="CASB-PR" class="go-button " type="button">제품디자인</button></li>
							<li><button name="category_sub_id" value="CASB-CH" class="go-button " type="button">캐릭터디자인</button></li>
						</ul>
					</div>
					
					<div id="s2" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_id" value="CASB-CL" class="go-button " type="button">의류</button></li>
							<li><button name="category_sub_id" value="CASB-GD" class="go-button " type="button">잡화</button></li>
							<li><button name="category_sub_id" value="CASB-AC" class="go-button " type="button">악세서리</button></li>
							<li><button name="category_sub_id" value="CASB-CO" class="go-button " type="button">화장품</button></li>
						</ul>
					</div>
					
					<div id="s3" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_id" value="CASB-HE" class="go-button " type="button">건강식품</button></li>
							<li><button name="category_sub_id" value="CASB-BA" class="go-button " type="button">베이킹</button></li>
							<li><button name="category_sub_id" value="CASB-HA" class="go-button " type="button">수제</button></li>
						</ul>
					</div>
					
					<div id="s4" data-type="multiple" class="search_tab" style="display:none;">
						<ul>
							<li><button name="category_sub_id" value="CASB-MU" class="go-button " type="button">뮤지컬</button></li>
							<li><button name="category_sub_id" value="CASB-TH" class="go-button " type="button">연극</button></li>
							<li><button name="category_sub_id" value="CASB-FE" class="go-button " type="button">페스티벌</button></li>
						</ul>
					</div>
					
					
			</form>
		</div>
		<div class="selectlist">
			<a id="_resetFilter" href="#" class="clear" style="padding-bottom: 7px;">
				<span class="ico_clear"></span>전체해제
			</a>
			<span class="bar">|</span>
			<div id="piclist" style="display:inline-block;">
			</div>
		</div>
		
		<div id="searchSortArea">
			<div class="search-area">
				<input type="text" id="keyword" name="project_name" placeholder="프로젝트 검색하기">
				<button type="button" onclick="keywordSearch()" style="box-sizing:inherit !important;"></button>
			</div>
				<div class="selects-wrap">
					<div class="select-list">
						<select id="endYn" name="endYn">
							<option value="" selected="selected">전체</option>
							<option value="N">펀딩중</option>
							<option value="Y">종료된</option>
						</select>
					</div>
					<div class="select-list">
						<select id="order" name="order">
							<option value="recommend" selected="selected">추천순</option>
							<option value="popular">인기순</option>
							<option value="amount">펀딩액순</option>
							<option value="closing">마감임박순</option>
							<option value="recent">최신순</option>
							<option value="support">응원참여자순</option>
						</select>
					</div>
				</div>
		</div>
		
		
		<div class="thumnailContainer">
			<c:forEach var="projectList" items="${ projectlist }">
			<div class="thumnailContent">
				<c:url var="projectDetail" value="projectDetailView.do">
					<c:param name="member_id" value="${ loginUser.member_id }"/>
					<c:param name="project_id" value="${ projectList.project_id }"/>
				</c:url> 

				<a class="thumnailAtag" href="${ projectDetail }">

					<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/${ projectList.image_rename }" alt="${ projectList.project_name }">

					<div class="thumnailTextWrap">

						<div class="fundingTitle">
							<h1 class="projectTitle">${ projectList.project_name }</h1>
							<p class="creatorName">${ projectList.member_name }</p>
						</div>

						<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">
							<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>
							<rect x="0" y="0" height="2" width="${ projectList.percent }" fill="#F7D358"></rect><!--여기서의 width값에 따라-->
						</svg>

						<div class="fundingInfo">
							<span style="font-size: 0.8rem;">
								<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>
								<span style="font-weight: 700;">${ projectList.dday }</span>
								<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->
							</span>

							<div>
								<span class="fundingMoney">
									<!-- react-text: 239 -->${projectList.total_amount}<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text -->
								</span>
								<span class="fundingRate">
									<!-- react-text: 242 -->${projectList.percent}<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->
								</span>
							</div>
						</div>
					</div>
				</a>
			</div>
			</c:forEach>

			
		</div>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var parent = ".search_tab",
			btn = ".search_tab button";

			requiredTagSearch(parent,btn);
			
			//--------------select 중분류별 소분류 표시--------------------//
			$("#areaCode").change(function(){
				var optionSelected = $(this).find("option:selected");
				var valueSelected = optionSelected.val();
			
				if(valueSelected === "CA-DS"){
					$("#s1").css("display", "block");
					$("#s2").css("display", "none");
					$("#s3").css("display", "none");
					$("#s4").css("display", "none");
				}
				
				if(valueSelected === "CA-FB"){
					$("#s1").css("display", "none");
					$("#s2").css("display", "block");
					$("#s3").css("display", "none");
					$("#s4").css("display", "none");				
				}
		
				if(valueSelected === "CA-CK"){
					$("#s1").css("display", "none");
					$("#s2").css("display", "none");
					$("#s3").css("display", "block");
					$("#s4").css("display", "none");
				}
				
				if(valueSelected === "CA-SH"){
					$("#s1").css("display", "none");
					$("#s2").css("display", "none");
					$("#s3").css("display", "none");
					$("#s4").css("display", "block");
				} 
			});
			
			//---------전체해제 누르면 카테고리에 모든 부분 사라짐-----------//
			$(".clear").on("click",function(){
				$.each($(".form input[type='hidden']"),function(index){
					var pic=$(this);
					
					pic.prev().removeClass("ov");
					pic.remove();
					
				});
				
				$.each($("#piclist a"),function(index){
					var pic=$(this);
					pic.remove();
				});
			});
			
			/* $("#fund").on("click",function(){
				
			});
			$("#prod".on("click"),function(){
				
			}); */
			
			$(document).on("click", "#fund, #prod", function(){
				$(".on").removeClass("on");
				$(this).parent().addClass("on");
			});
			
			//----------------------카테고리선택, 키워드 검색 바뀔때마다 ajax--------------------------//
			$(document).on("click keyup",".go-button, .ov, .clear, .del, #keyword, #fund, #prod",function(){
				
				var category_id=$(".on input[type='hidden']").val();
				
				console.log(category_id);
				
				var category=""; // ajax에서 최종으로 보낼 변수
				var keyword = $('#keyword').val();
				
				// 키워드 검색 유무 판단
				if(keyword==="")
					category+="project_name= "+keyword;
				else if(keyword!=="")
					category+="project_name="+keyword;
				
				// 카테고리 선택 유무 판단
				if($(".form input[type='hidden']").length === 0){
					category+="&category_sub_id= ";
				}else{
					$.each($(".form input[type='hidden']"),function(index){
						var pic=$(this);
						category+="&category_sub_id="+pic.attr("value");
					});
				}
				
				category+="&category_id="+category_id;
				
				$.ajax({
					url:"keywordAndCategory.do",
					data:category,
					dataType:"json",
					type:"post",
					success:function(data){
						var jsonStr = JSON.stringify(data);
						var json = JSON.parse(jsonStr);
						var values="";
						console.log(json.list);
						console.log(json.category_id);
						
						for(var i in json.list){
							values+='<div class="thumnailContent">';
								if(json.category_id === "PC-FUND"){
									values+='<a class="thumnailAtag" href="projectDetailView.do?member_id=${loginUser.member_id}&project_id='+json.list[i].project_id+'">';
								}else{
									values+='<a class="thumnailAtag" href="projectDetailGPView.do?member_id=${loginUser.member_id}&project_id='+json.list[i].project_id+'">';
								}
									values+='<img class="thumnailImage" src="/finalp/resources/uploadProPreImages/'+decodeURIComponent(json.list[i].image_rename)+'" alt="'+decodeURIComponent(json.list[i].project_name)+'">'+
												'<div class="thumnailTextWrap">'+
													'<div class="fundingTitle">'+
														'<h1 class="projectTitle">'+decodeURIComponent(json.list[i].project_name.replace(/\+/g," "))+'</h1>'+
														'<p class="creatorName">'+decodeURIComponent(json.list[i].member_name.replace(/\+/g," "))+'</p>'+
													'</div>'+
													'<svg class="percentageLine" xmlns="http://www.w3.org/2000/svg">'+
														'<rect x="0" y="0" fill="#efefef" height="2" width="100%"></rect>';
														if(json.category_id === "PC-FUND"){
															values+='<rect x="0" y="0" height="2" width="'+json.list[i].percent+'" fill="#F7D358"></rect><!--여기서의 width값에 따라--></svg>';
														}else{
															values+='<rect x="0" y="0" height="2" width="'+json.list[i].percent+'" fill="#F79F81"></rect><!--여기서의 width값에 따라--></svg>';
														}
												values+=
													'<div class="fundingInfo">'+
														'<span style="font-size: 0.8rem;">'+
															'<i class="_2CeNIUhLMEIh6Reaatfs8t _1DLNFgQRrQNEosKFB0zOK5 _3fJsfvAPykJzj2xoMnxzWW _1QY7TzdLHKX3-BKPDNNYKF"></i>'+
															'<span style="font-weight: 700;">'+json.list[i].dday+'</span>'+
															'<!-- react-text: 235 -->일<!-- /react-text --><!-- react-text: 236 -->&nbsp;남음<!-- /react-text -->'+
														'</span>'+
														'<div>'+
															'<span class="fundingMoney">';
															if(json.category_id === "PC-FUND"){
																values+='<!-- react-text: 239 -->'+json.list[i].total_amount+'<!-- /react-text --><!-- react-text: 240 -->원<!-- /react-text --></span>';
															}else{
																values+='<!-- react-text: 239 -->'+json.list[i].total_count+'<!-- /react-text --><!-- react-text: 240 -->개 판매<!-- /react-text --></span>';
															}
													values+=
															'<span class="fundingRate">'+
																'<!-- react-text: 242 -->'+json.list[i].percent+'<!-- /react-text --><!-- react-text: 243 --><!-- /react-text -->'+
															'</span>'+
														'</div></div></div></a></div>'														;
						}
						$(".thumnailContainer").html(values);
					}
				});
				
			});
			
		});
	</script>
	
	<c:import url="../footer.jsp"/>
</body>
</html>
