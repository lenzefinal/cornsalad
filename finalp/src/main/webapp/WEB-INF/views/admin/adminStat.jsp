<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset=UTF-8>
<title>통계</title>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="/finalp/resources/css/adminPage.css" rel="stylesheet">
 <style>
	div#stat{
		font-family:"맑은 고딕";
		margin-top:2%;
		margin-left:25%;
		margin-right:10%;
		display:inline-block;
		width: 60%;
		float:center;
		font-size: 13px;
 	}
 	hr.hrst{
		background-color:#F7D358;
		border:1.5px solid #F7D358; 
	}
@media (max-width: 320px){
	display:block;
 }
	#stat a#sta{
		text-decoration: none;
		color: #353535;
	}
	#stat a#sta:hover{
		background-color:#E4F7BA;
	}
	#stat div.stback{
		width:100%;
		height:500px;
		background-color:#A5A5A5;
	}
	#stat ul.stli{
		background-color:#F6FFCC;
	}
	#stat .tab{
		list-style: none;
		margin: 0;
		padding: 0;
		overflow: hidden;
		}
	#stat .tab li{
		float: left;
	}
	#stat .tab li a {
		display: inline-block;
		color: #000;
		text-align: center;
		text-decoration: none;
		padding: 14px 16px;
		font-size: 15px;
		transition:0.3s;
	}
	#stat .tabcontent {
		display: none;
		background-color:#F6FFCC;
		padding: 6px 12px;
		color:black;
	}
	#stat ul.tab li.current{
		background-color: #F6FFCC;
		color: black;
	}
	#stat .tabcontent.current {
		display: block;
	}
	#stat li.amcharts-export-menu ul{
	  display: none;
	}
	#stat svg div.amcharts-chart-div a{
	 display:none;
	}
	
 </style>
 <style>
#chartdiv {
	width		: 100%;
	height		: 500px;
	font-size	: 13px;
}
#chartdiv2 {
  width: 100%;
  height: 500px;
}

.amcharts-export-menu-top-right {
  top: 10px;
  right: 0;
}
							
</style>
<script src="https://www.amcharts.com/lib/3/amcharts.js"></script>
<script src="https://www.amcharts.com/lib/3/pie.js"></script>
<script src="https://www.amcharts.com/lib/3/plugins/export/export.min.js"></script>
<link rel="stylesheet" href="https://www.amcharts.com/lib/3/plugins/export/export.css" type="text/css" media="all" />
<script src="https://www.amcharts.com/lib/3/themes/light.js"></script>

<script src="https://www.amcharts.com/lib/3/serial.js"></script>

