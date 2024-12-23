<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>

<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<c:set var="resourcesPath" value="${ contextPath }/resources" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<title>푸드조아 회원 가입</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">
<style>
    .login { text-align: center; }
    .container { width: 1000px; margin: 0 auto; padding: 20px; }
    .input-container { display: flex; flex-direction: column; align-items: center; gap: 10px; }
    .input-container input { width: 300px; height: 40px; padding: 10px; font-size: 16px; border: 1px solid #ccc; border-radius: 5px; }
    .input-container input:focus { border-color: #BF917E; outline: none; }
    .joinButton { background-color: #BF917E; border: none; padding: 8px 16px; font-size: 14px; color: white; cursor: pointer; width: 90px; height: 30px; }
    .joinButton:hover { background-color: #BF917E; }
    .add { margin-top: 30px; }
    .file-input { display: none; }
    .file-button { background-color: #BF917E; border: none; padding: 4px 8px; font-size: 14px; color: white; cursor: pointer; height: 30px; margin-left: 10px; }
    .file-button:hover { background-color: #BF917E; }
</style>	

<script type="text/javascript">
    document.addEventListener('DOMContentLoaded', function () {
        const fileInput = document.getElementById('profileFile');
        const previewContainer = document.getElementById('previewContainer');
        const joinButton = document.querySelector('.joinButton');

        // 파일 선택 시 미리보기 처리
        fileInput.addEventListener('change', function (event) {
            const file = event.target.files[0];
            previewContainer.innerHTML = ''; // 기존 미리보기 초기화

            if (file && file.type.startsWith('image/')) {
                const reader = new FileReader();
                reader.onload = function (e) {
                    const img = document.createElement('img');
                    img.src = e.target.result;
                    img.alt = '미리보기 이미지';
                    img.style.maxWidth = '300px';
                    img.style.maxHeight = '300px';
                    previewContainer.appendChild(img);
                };
                reader.readAsDataURL(file);
            } else {
                previewContainer.innerHTML = '<span style="color: red;">이미지 파일만 선택 가능합니다.</span>';
            }
        });

        // 유효성 검사
        joinButton.addEventListener('click', function (event) {
            event.preventDefault(); // 기본 동작 방지

            const name = document.getElementById('name').value.trim();
            const nickname = document.getElementById('nickname').value.trim();
            const phone = document.getElementById('phone').value.trim();
            const email = document.getElementById('email').value.trim();
            const address = document.getElementById('sample4_roadAddress').value.trim();

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

            if (!address) {
                alert('주소를 입력해주세요.');
                return;
            }

            // 모든 유효성 검사를 통과한 경우 폼 제출
            document.querySelector('form').submit();
        });
    });

    // 파일명 업데이트 함수
    function updateFileName() {
        const fileInput = document.getElementById('profileFile');
        const profileInput = document.getElementById('profile');

        if (fileInput.files.length > 0) {
            profileInput.value = fileInput.files[0].name;
        }
    }

    // Daum 우편번호 API
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function (data) {
                const roadAddr = data.roadAddress; // 도로명 주소

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;  // 우편번호
                document.getElementById('sample4_roadAddress').value = roadAddr;    // 도로명 주소
            }
        }).open();
    }
</script>
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	
	
</head>
<body>
	<div id="container">

		<!-- 회원가입 폼 -->
		<form action="${ contextPath }/Member/joinPro" class="login" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
			<h2 class="loginHeading">푸드조아 회원 가입</h2>

			<div class="add">
				<h2>추가 정보 입력</h2>
			</div>
			<br><br>

			<!-- 사용자 정보 입력 폼 -->
			<div class="form-container">
				<!-- 프로필 사진 선택 -->
				<div class="preview-container" id="previewContainer"></div>
				<br>
				<div class="input-container">
					<input type="text" id="profile" name="profile" class="form-control" placeholder="프로필 사진을 넣어주세요" required readonly />
					<input type="file" name="profileFile" class="file-input" id="profileFile" onchange="updateFileName()" />
					<label for="profileFile" class="file-button">파일 선택</label>
				</div>
			

			
				<!-- 나머지 사용자 정보 입력 -->
				<div class="input-container">
					<input type="text" id="name" name="name" class="form-control" placeholder="이름을 입력해주세요" required />
					<input type="text" id="nickname" name="nickname" class="form-control" placeholder="닉네임을 입력해주세요" required />
					<input type="text" id="phone" name="phone" class="form-control" placeholder="휴대폰번호 입력해주세요" required />
					<input type="text" id="email" name="email" class="form-control" placeholder="이메일을 입력해주세요" required />
					
					<p id="addressInput"></p> 
					<input type="text" id="sample4_postcode" name="zipcode" class="form-control" placeholder="우편번호">
					<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="form-control"><br>					
					<input type="text" id="sample4_roadAddress" name="address1" placeholder="도로명주소" class="form-control">
					<input type="text" id="sample4_detailAddress" placeholder="상세주소" name="address2" class="form-control">
					
					<input type="text" id="recommender" name="recommender" class="form-control" placeholder="추천인 코드를 입력해주세요" />
					
				</div>

				<!-- 숨겨진 필드로 userId 전달 -->
				<input type="hidden" name="id" value="${ sessionScope.joinId }" /> 
				<br><br>
				<button class="joinButton" type="submit">회원가입</button>
			</div>
		</form>
	</div>






</body>


</html>
