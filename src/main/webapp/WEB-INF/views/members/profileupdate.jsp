<%@page import="com.foodjoa.member.vo.MemberVO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
request.setCharacterEncoding("UTF-8");
response.setContentType("text/html; charset=utf-8");

%>
<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<c:set var="resourcesPath" value="${ contextPath }/resources" />
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>회원 정보 수정</title>
	<script src="http://code.jquery.com/jquery-latest.min.js"> </script>
	<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200..900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="${ resourcesPath }/css/member/profileupdate.css">
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		let selectedFile;
	
		$(function() {
			const fileInput = document.getElementById('fileInput');
		    const previewContainer = document.getElementById('previewContainer');
		
		    fileInput.addEventListener('change', function (event) {
		    	selectedFile = event.target.files[0];
		        previewContainer.innerHTML = ''; // 기존 미리보기 초기화
		
		        if (selectedFile && selectedFile.type.startsWith('image/')) {
		            const reader = new FileReader();
		            reader.onload = function (e) {
		                const img = document.createElement('img');
		                img.src = e.target.result;
		                img.alt = '미리보기 이미지';
		                img.style.maxWidth = '200px';
		                img.style.maxHeight = '200px';
		                previewContainer.appendChild(img);
		            };
		            reader.readAsDataURL(selectedFile);
		        } else {
		            previewContainer.innerHTML = '<span style="color: red;">이미지 파일만 선택 가능합니다.</span>';
		        }
		    });
		   
		    // 제출 버튼 유효성 검사
		    $("#submitBtn").click(function(event) {
		        event.preventDefault();

		        const name = document.getElementById('name').value.trim();
		        const nickname = document.getElementById('nickname').value.trim();
		        const phone = document.getElementById('phone').value.trim();
		        const email = document.getElementById('email').value.trim();
		        const postcode = document.getElementById('zipcode').value.trim();
		        const address = document.getElementById('address1').value.trim();
		        const detailAddress = document.getElementById('address2').value.trim();

		        if (name.length < 2 || name.length > 10) {
		            alert('이름은 2자 이상, 10자 이하로 입력해주세요.');
		            return;
		        }
		        if (nickname.length < 2 || nickname.length > 10) {
		            alert('닉네임은 2자 이상, 10자 이하로 입력해주세요.');
		            return;
		        }
		        const phoneRegex = /^\d{10,11}$/;
		        if (!phoneRegex.test(phone)) {
		            alert('전화번호는 10~11자리 숫자로 입력해주세요.');
		            return;
		        }
		        const emailRegex = /^[\w._%+-]+@[a-zA-Z\d.-]+\.(com|net)$/;
		        if (!emailRegex.test(email)) {
		            alert('유효한 이메일을 입력해주세요. (예: foodjoa@test.com)');
		            return false;
		        }
		        if (!zipcode) {
		            alert('주소(우편번호)를 입력해주세요.');
		            return;
		        }
		        if (!address1) {
		            alert('주소를 입력해주세요.');
		            return;
		        }
		        if (!address2) {
		            alert('상세주소를 입력해주세요.');
		            return;
		        }

		        onSubmit();
		    });

		    // 취소 버튼 클릭 동작
		    $(".btn-cancel").click(function(event) {
		        event.preventDefault(); // 기본 클릭 이벤트 방지
		        const confirmCancel = confirm('수정을 취소하시겠습니까?');
		        if (confirmCancel) {
		            window.location.href = "${ contextPath }/Member/mypagemain";
		        }
		    });
			
			function onSubmit() {
				
				const formData = new FormData();
				
				formData.append('id', '${ sessionScope.userId }');
				formData.append('name', $("#name").val());
				formData.append('nickname', $("#nickname").val());
				formData.append('phone', $("#phone").val());
				formData.append('email', $("#email").val());
				formData.append('zipcode', $("#zipcode").val());
				formData.append('address1', $("#address1").val());
				formData.append('address2', $("#address2").val());
				
				formData.append('originProfile', '${vo.profile}');
				formData.append('file', selectedFile);
				
				$.ajax({
					url: '${ contextPath }/Member/updatePro',
					type: 'POST',
					data: formData,
					dataType: 'text',
				    processData: false,
				    contentType: false,
				    success: function(responseData) {
						if (responseData != "0") {
							alert('정보를 수정했습니다.');
							location.href = '${ contextPath }/Member/mypagemain';	
						}
						else {
							alert('정보 수정에 실패했습니다.');
						}
				    },
				    error: function(error) {
				        console.log("error", error);
						alert('정보 수정 중 통신 에러 발생');
				    }
				});
			}
		});
	</script>
</head>

<body>
	<div class="form-container">
		<h2>정보 수정</h2>
		<!-- JavaScript로 미리보기 기능 구현 -->
		<form action="${contextPath}/Member/updatePro" method="post" enctype="multipart/form-data" name="updatePro">
			<input type="hidden" id="origin-profile" name="originProfile" value="${vo.profile}">

			<!-- 파일 선택 버튼 -->
			<input type="file" accept=".jpg, .jpeg, .png" class="profile" id="fileInput" name="profile">
			<!-- 미리보기 컨테이너 -->
			<div class="preview-container" id="previewContainer" style="margin-top: 10px;"></div>

			<div class="form-group">
				<label for="name">이름</label>
				<input type="text" id="name" name="name" value="${vo.name}" placeholder="2자 이상 10자 미만으로 입력해주세요" required>
			</div>
			<div class="form-group">
				<label for="nickname">닉네임</label>
				<input type="text" id="nickname" name="nickname" value="${vo.nickname}" placeholder="2자 이상 10자 미만으로 입력해주세요" required>
			</div>
			<div class="form-group">
				<label for="phone">번호</label>
				<input type="text" id="phone" name="phone" value="${vo.phone}" placeholder="-없이 입력해주세요" required>
			</div>
			<div class="form-group">
				<label for="phone">이메일</label>
				<input type="text" id="email" name="email" value="${vo.email}" placeholder="이메일 형식으로 입력해주세요" required>
			</div>
			<div class="form-group">
				<input type="text" id="zipcode" name="zipcode" class="form-control" placeholder="우편번호" value="${vo.zipcode }">
				<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control address-find"><br>					
				<input type="text" id="address1" name="address1" placeholder="도로명주소" class="form-control" value="${vo.address1 }">
				<input type="text" id="address2" placeholder="상세주소" name="address2" class="form-control" value="${vo.address2 }">
			</div>
			<div class="btn-container">
				<button type="submit" class="profile-update-btn-submit" id="submitBtn">제출</button>
				<button type="button" class="profile-update-btn-cancel">취소</button>
			</div>
		</form>
	</div>
	
	
	<script>
		function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function (data) {
	                const roadAddr = data.roadAddress; // 도로명 주소
	
	                // 우편번호와 주소 정보를 해당 필드에 넣는다.
	                document.getElementById('zipcode').value = data.zonecode;  // 우편번호
	                document.getElementById('address1').value = roadAddr;    // 도로명 주소
	            }
	        }).open();
	    }
	</script>
</body>

</html>
