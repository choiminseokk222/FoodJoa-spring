<%@page import="java.util.ArrayList"%>
<%@page import="com.foodjoa.member.vo.MemberVO"%>
<%@page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.sql.*"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.time.ZoneId"%>
<%@page import="com.foodjoa.member.dao.MemberDAO"%>

<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<c:set var="resourcesPath" value="${contextPath}/resources" />

<%
    request.setCharacterEncoding("UTF-8");
    response.setContentType("text/html; charset=utf-8");
%>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:parseDate var="joinDate" value="${member.joinDate}" pattern="yyyy-MM-dd"/>
<fmt:parseNumber var="specificDay" value="${joinDate.time / (1000*60*60*24)}" integerOnly="true"/>
<fmt:parseNumber var="today" value="${now.time / (1000*60*60*24)}" integerOnly="true"/>
<c:set var="daysBetween" value="${today - specificDay}" />
<c:set var="id" value="${sessionScope.userId}" />

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="${resourcesPath}/css/member/mypagemain.css">
</head>
<body>
    <div class="mypage-container">
        <div class="mypage-header">
            <span>마이 페이지</span>
        </div>

        <div class="profile-wrapper">
            <div class="profile-section">
                <div class="profile-image">
                    <img src="${resourcesPath}/images/member/userProfiles/${member.id}/${member.profile}">
                </div>
                <div class="profile-info">
                    <h2>${member.nickname}</h2>
                    <p>
                        <c:choose>
                            <c:when test="${not empty member.joinDate}">
                                ${member.nickname}님은 푸드조아와 함께한지 <strong>${daysBetween + 1}</strong>일째입니다!
                            </c:when>
                            <c:otherwise>
                                <p>가입 정보를 가져올 수 없습니다. 관리자에게 문의하세요.</p>
                            </c:otherwise>
                        </c:choose>
                    </p>
                    <div><button id="updateButton">정보수정</button></div>
                </div>

                <div class="right-section"  style="margin-left: 300px;">
                    <div id="point" style="margin-bottom: 10px;">
                        <img src="${resourcesPath}/images/member/point.png" style="width:40px;">
                        <p style="display: inline-block; margin-left: 5px;">${member.point} 포인트</p>
                    </div>

                    <div id="btnKakao">
                        <a id="kakaotalk-sharing-btn" href="javascript:shareMessage()">
                            <img src="${resourcesPath}/images/member/kakaologo.png" style="width:40px;">
                            <span>친구 초대하기!</span>
                        </a>
                    </div>
                </div>
            </div>

            <div class="manage-section">
                <div><a href="${contextPath}/Recipe/myrecipes"><p>내 레시피 관리</p><img src="${resourcesPath}/images/member/receipe.png"></a></div>
                <div><a href="${contextPath}/Mealkit/myMealkits"><p>내 제품 관리</p><img src="${resourcesPath}/images/member/food.png"></a></div>
                <div><a href="${contextPath}/Member/myreviews"><p>내 리뷰 관리</p><img src="${resourcesPath}/images/member/review.png"></a></div>
            </div>

            <!-- 주문/배송 및 발송 조회 섹션 -->
            <div class="info-section">
                <div>주문/배송조회</div>
                <div class="info1">
                    <span>주문건수 : ${deliveredCounts[0] + deliveredCounts[1] + deliveredCounts[2]}</span>&nbsp;&nbsp;
                    &nbsp;&nbsp; <span>배송준비중 : ${deliveredCounts[0]}</span>&nbsp;&nbsp;| &nbsp;&nbsp;
                    <span>배송중 : ${deliveredCounts[1]}</span>&nbsp;&nbsp; | &nbsp;&nbsp;
                    <span>배송완료 : ${deliveredCounts[2]}</span>
                    <a href="${contextPath}/Member/mydelivery" style="margin-left: auto;">더보기</a>
                </div>
            </div>

            <div class="info-section">
                <div>내 마켓 발송조회</div>
                <div class="info1">
                    <span>주문건수 : ${sendedCounts[0] + sendedCounts[1] + sendedCounts[2]}</span>&nbsp;&nbsp;
                	&nbsp;&nbsp; <span>발송준비중 : ${sendedCounts[0]}</span>&nbsp;&nbsp; | &nbsp;&nbsp;
                    <span>발송중 : ${sendedCounts[1]}</span>&nbsp;&nbsp; | &nbsp;&nbsp;
                    <span>발송완료 : ${sendedCounts[2]}</span>
                    <a href="${contextPath}/Member/sendmealkit" style="margin-left: auto;">더보기</a>
                </div>
            </div>

            <br><hr><br>

            <div>
                <div id="calendarFormContainer">
	                <h2>일정 입력</h2>
                    <form id="calendarForm" action="${contextPath}/Member/addCalendar" method="post">
                        <label>일정 제목:</label>
                        <input type="text" name="summary" required><br>
                        <label>일정 내용:</label>
                        <textarea name="description" required></textarea><br>
                        <label>장소:</label>
                        <input type="text" name="location" required><br>
                        <label>시작 시간:</label>
                        <input type="datetime-local" name="startTime" required><br>
                        <label>종료 시간:</label>
                        <input type="datetime-local" name="endTime" required><br>
                        <button type="submit">입력!</button>
                    </form>
                </div>
            </div>

            <br><br>

            <div>
             <div id="calendarListContainer">
                <h2>일정 목록</h2>
                    <c:choose>
                        <c:when test="${empty calendarList}">
                            <p>일정이 없습니다.</p>
                        </c:when>
                        <c:otherwise>
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>제목</th>
                                        <th>내용</th>
                                        <th>장소</th>
                                        <th>시작 시간</th>
                                        <th>종료 시간</th>
                                        <th>삭제</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="calendar" items="${calendarList}">
                                        <tr>
                                            <td>${calendar.summary}</td>
                                            <td>${calendar.description}</td>
                                            <td>${calendar.location}</td>
                                            <td>${calendar.startTime}</td>
                                            <td>${calendar.endTime}</td>
                                            <form action="${contextPath}/Member/deleteCalendar" method="post">
											<input type="hidden" name="Id" value="${calendar.id}">
											<input type="hidden" name="no" value="${calendar.no}">
                                                <td><button type="submit">삭제</button></td>
                                            </form>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <br>

            <div class="info-section2">
                <div class="impormation">
                    <a href="${contextPath}/Member/impormation" class="impormation">※개인정보처리방침</a>
                </div>
            </div>

            <br>

            <div class="info-section3">
                <div>
                    <a href="${contextPath}/Member/deleteMember"><button id="getout">탈퇴하기</button></a>
                </div>
            </div>
        </div>
    </div>

    <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    <script>
        // 정보 수정 버튼 클릭 시 이동
        document.getElementById('updateButton').onclick = function() {
            location.href = '${contextPath}/Member/profileupdate';
        };

        // 카카오톡 공유 기능
        Kakao.init('ab039484667daeed90e5c9efa4980315');
        function shareMessage() {
            var userId = "${member.id}";
            Kakao.Link.sendCustom({
                templateId: 115441,
                templateArgs: { "userId": userId }
            });
        }

        document.getElementById('kakao-link-btn').onclick = shareMessage;

        // 일정 폼 토글
        document.getElementById('showFormButton').addEventListener('click', function() {
            toggleVisibility('calendarFormContainer', 'calendarListContainer');
        });

        document.getElementById('showListButton').addEventListener('click', function() {
            toggleVisibility('calendarListContainer', 'calendarFormContainer');
        });

        function toggleVisibility(showId, hideId) {
            const showElement = document.getElementById(showId);
            const hideElement = document.getElementById(hideId);

            if (hideElement.style.display === 'block') {
                hideElement.style.display = 'none';
            }

            if (showElement.style.display === 'none') {
                showElement.style.display = 'block';
            } else {
                showElement.style.display = 'none';
            }
        }
    </script>
</body>
</html>
