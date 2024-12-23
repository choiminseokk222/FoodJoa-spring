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

<jsp:useBean id="stringParser" class="Common.StringParser" />

<!DOCTYPE html>
<html>
<head>
    <title>장바구니</title>
    
    <script src="http://code.jquery.com/jquery-latest.min.js"></script>    
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+KR:wght@200..900&display=swap" rel="stylesheet">
    <style>
        .cartlist-container table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            font-family: "Noto Serif KR", serif;
        }
        .cartlist-container table, .cartlist-container th, .cartlist-container td {
            border: 1px solid black;
            font-family: "Noto Serif KR", serif;
        }
        .cartlist-container th, .cartlist-container td {
            padding: 12px;
            text-align: center;
            font-family: "Noto Serif KR", serif;
        }

        .cartlist-container th {
            background-color: #BF917E;
            font-family: "Noto Serif KR", serif;
        }

        .cartlist-container  {
            width: 1200px;
            margin: 0 auto; /* 가운데 정렬 */
            font-family: "Noto Serif KR", serif;
        }

        .cartlist-container .btn {
            background-color: #BF917E;
            color: white;
            padding: 10px 15px;
            border: none;
            cursor: pointer;
            font-family: "Noto Serif KR", serif;
        }

        .cartlist-container .btn:hover {
            background-color: #45a049;
        }

        .cartlist-container .form-inline input[type="number"] {
            width: 60px;
            font-family: "Noto Serif KR", serif;
        }

        .cartlist-container .checkbox {
            width: 20px;
            height: 20px;
        }
        
        .payment-form-area {
            width: 100%;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100px;
        }
        
        .thumbnail-area {
            width: 100%;
            display: flex;
            justify-content: center;
        }
        .thumbnail-image {
            width: 150px;
            height: 150px;
            overflow: hidden;
        }
        
        .thumbnail-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        .cartlist-nodata {
        	margin-top: 30px;
        	width: 100%;
        	height: 400px;
        	line-height: 400px;
        	text-align: center;
        	font-size: 1.25rem;
        	border: 1px solid #BE917E;
        	border-radius: 5px;
        }
    </style>
</head>
<body>

<div class="cartlist-container">
    <h2>장바구니</h2>
    
    <c:if test="${not empty cartListInfos}">
        <table>
            <thead>
                <tr>
                    <th><input type="checkbox" id="selectAll" onclick="toggleSelectAll()"> 전체 선택</th>
                    <th>상품명</th>
                    <th>판매자</th>
                    <th>가격</th>
                    <th>수량</th>
                    <th>총액</th>
                    <th>삭제</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${cartListInfos}" varStatus="status">
                    <tr>
                        <td><input type="checkbox" class="itemCheckbox" value="${item.mealkitVO.no}" onclick="onCheckboxButton(this, ${item.mealkitVO.no}, ${item.quantity})"></td>
                        <td align="center">
                            <div class="thumbnail-area">
                                <div class="thumbnail-image">
                                    <a href="${ contextPath }/Mealkit/info?no=${item.mealkitVO.no}">
                                        <c:set var="thumbnail" value="${ stringParser.splitString(item.mealkitVO.pictures)[0] }" />
                                        <img src="${ resourcesPath }/images/mealkit/thumbnails/${item.mealkitVO.no}/${thumbnail}">
                                    </a>
                                </div>
                            </div>
                            <br>
                              <c:choose>
                                        <c:when test="${item.mealkitVO.category == 1}">[한식]</c:when>
                                        <c:when test="${item.mealkitVO.category == 2}">[일식]</c:when>
                                        <c:when test="${item.mealkitVO.category == 3}">[중식]</c:when>
                                        <c:when test="${item.mealkitVO.category == 4}">[양식]</c:when>
                              </c:choose> 
                            ${item.mealkitVO.title}
                        </td>
                        <td>${item.memberVO.nickname}</td>      
                        <td data-price="${item.mealkitVO.price}">${item.mealkitVO.price}</td>
                      
                             <td>
							    <form action="${ contextPath }/Member/updateCartList" method="post" class="cart-update-form">
							        <input type="number" name="quantity" value="${item.quantity}" min="1" max="${item.mealkitVO.stock}" onchange="processQuantityChanged(this, ${status.index}, ${item.mealkitVO.price}, this.form)">
							        <input type="hidden" name="mealkitNo" value="${item.mealkitVO.no}">
							        <input type="hidden" name="userId" value="${sessionScope.userId}">
							    </form>
							</td>

                        <td>
                            <div class="itemTotal">
                                ${item.mealkitVO.price * item.quantity}
                            </div>
                        </td>
                        <td>
                            <form action="${ contextPath }/Member/deleteCartList" method="post" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                <input type="hidden" name="mealkitNo" value="${item.mealkitVO.no}">
                                <input type="hidden" name="userId" value="${sessionScope.userId}"> 
                                <input type="submit" value="삭제" class="btn" style="background-color: #BF917E;">
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- 결제 폼 -->
        <div class="payment-form-area">
		    <form id="checkoutForm" action="${contextPath}/Member/payment" method="post">
		        <input type="hidden" name="isCart" value="1" />
		        <input type="hidden" name="combinedNo" id="selectedMealkitNos" />
		        <input type="hidden" name="CombinedQuantity" id="selectedMealkitQuantities" />
		        <input type="submit" value="결제하기" class="btn" onclick="onSubmit(event)" />
		    </form>
		</div>
    </c:if>

    <c:if test="${empty cartListInfos}">
    	<div class="cartlist-nodata">
    		장바구니에 상품이 없습니다.
    	</div>
    </c:if>
