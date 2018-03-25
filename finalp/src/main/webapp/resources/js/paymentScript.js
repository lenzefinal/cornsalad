
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
		$("#qty"+val).val("0");
	}

}

function changeQty(flag, id){
	var qty = $("#qty"+id);
	var qValue = Number(qty.val());
	
	if(flag=="minus"){
		if(qValue > 0){
			
			$(qty).val(qValue-1);
			$(qty).trigger("change");
		}else{
			alertify.alert("수량을 선택하세요");
		}
	}else if(flag=="plus"){
		$(qty).val(qValue+1);
		$(qty).trigger("change");
	}
}

function openPay(p_name,m_id,p_id,g_ids,g_amounts,p_price){
	
	if($('#cktm04').is(':checked') == false){
		alertify.alert("필수사항을 확인하세요!");
	}else{
		var radio = $('input:radio[name=ra01]:checked').val();
	
	
		if(radio == "card"){
			window.open("payoption.do?popup=card&p_name="+p_name+"&m_id="+m_id+"&p_id="+p_id+"&g_ids="+g_ids+"&g_amounts="+g_amounts+"&p_price="+p_price+"&pay_option='card'",  "popupNo2", "status=no,toolbar=no,scrollbars=no,location=noS,width=700, height=600, left=300, top=100");
		}else if(radio == "kakao"){
			window.open("payoption.do?popup=kakao&p_name="+p_name+"&m_id="+m_id+"&p_id="+p_id+"&g_ids="+g_ids+"&g_amounts="+g_amounts+"&p_price="+p_price+"&pay_option='kakao'",  "popupNo2", "status=no,toolbar=no,scrollbars=no,location=noS,width=1000, height=800, left=300, top=100");
		}
	}
}

function refund(){
	var imp_id="4112304821735697";
	var imp_secret="Pa6KLq7gwfsSiXGw6pVG3Ttg42u7U3jKdpuZPBfmRIf9FWGMlCtpwWFAYaITd1Drr7qhIGEAoTJ4PqRa";
	var imp_uid = "imp_377854094073";
	
	$.ajax({
		url:"refund.do",
		type:"post",
		data:{ imp_id : imp_id, imp_secret : imp_secret, imp_uid : imp_uid },
		success: function(data){			
				

		},
		error: function(request, status, errorData){
			alert("error code : " + request.status + "/n"
					+"message : "+ request.responseText + "/n"
					+"errorData : "+ errorData);
		}
	});
}

function change_val(){

	var arr = document.getElementsByName('qty');
	var totalprice = new Array(arr.length);
	
	
	for(var i=0; i<arr.length;i++){
		totalprice[i]=0;
	}
	
	$(':text').on("change",function(){
		var finalprice = 0;
		var id = $(this).attr('id');
		
		var price = $("#"+id).attr('price');
		var qty = Number($("#"+id).val());
		var index = $("#"+id).attr('index');
		var maxP = Number($("#"+id).attr('maxP'));
		var capacity = Number($("#"+id).attr('capacity'));
		console.log(maxP);
		if(capacity != 0){
			if(qty > maxP){
				alertify.alert("최대 수량을 초과하였습니다.");
				$("#"+id).val(0);	
			}
		}else{
		
		totalprice[index] = price*qty;
		
		for(var i=0; i<arr.length;i++){
			finalprice += totalprice[i];
		}
		
		console.log(finalprice);
		
		$('#sumTotalNum').text(finalprice);
		$('#total_price').val(finalprice);
		console.log($('#total_price').val());
		}
	});
	
}

function secondPage(p_name,p_id,m_name){
	
	if(m_name == ''){
		alertify.alert("로그인이 필요한 서비스 입니다");
	}else{
		var t_price = $("#total_price").val();
	
		var arr = document.getElementsByName('qty');
		var g_ids = "";
		var g_amounts = "";
		
		for(var i =0; i<arr.length; i++){
			if($(arr[i]).val() != 0){
				var id = $(arr[i]).attr('id').replace('qty','');
				var amount = $(arr[i]).val();
				
				if(i == arr.length-1){
					g_ids += id;
					g_amounts += amount;
				}else{
					g_ids += id+",";
					g_amounts += amount+",";
				}
			}
		}
		console.log(g_ids);
		console.log(g_amounts);
	
		
		location.href="payment2.do?project_name="+p_name+"&p_id="+p_id+"&member_name="+m_name+"&total_account="+t_price
						+"&g_ids="+g_ids+"&g_amounts="+g_amounts;
	}
	
}




$(function(){
	buttonEvent1();
	change_val();
});

