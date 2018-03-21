

	function detachValue2(){
			var t = arguments[0];
			//alert(t.parent().attr("id"));
			
			
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
	
	
		function getParameter(strParamName){
			var arrResult = null;

			if(strParamName){
				arrResult = location.search.match(new RegExp("[&?]" + strParamName + "=(.*?)(&|$)"));
			}

			return arrResult && arrResult[1] ? arrResult[1] : null;
		}

		var tagSearch = function(){
			return {
				parent:$(parent),
				btn:$(btn)
			}
		};

		function attchValue(){
			var t = arguments[0];

			if(t.attr("name") !== undefined && t.attr("value") !== undefined){
				t.after('<input type="hidden" name="'+t.attr("name")+'" value="'+t.attr("value")+'">');
			}
			var picvalues="";
			picvalues+=$("#piclist").html()+'<a href="#" class="pic" data-filter-value="50000807" id="'+t.attr("value")+'">'+t.html()+'<span class="del" onclick="'+"var t=$(this); detachValue2(t);"+'">선택해제</span></a>';
			//console.log("picvalues" + picvalues);
			
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
		
		/*var topic = $(".topicSelect");
		var tagList = $(".findTagList");
*/
		tagSearch().btn.on("click",function(){
			var t = $(this);

			if(t.attr("class").match("ov") && tagSearch().parent.attr("data-type") === "multiple"){
				t.removeClass("ov");
				detachValue(t);

				return false;
			}

			

			if(t.attr("class").match("ov") && tagSearch().parent.find(".ov").size() > 1){
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


	
	}	