<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
    
    String combinedNo = request.getParameter("combinedNo");
    String combinedQuantity = request.getParameter("CombinedQuantity");

    // 데이터 파싱
    String[] noArray = combinedNo.split(",");
    String[] quantityArray = combinedQuantity.split(",");

%>

<c:set var="contextPath" value="${ pageContext.request.contextPath }" />
<c:set var="resourcesPath" value="${ contextPath }/resources" />

<jsp:useBean id="stringParser" class="Common.StringParser" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 페이지</title>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://cdn.iamport.kr/v1/iamport.js"></script>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200..900&display=swap"
	rel="stylesheet">
<link rel="stylesheet" href="${resourcesPath}/css/member/payment.css">
</head>

<body>
	<div class="payment-container">
		<!-- 결제 내용 -->
		<div class="left-area">
			<h1>결제 내용</h1>
			<table width="100%">
				<c:choose>
					<c:when test="${empty orders}">
						<tr>
							<td>선택한 물품이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach var="order" items="${orders}" varStatus="status">
						    <c:set var="mealkit" value="${order}" />
						    <c:set var="quantity" value="${order.quantity}" />
						    <c:set var="totalPrice" value="${quantity * order.price}" />
						     <c:set var="purchasePrice" value="${purchasePrice + totalPrice}" />
						    <tr>
						        <td>
						            <div class="purchase-cell">
						                <table width="100%">
						                    <tr>
						                        <td rowspan="4" width="200px">
						                            <div class="thumbnail-area">
						                               <a href="${ contextPath }/Mealkit/info?no=${order.no}">
								                            <c:set var="thumbnail" value="${ stringParser.splitString(order.pictures)[0] }" />
								                            <img src="${ resourcesPath }/images/mealkit/thumbnails/${order.no}/${thumbnail}">
								                        </a>
						                            </div>
						                        </td>
						                        <td>
						                            <div class="title-area">                  
						                             		<c:choose>
						                                        <c:when test="${mealkit.category == 1}">[한식]</c:when>
						                                        <c:when test="${mealkit.category == 2}">[일식]</c:when>
						                                        <c:when test="${mealkit.category == 3}">[중식]</c:when>
						                                        <c:when test="${mealkit.category == 4}">[양식]</c:when>
						                                    </c:choose> 
						                            ${mealkit.title}</div>
						                        </td>
						                    </tr>
						                    <tr>
						                        <td>
						                            <div class="nickname-area">판매자 : ${order.nickname}</div>
						                        </td>
						                    </tr>
						                    <tr>
						                        <td>
						                            <div class="price-area">
						                                개당&nbsp;
						                                <fmt:formatNumber value="${mealkit.price}" type="number" groupingUsed="true" maxFractionDigits="0" />
						                                원
						                            </div>
						                            <div class="quantity-area">주문 수량: ${quantity}</div>
						                        </td>
						                    </tr>
						                    <tr>
						                        <td>
						                            <div class="total-price">
						                                총&nbsp; <span> 
						                                    <fmt:formatNumber value="${totalPrice}" type="currency" currencySymbol="₩" groupingUsed="true" maxFractionDigits="0" />
						                                </span> 원
						                            </div>
						                        </td>
						                    </tr>
						                </table>
						            </div>
						        </td>
						    </tr>
						</c:forEach>

					</c:otherwise>
				</c:choose>
			</table>
		</div>

		<!-- 구매자 정보 -->
		<div class="right-area">
			<h1>구매자 정보</h1>
			<h3>이름</h3>
			<input type="text" value="${myInfo.name}" placeholder="이름" required>
			<h3>연락처</h3>
			<input type="text" value="${myInfo.phone}" placeholder="연락처" required>
			<br>
			<h3>배송지</h3>
			<input type="text" id="sample4_postcode" value="${myInfo.zipcode}"
				placeholder="우편번호" required> <br> <input type="text"
				id="sample4_roadAddress" value="${myInfo.address1}"
				placeholder="도로명 주소" required> <br> <input type="text"
				id="sample4_detailAddress" value="${myInfo.address2}"
				placeholder="상세 주소" required> <br>

			<div class="purchase-area">
				<div class="purchase-price">
					<h2>결제 금액</h2>
					<span> <fmt:formatNumber value="${purchasePrice}"
							type="currency" currencySymbol="₩" groupingUsed="true"
							maxFractionDigits="0" />
					</span>
				</div>
				<div class="purchase-button-area">
					<input type="button" value="구매" onclick="onPurchase(event)">
					<input type="button" value="취소" onclick="onCancle(event)">
				</div>
			</div>
		</div>
	</div>
	
	
	<script>
	    function onCancle(e) {
	        e.preventDefault();
	        console.log("결제 취소 전에 들어옴");
	        if (confirm('결제를 취소하시겠습니까?')) {
	            history.go(-1);
	        }
	    }
	
	    function onPurchase(e) {
	        e.preventDefault();
	
	        if (confirm("구매 하시겠습니까?")) {
	            // 고유한 결제 번호 생성
	            var today = new Date();
	            var hours = today.getHours();
	            var minutes = today.getMinutes();
	            var seconds = today.getSeconds();
	            var milliseconds = today.getMilliseconds();
	            var makeMerchantUid = '' + hours + '' + minutes + '' + seconds + '' + milliseconds; // 결제 고유 번호
	
	            // 아임포트 초기화
	            IMP.init("imp78768038");
	
	            IMP.request_pay({
	                pg: 'kakaopay.TC0ONETIME', // PG사 코드
	                pay_method: 'card', // 결제 방식
	                merchant_uid: "IMP" + makeMerchantUid, // 결제 고유 번호
	                name: "총 주문", // 결제 명칭
	                amount: ${purchasePrice},
	            }, async function (rsp) {
	                if (rsp.success) {
	                    console.log(rsp); // 결제 성공 시 응답 로그
	
	                 // 주문 정보
	                    let initNos = [<c:forEach items="${orders}" var="item" varStatus="status">'${item.no}'${!status.last ? ',' : ''}</c:forEach>];
	                    let initQuantities = [<c:forEach items="${orders}" var="item" varStatus="status">'${item.quantity}'${!status.last ? ',' : ''}</c:forEach>];
	                    let address = $("#sample4_postcode").val() + " " + $("#sample4_roadAddress").val() + " " + $("#sample4_detailAddress").val();

	                    $.ajax({
	                        url: '${contextPath}/Member/insertMyOrder',
	                        type: "POST",
	                        async: true,
	                        data: {
	                        	'mealkitNos[]': initNos,
	                            'quantities[]': initQuantities,
	                            address: address,
	                            isCart: '${isCart}'
	                        },
	                        dataType: "text",
	                        success: function (response) {	                        
	                            if (response > 0) {
									console.log('결제가 성공적으로 완료되었습니다.');
									alert('결제가 성공적으로 완료되었습니다.');
									location.href = '${contextPath}/Member/mydelivery';
			        	        }
			        	        else {
			        	            alert('결제는 성공했지만 DB 저장 중 오류가 발생했습니다.');
			        	        }
	                        },
	                        error: function (xhr, status, error) {
	                            console.error("AJAX 요청 실패: " + status + ", " + error);
	                            alert('결제 처리 중 오류가 발생했습니다.');
	                        }
	                    });
	                }
	            });
	        }
	    }
	
	    // 우편번호 찾기 API 호출
	    function sample4_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function (data) {
	                var roadAddr = data.roadAddress; // 도로명 주소
	
	                document.getElementById('sample4_postcode').value = data.zonecode; // 우편번호
	                document.getElementById("sample4_roadAddress").value = roadAddr; // 도로명 주소
	            }
	        }).open();
	    }
	</script>

</body>
</html>
