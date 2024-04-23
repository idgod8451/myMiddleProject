<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
  <!-- font -->
  <link rel="preconnect" href="https://fonts.googleapis.com">
  <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
  <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100..900&display=swap" rel="stylesheet">
  <!-- bootstrap -->
  <scrpt src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- css Style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/section.css">
  <link rel="stylesheet"  href="${pageContext.request.contextPath }/css/form.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath }/css/list.css">
<script type="text/javascript" src="${pageContext.request.contextPath }/js/main.js"></script>
<title>Insert title here</title>

</head>
<body>
    <nav class="navbar navbar-expand-lg">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="navbarNav">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="#">Main</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">게시판</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">공고보기</a>
                </li>
              </ul>
            </div>
            <div class="collapse navbar-collapse" id="navUser">
            <c:if test="${empty sessionScope.loginId }">
                <ul class="navbar-nav">
                  <li class="nav-item" id="join">
                    <a class="nav-link" href="${pageContext.request.contextPath }/mem/add.do">회원가입</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath }/mem/login.do">로그인</a>
                  </li>
                </ul>
			</c:if>	
		<c:if test="${not empty sessionScope.loginId }">
		     <ul id="log-info" class="navbar-nav"  onclick="show()">
                  <li class="nav-item nav-link">
                    ${sessionScope.loginId } /${sessionScope.loginType } 회원 <span id="user">▼</span>
                                <nav id="show" class="nav flex-column show">
				<c:if test="${sessionScope.loginType.equals('구직자') }"><a class="nav-link log-nav" href="${pageContext.request.contextPath }/mem/myinfo.do">내 정보 확인</a></c:if>
				<c:if test="${sessionScope.loginType.equals('기업') }"><a class="nav-link log-nav" href="${pageContext.request.contextPath }/mem/corpinfo.do">내 정보 확인</a></c:if>
				<a class="nav-link log-nav" href="${pageContext.request.contextPath }/mem/logout.do">로그아웃</a>
				<a class="nav-link log-nav" href="${pageContext.request.contextPath }/mem/out.do?id=${sessionScope.loginId }">회원탈퇴</a>
			 </nav>
                  </li>
             </ul>
		</c:if>
              </div>
          </div>
    </nav>
<h3>RECRUITㅇㅇ</h3>


<td style = "width:150px; height:400px">
메뉴<br/>
<c:if test = "${sessionScope.loginType.equals('구직자')}">
<a href="${pageContext.request.contextPath }/dataroom/list.do?viewtype=1">자료실 목록</a><br/>
<c:if test = "${not empty sessionScope.loginId }">
<a href="${pageContext.request.contextPath }/dataroom/add.do">자료등록</a><br/>
<a href="${pageContext.request.contextPath }/appform/add.do">지원서 등록</a>
<a href="${pageContext.request.contextPath }/person/list.do">test1</a>
</c:if>
</c:if>

<c:if test = "${sessionScope.loginType.equals('기업')}">
<a href="${pageContext.request.contextPath }/product/list.do">상품목록</a><br/>
<a href="${pageContext.request.contextPath }/corp/add.jsp">추가정보 입력</a>
</c:if>
</td>
<td style = "width:450px;height:400px">
	<center>
		${msg }
		<c:if test="${not empty view }">
			<jsp:include page="${view }"></jsp:include>
		</c:if>
	</center>
</td>
</tr>
</table>
</body>

</html>