$(document).ready(function(){
	$("#myModal").modal({backdrop: 'static', keyboard: false});
});

function buttonEvent1(){
	var cbox = document.getElementsByName("check-b");
	var flag = true;
	
	for(var i=0; i<cbox.length; i++){
		$(cbox[i]).on("click",function(){
			for(var j=0; j<cbox.length; j++){
				if($(cbox[j]).prop("checked")){
					flag = false;
				}else{
					flag = true;
					break;
				}
			}
			
			if(flag == false){
				$("#closemodal").addClass("act");
				$("#closemodal").attr('disabled',false);
			}else{
				$("#closemodal").removeClass("act");
				$("#closemodal").attr('disabled',true);
			}
		});
	}
}

function checkboxEvent1(val){
	var id = "#ckrw"+val;
	var idata = $(id).attr("i-data");
	
	console.log(idata);
	
	if($(id).prop("checked")){
		console.log(id+"체크됨!");
		$("."+idata).removeClass("hidden");
	}else{
		console.log(id+"체크안됨");
		$("."+idata).addClass("hidden");
	}

}

function changeQty(flag, id){
	var qty = $("#qty"+id);
	var qValue = qty.val();
	
	if(flag=="minus"){
		if(qValue > 0){
			console.log(qValue-1);
			$(qty).val(qValue-1);
		}else{
			alert("수량을 선택하세요");
		}
	}else if(flag=="plus"){
		$(qty).val(qValue-0+1);
	}
}

function openPay(){
	var radio = $('input:radio[name=ra01]:checked').val();
	
	if(radio == "card"){
		window.open("payoption.do?popup=card",  "popupNo2", "status=no,toolbar=no,scrollbars=no,location=noS,width=700, height=500, left=300, top=200");
	}else if(radio == "kakao"){
		window.open("payoption.do?popup=kakao",  "popupNo2", "status=no,toolbar=no,scrollbars=no,location=noS,width=1000, height=800, left=300, top=200");
	}
	
}

$(function(){
	buttonEvent1();
});

