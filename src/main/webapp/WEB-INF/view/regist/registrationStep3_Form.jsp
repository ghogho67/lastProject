<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<%@include file="/WEB-INF/view/common/joinCare.jsp"%>
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/bootstrap-rtl.min.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/bootstrap.min.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/flat-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/style-rtl.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/modern-forms-plus.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/livepreview.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/orange.css" />
<link rel="stylesheet" href="${cp}/resource/wrap/Test/cadetBlue.css" />
<link rel="stylesheet"	href="${cp}/resource/wrap/Test/font-awesome.min.css" />
<link rel="stylesheet"	href="//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css"/>
	
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
	$(document).ready(function() {

		var msg = '${msg}'; //메세지이므로 ''로 묶여야된다
		if (msg != '')
			alert(msg);
		
		
		//id중복체크
		$("#idCheckBtn").on("click",function(){
			var data = $('#mem_id').val();
			console.log(data);
			if(data==''||data==null){
				alert("아이디를 입력해주세요");
				return;
			}
			$.ajax({
				url: "${cp}/regist/idCheck",
				data : "mem_id="+data,
				success :  function(data){
					console.log(data);
					if(data.mem_id == "mem_id"){
						alert("아이디를 정규식에 맞게 입력해 주세요");
						$("#mem_id").val("");
						$("#mem_id").focus();
						return;
					}
					if(data.mem_id == "yes"){
						alert("사용가능한 아이디입니다");
					}else{
						alert("사용 불가능한 아이디 입니다");
						$('#mem_id').val("");
						$('#mem_id').focus();
					}
				}
			});
			
		});
		
		//정규식체크 및 회원가입 
		$("#trans").on("click", function(){
			var frmData = $("#frm").serialize();
			var dis_ids = new Array();
			console.log(frmData);
			
			$("input[name=dis_id]:checked").each(function() {
				dis_ids.push($(this).val());

			});
			
			$("#dis_ids").val(dis_ids);
			console.log($("#dis_ids").val());
			
			if($("#mem_id").val()==''||$("#mem_id").val()==null){
				alert("아이디를 입력해주세요");
				return;
			} else if($("#mem_pass").val()==''||$("#mem_pass").val()==null){
				alert("패스워드를 넣어주세요");
				return;
			} else if($("#mem_nm").val()==''||$("#mem_nm").val()==null){
				alert("입력값을 넣어주세요");
				return;
			}else if($("#mem_phone").val()==''||$("#mem_phone").val()==null){
				alert("입력값을 넣어주세요");
				return;
			}else if($("#mem_mail").val()==''||$("#mem_mail").val()==null){
				alert("입력값을 넣어주세요");
				return;
			}
			console.log(frmData);
			$.ajax({
				url : "${cp}/regist/regist3",
// 				data : frmData+"&dis_ids="+dis_ids,
				data : frmData,
				type : "post",
				success : function(data){
					console.log(data);
	
					if(data == "mem_pass"){
						alert("패스워드를 정규식에 맞게 입력해 주세요");
						$("#mem_pass").val("");
						$("#mem_pass").focus();
						return;
					}
					if(data == "mem_nm"){
						alert("이름을 정규식에 맞게 입력해 주세요");
						$("#mem_nm").val("");
						$("#mem_nm").focus();
						return;
					}
					if(data == "mem_phone"){
						alert("휴대폰 번호를 정규식에 맞게 입력해 주세요");
						$("#mem_phone").val("");
						$("#mem_phone").focus();
						return;
					}
					if(data == "mem_mail"){
						alert("이메일을 정규식에 맞게 입력해 주세요");
						$("#mem_mail").val("");
						$("#mem_mail").focus();
						return;
					}
					if(data == 'success'){
						console.log("suc")
// 						location.href = "${cp}/regist/regist4"
// 						$("#frm").attr("action", "${cp}/regist/regist4");
// 						$("#frm").attr("method", "post");
						$("#frm").submit();
						
						console.log("suc2")
					}else{
						console.log('fal')
						return;
					}
				},error : function(xhr){
					alert(xhr.status);
				}
				
			});
			
		});
		
		

		//주소찾기
		$("#addrSearchBtn").on("click", function() {
			new daum.Postcode({
				oncomplete : function(data) {
					//주소 input value에 설정data.roadAddress
					console.log(data);
					$("#mem_addr1").val(data.jibunAddress);
					//우편번호 input value에 설정data.zonecode
					$("#mem_zipcd").val(data.zonecode);

					console.log(data.roadAddress);
					console.log(data.zonecode);

				}

			}).open();
		});
		

		
		//home
		$("#home").on("click", function(){
			$("#frm").attr("action", "${cp}/login");
			$("#frm").attr("method", "get");
			$("#frm").submit();
			
		});
		
		
		//캡차API
		captcha();
		$("#btn01").on("click",function(){
			var form01Data = $("#form01").serialize();
			console.log(form01Data);
			$.ajax({
				url : "/regist/captchaNkeyResult",
				data : "key="+$('#key').val()+"&value="+$('#value').val(),
				dataType:"json",
				success : function(data) {
					console.log(data);
					if(data.result==1){
						alert("인증성공");
					}else{
						alert("실패");
					}
				}
			});
		});
		
		$("#refresh").on("click",function(){
			captcha();
		});
	});
	
	function captcha() {
		$.ajax({
			method : 'post',
			url : "/regist/captchaNkey",
			dataType:"json",
			success : function(data) {
				
				console.log(data.key);
				$("#key").val(data.key);
				
				$.ajax({
					url : "/regist/captchaImage",
					method : 'get',
					data : "key=" + data.key ,
					success : function(data) {
						console.log(data);
						console.log(data.captchaImageName);
						$("#div01").html("<img src='${cp}/captchaImage/"+data.captchaImageName+"'>");
					},error : function(xhr) {
						alert('에러'+xhr.status);
					}
				});
			},error : function(xhr) {
				alert('에러'+xhr.status);
			}
		});
		
	}