<!-- Chart code -->
<script>
$(function(){
	var fundcount = document.getElementById("fundcount").getAttribute("value");
	var prodcount = document.getElementById("prodcount").getAttribute("value");
	console.log(fundcount);
	console.log(prodcount);
	
	var chart = AmCharts.makeChart( "chartdiv", {
	  	"type": "pie",
	  	"theme": "light",
	  	"dataProvider": [ {
	    	"title": "PROJECT(펀딩)",
	    	"value": fundcount
	  	}, {
	    	"title": "PRODUCT(공동구매)",
	    	"value": prodcount
	  	} ],
	  	"titleField": "title",
	  	"valueField": "value",
	  	"labelRadius": 5,

	  	"radius": "42%",
	  	"innerRadius": "60%",
	  	"labelText": "[[title]]",
	  	"export": {
	    	"enabled": true
	  }
	});
	
	var size = document.getElementsByName("project_name").length;
	
	/* for(var i=0; i<size; i++){
		var proname = document.getElementsByName("project_name")[i].getAttribute("value");
	}
	
	console.log(proname[1]); */
	console.log(size);
	
	var chart = AmCharts.makeChart("chartdiv2", {
		  "type": "serial",
		  "theme": "light",
		  "marginRight": 70,
		  "dataProvider": [{
		    "country": "USA",
		    "visits": 3025,
		    "color": "#FF0F00"
		  }, {
		    "country": "China",
		    "visits": 1882,
		    "color": "#FF6600"
		  }, {
		    "country": "Japan",
		    "visits": 1809,
		    "color": "#FF9E01"
		  }, {
		    "country": "Germany",
		    "visits": 1322,
		    "color": "#FCD202"
		  }, {
		    "country": "UK",
		    "visits": 1122,
		    "color": "#F8FF01"
		  }, {
		    "country": "France",
		    "visits": 1114,
		    "color": "#B0DE09"
		  }, {
		    "country": "India",
		    "visits": 984,
		    "color": "#04D215"
		  }, {
		    "country": "Spain",
		    "visits": 711,
		    "color": "#0D8ECF"
		  }, {
		    "country": "Netherlands",
		    "visits": 665,
		    "color": "#0D52D1"
		  }, {
		    "country": "Russia",
		    "visits": 580,
		    "color": "#2A0CD0"
		  }, {
		    "country": "South Korea",
		    "visits": 443,
		    "color": "#8A0CCF"
		  }, {
		    "country": "Canada",
		    "visits": 441,
		    "color": "#CD0D74"
		  }],
		  "valueAxes": [{
		    "axisAlpha": 0,
		    "position": "left",
		    "title": "Visitors from country"
		  }],
		  "startDuration": 1,
		  "graphs": [{
		    "balloonText": "<b>[[category]]: [[value]]</b>",
		    "fillColorsField": "color",
		    "fillAlphas": 0.9,
		    "lineAlpha": 0.2,
		    "type": "column",
		    "valueField": "visits"
		  }],
		  "chartCursor": {
		    "categoryBalloonEnabled": false,
		    "cursorAlpha": 0,
		    "zoomable": false
		  },
		  "categoryField": "country",
		  "categoryAxis": {
		    "gridPosition": "start",
		    "labelRotation": 45
		  },
		  "export": {
		    "enabled": true
		  }

		});

	
});


</script>

 </head>
  <body class="skin_main">
 <c:import url="adminMenu.jsp"/> 
   <div id="lnb_area">
    <div class="lnb">
      <ul> 
         <li class="on">
            <a href="adminMain.do" style="color:black;">STATISTICS <em style="color:black"></em></a>
         </li>
      </ul>
   </div>
</div>
 
<div id="stat">
  <h3>통계</h3>
  <hr class="hrst">
  <ul class="tab">
    <li class="current" data-tab="tab1"><a href="#" id="sta">CATEGORY COUNT</a></li>
    <li data-tab="tab2"><a href="#" id="sta">PROJECT TOP 10</a></li>
    <li data-tab="tab3"><a href="#" id="sta">SPONSOR TOP 3</a></li>
  </ul>

    <div id="tab1" class="tabcontent current">
    <br>
      <h4><strong>카테고리 </strong>별 프로젝트 현황</h4>
	  <hr>
      <div class="stback">
      	<div id="chartdiv">
      		<input type="hidden" id="fundcount" value="${ cstat.fundcount }">
      		<input type="hidden" id="prodcount" value="${ cstat.prodcount }">
      	</div>	
      </div>
    </div>
    <div id="tab2" class="tabcontent">
    <br>
      <h4><strong>매출</strong> TOP 10</h4>
      <hr>
	  <div class="stback">
	  	<div id="chartdiv2">
	  		<c:forEach items="${ mstat }" var="mstat">
	  			<input type="hidden" name="project_name" value="${ mstat.project_name }">
	  		</c:forEach>
      	</div>
	  </div>
    </div>
    <div id="tab3" class="tabcontent">
    <br>
      <h4><strong>후원자</strong> TOP 3</h4>
      <hr>
	  <div class="stback">
	  	
	  </div>
    </div>
  </div>


<script>
$(function() {
	$('ul.tab li').click(function() {
		var activeTab = $(this).attr('data-tab');
		$('ul.tab li').removeClass('current');
		$('.tabcontent').removeClass('current');
		$(this).addClass('current');
		$('#' + activeTab).addClass('current');
	})
});
</script>

<c:import url="../footer.jsp"></c:import>

</body>
</html>