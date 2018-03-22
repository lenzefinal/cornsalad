	function detachValue2(){
			var t = arguments[0];
			
			$.each($(".form input[type='hidden']"),function(index){
				var pic=$(this);
				
				if(t.parent().attr("id") === pic.attr("value")){
					pic.prev().removeClass("ov");
					pic.remove();
				}
			});
			
			t.parent().remove();
	}

	function requiredTagSearch(parent,btn){
		var tagSearch = function(){
			return {
				parent:$(parent),
				btn:$(btn)
			}
		};
		
		tagSearch().btn.on("click",function(){
			var t = $(this);
			
			if(t.attr("class").match("ov")){
				t.removeClass("ov");
				detachValue(t);
			}else{
				if(tagSearch().parent.attr("data-type") != "multiple"){
					tagSearch().btn.removeClass("ov");
					removeValue(tagSearch().btn);
				}
				t.addClass("ov");
				attchValue(t);
			}

		});
		
		//-----카테고리 선택 시 input hidden으로 요소 추가--------//
		function attchValue(){
			var t = arguments[0];

			if(t.attr("name") !== undefined && t.attr("value") !== undefined){
				t.after('<input type="hidden" name="'+t.attr("name")+'" value="'+t.attr("value")+'">');
			}
			var picvalues="";
			picvalues+=$("#piclist").html()+'<a href="#" class="pic" data-filter-value="50000807" id="'+t.attr("value")+'">'+t.html()+'<span class="del" onclick="'+"var t=$(this); detachValue2(t);"+'">선택해제</span></a>';
		
			$("#piclist").html(picvalues);
		}
		
		function detachValue(){
			var t = arguments[0];
			t.next().remove();
			
			$.each($("#piclist a"), function(index){
				var pic = $(this);
				if(pic.attr("id") === t.attr("value")){
					pic.remove()
				}
			});
		}
		
		function removeValue(){
			var t = arguments[0];
			t.next().remove();
		}
		
	}	