</div>

<script>
    let initNos = [<c:forEach items="${cartListInfos}" var="item" varStatus="status">'${item.mealkitVO.no}'${!status.last ? ',' : ''}</c:forEach>];
    let initQuantities = [<c:forEach items="${cartListInfos}" var="item" varStatus="status">'${item.quantity}'${!status.last ? ',' : ''}</c:forEach>];
    
    function onSubmit(e) {
        e.preventDefault();
        
        let selectedNos = [];
        let selectedQuantities = [];
        
        $(".itemCheckbox").each(function(index) {
            if ($(this).prop("checked")) {
                const quantity = $("input[name='quantity']").eq(index).val(); // 현재 입력된 수량 가져오기
                selectedNos.push(initNos[index]);
                selectedQuantities.push(quantity);
            }
        });

        $("#selectedMealkitNos").val(selectedNos.join(','));
        $("#selectedMealkitQuantities").val(selectedQuantities.join(','));
        
        $("#checkoutForm").submit();
    }



    function toggleSelectAll() {
        var checkboxes = document.querySelectorAll('.itemCheckbox');
        var selectAllCheckbox = document.getElementById('selectAll');
        for (var checkbox of checkboxes) {
            checkbox.checked = selectAllCheckbox.checked;
        }
        calculateTotal();
    }

    function processQuantityChanged(element, index, price, form) {
        initQuantities[index] = $(element).val();
        $(".itemTotal").eq(index).text($(element).val() * price);

        form.submit();
    }


    function calculateTotal() {
        var checkboxes = document.querySelectorAll('.itemCheckbox:checked');
        var totalAmount = 0;
        var totalQuantity = 0;

        // 선택된 아이템들을 담을 배열
        var selectedItems = [];
        var selectedMealkitNos = [];  // 선택된 밀키트 번호 배열
        var selectedMealkitQuantities = [];

        // 선택된 아이템 처리
        for (var checkbox of checkboxes) {
            var row = checkbox.closest('tr');
            var price = parseInt(row.cells[3].getAttribute('data-price'));
            var quantity = parseInt(row.cells[4].querySelector('input').value);
            totalAmount += price * quantity;
            totalQuantity += quantity;

            // 선택된 아이템 정보 추가
            selectedItems.push({
                mealkitNo: checkbox.value,
                quantity: quantity
            });

            // selectedMealkitNos 배열에 추가
            selectedMealkitNos.push(checkbox.value);
        }

        document.getElementById('totalAmount').innerText = totalAmount;
        document.getElementById('totalQuantity').innerText = totalQuantity;

        // 선택된 아이템들을 결제 폼에 추가
        var selectedItemsContainer = document.getElementById('selectedItemsContainer');
        selectedItemsContainer.innerHTML = '';  // 기존 필드를 지우고 새로 추가

        selectedItems.forEach(function(item, index) {
            var mealkitNoField = document.createElement('input');
            mealkitNoField.type = 'hidden';
            mealkitNoField.name = 'selectedMealkitNos[]';
            mealkitNoField.value = item.mealkitNo;
            selectedItemsContainer.appendChild(mealkitNoField);
        });
    }
</script>

</body>
</html>
