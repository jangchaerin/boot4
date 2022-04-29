/**
 * 글 작성 시 첨부파일 관리하는 js
 */
 
 	let count = 0;
		$("#fileAdd")
				.click(
						function() {
							if (count > 4) {
								alert('첨부파일은 최대 5개 까지만 가능합니다.');
								return;
							}
							let f = ' <div class="row mb-3">';
							f = f
									+ ' <label for="contents" class="col-sm-2 col-form-label">Contents</label>';
							f = f + '<div class="col-sm-10">';
							f = f + '<div class="input-group">';
							f = f
									+ '<input type="file" class="form-control files" id="files" name="files" aria-describedby="inputGroupFileAddon04" aria-label="Upload">';
							f = f
									+ '<button class="btn btn-outline-secondary del" type="button" id="inputGroupFileAddon04">X</button>';
							f = f + '</div>';
							f = f + '</div>';
							f = f + '</div>';
							count++;

							$("#fileResult").append(f)
						});
		//속성 안에 ""이 있어서 ''으로 묶는다

		$("#fileResult").on("click", ".del", function() {
			$(this).parent().parent().parent().remove();
			count--;
		})