</script>
</head>
<body>
<%-- 	<form id="frm2" method="post" action="${cp}/regist/regist4"> --%>
<!-- 	</form> -->


	<section class="memberjoin">
		<div class="memberjoin-in">
			<h5 class="memberjoin-title ng-binding">회원가입(일반회원)</h5>
			<ul>
				<li class="memberjoin01 ">01.가입종류선택</li>
				<li class="right-arrow"></li>
				<li class="memberjoin02 ">02.약관동의</li>
				<li class="right-arrow"></li>
				<li class="memberjoin03 active ">03.정보입력</li>
				<li class="right-arrow"></li>
				<li class="memberjoin04">04.가입완료</li>
			</ul>
		</div>


		<div class="wrap-offset">
			<div class="container-fluid">
				<form id="frm" method="post" action="${cp}/regist/regist5" name="dataform"
					class="modern-p-form modern-ao-form-rtl p-form-modern-cadetBlue" enctype="multipart/form-data">
					<div data-base-class="p-form" class="p-form p-shadowed p-form-md">

						<div class="p-title" data-base-class="p-title">
							<span data-p-role="title" class="p-title-line">회원가입&nbsp;&nbsp;<i
								class="fa fa-list"></i></span>
						</div>

						<div class="p-subtitle text-right" data-base-class="p-subtitle">
							<span data-p-role="subtitle" class="p-title-side">필수입력 사항</span>
						</div>
						<div>
							<div class="row">

								<div class="col-sm-6">
									<div class="form-group">
										<label for="text">Id</label>
										
										<div class="input-group" >
											<span class="input-group-btn"><button type="button"
													class="btn" id="idCheckBtn">중복확인</button></span> 
													<input type="text" id="mem_id" name="mem_id" value="${mem_id}"
												placeholder="4~20자리 영문,숫자 /첫글자는 영문"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
										</div>
										
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="password">비밀번호</label>
										<div class="input-group p-has-icon">
											<input type="password" id="mem_pass" name="mem_pass"
												value="${mem_pass }" placeholder="영문 숫자 특수문자 조합 8글자이상"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-lock"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">이름</label>
										<div class="input-group p-has-icon">
											<input type="text" id="mem_nm" name="mem_nm"
												value="${mem_nm }" placeholder="이름을 입력하세요 (2-5글자)"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">핸드폰 번호</label>
										<div class="input-group p-has-icon">
											<input type="tel" id="mem_phone" name="mem_phone"
												value="${mem_phone }" placeholder="000-0000-0000형식으로 입력하세요"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">이메일</label>
										<div class="input-group p-has-icon">
											<input type="email" id="mem_mail" name="mem_mail"
												value="${mem_mail }" placeholder="이메일을 입력해 주세요"
												class="form-control"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								

									<div class="col-sm-6">
										<div class="form-group">
										<label for="email1">생년월일</label>
											<div class="input-group p-has-icon">
												<input type="text" id="mem_birth" name="mem_birth"
													placeholder="YYYY/MM/DD형식으로 입력해 주세요" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>


								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">주소</label>
										<div class="input-group p-has-icon">
											<input type="text" id="mem_addr1" name="mem_add1"
												placeholder="주소" class="form-control" value="${mem_addr1 }"
												readonly> <span class="input-group-state"><span
												class="p-position"><span class="p-text"><span
														class="p-valid-text"><i class="fa fa-check"></i></span> <span
														class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
												class="p-field-cb"></span> <span class="input-group-icon"><i
												class="fa fa-check"></i></span>
										</div>
										<div>
											<button id="addrSearchBtn" type="button">주소검색</button>
										</div>

									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">상세주소</label>
										<div class="input-group p-has-icon">
											<input type="text" id="mem_addr2" name="mem_add2"
												placeholder="상세주소" class="form-control"
												value="${mem_addr2 }"> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">우편번호</label>
										<div class="input-group p-has-icon">
											<input type="text" id="mem_zipcd" name="mem_zipcd"
												placeholder="우편번호" class="form-control"
												value="${mem_zipcd }" readonly> <span
												class="input-group-state"><span class="p-position"><span
													class="p-text"><span class="p-valid-text"><i
															class="fa fa-check"></i></span> <span class="p-error-text"><i
															class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
											<span class="input-group-icon"><i class="fa fa-check"></i></span>
										</div>
									</div>
								</div>



								<div class="col-sm-6">
									<div class="form-group">
										<label for="email1">성별</label>
										<div class="checkbox">

											<label><input type="radio" name="mem_gender" value="M">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">남</span></label>

											<label><input type="radio" name="mem_gender" value="F">
												<span class="p-check-icon"><span
													class="p-check-block"></span></span> <span class="p-label">여</span></label>

										</div>

									</div>
								</div>




							</div>





							<div>
								<div class="p-subtitle text-right" data-base-class="p-subtitle">
									<span data-p-role="subtitle" class="p-title-side">추가 입력
										사항</span>
								</div>



								<div class="col-sm-13">
									<div class="form-group">
										<label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;질병</label>
										<div class="p-form-cg pt-form-inline">
											<div class="checkbox">

												<label><input type="checkbox" name="dis_id"
													value="1"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">중풍</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="2"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">심부전증</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="3"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">당뇨</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="4"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">고혈압</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="5"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">치매</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="6"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">파킨슨</span></label>
											</div>

											<div class="checkbox">
												<label><input type="checkbox" name="dis_id"
													value="7"> <span class="p-check-icon"><span
														class="p-check-block"></span></span> <span class="p-label">부정맥</span></label>
											</div>


										</div>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="form-group">
										<label for="url">프로필 사진</label>
										<div class="p-file-wrap">
											<input type="file" id="profile" name="profile"
												placeholder="select file..."
												onchange="document.getElementById('fileupload1-fake').value = this.value">
											<div class="input-group">
												<span class="input-group-btn"><button type="button"
														class="btn">browse</button></span> <input type="text"
													id="fileupload1-fake" placeholder="프로필 사진을 등록하세요"
													readonly="readonly" value="${mem_photo_nm }" class="form-control p-ignore-field">
												<span class="input-group-state"><span
													class="p-position"><span class="p-text"><span
															class="p-valid-text"><i class="fa fa-check"></i></span> <span
															class="p-error-text"><i class="fa fa-times"></i></span></span></span></span> <span
													class="p-field-cb"></span>
											</div>
										</div>
									</div>
								</div>

							</div>

						</div>


						<div class="clearfix">
							<div class="p-subtitle text-right" data-base-class="p-subtitle">
								<span data-p-role="subtitle" class="p-title-side">보호자
									인적사항</span>
							</div>


							<div>

								<div class="row">
									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="text" id="pro_nm" name="pro_nm"
													placeholder="보호자성함" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>
									</div>



									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="email" id="pro_phone" name="pro_phone"
													placeholder="보호자연락처" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>

									<div class="col-sm-6">
										<div class="form-group">
											<div class="input-group p-has-icon">
												<input type="email" id="pro_relation" name="pro_relation"
													placeholder="보호자관계" class="form-control"> <span
													class="input-group-state"><span class="p-position"><span
														class="p-text"><span class="p-valid-text"><i
																class="fa fa-check"></i></span> <span class="p-error-text"><i
																class="fa fa-times"></i></span></span></span></span> <span class="p-field-cb"></span>
												<span class="input-group-icon"><i class="fa fa-check"></i></span>
											</div>
										</div>

									</div>



								</div>


