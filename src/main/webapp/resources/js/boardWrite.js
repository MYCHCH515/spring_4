/**
 * 
 */
	$("#btn").click(function(){
		var i1 = $("#title").val()
		var i2 = $("#writer").val()
		var i3 = $("#contents").val()
		
		var ch1 = false;
		var ch2 = false;
		var ch3 = false;
		
		if (i1 !=''){
			ch1 = true;
		}
		
		if (i2 !=''){
			ch2 = true;
		}
		
		if (i3 !=''){
			ch3 = true;
		}
		
		if(ch1&&ch2&&ch3){
			$("#frm").submit();
		}else{
			alert("필수 항목 입력해주세요");
		}
	
	});
