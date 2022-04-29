/**
 * 
 */
 
 //textarea의 id가 다를경우 summernote를 초기화해주는 함수를 만들어줘라
 function summernoteInit(selector, code){	//selector라고 되어있는 부분에 id를 보낼것이다.
	
 	//summernote	
	$('#'+selector).summernote({	//'#'+'selector'그럼 이부분이 #id가 된다.
		height : 300
	});
	$('#datail').summernote("code",code);
	//$('#detail').summernote("code","${vo.productDetail}");  //textarea태그안에 써도되고 , 이렇게써도 됨
	
}