<!-- 								<div class="form-group"> -->
<!-- 									<div class="checkbox"> -->
<!-- 										<label><input type="checkbox" id="terms" name="terms"> -->
<!-- 											<span class="p-check-icon"><span class="p-check-block"></span></span> -->
<!-- 											<span class="p-label">이용약관, 개인정보 수집 및 이용에 모두 -->
<!-- 												동의합니다.&nbsp;&nbsp; &nbsp; <a href="#" target="_blank">이용약관 -->
<!-- 													& 개인정보 약관 보기</a> -->
<!-- 										</span></label> -->
<!-- 									</div> -->
<!-- 								</div> -->

									

								<input type="hidden" name="dis_ids" id="dis_ids" value="">


					<div id="div01">
					</div>
					<button type="button" id="refresh">새로고침</button><br>
						<input type="hidden" id="key" name="key">
						<input type="text" name="value" id="value">
						<button type="button" id="btn01">전송</button>



								<div class="preview-btn text-left p-buttons">
									<button class="btn" id="trans" type="button">submit</button>
									<button class="btn" id="reset" type="reset">reset</button>
									<button class="btn" id="home" type="submit">home</button>
								</div>
							</div>
			
						</div>
					</div>
				
				
				
				</form>
				
				
				
			</div>
		</div>
		
	


	</section>








</body>
</html>