<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<sec:authentication var="user" property="principal" />
<html>
  <head>
    <title>Home page</title>
    <spring:url value="/css/main.css" var="mainCss" />
    <spring:url value="/js/jquery-3.2.1.min.js" var="jqueryJs" />
    <spring:url value="/js/main.js" var="mainJs" />

    <link href="${mainCss}" rel="stylesheet" />
    <link href="${pageContext.request.contextPath}/css/main.css" rel="stylesheet" >
    <script src="${jqueryJs}"></script>
    <script src="${mainJs}"></script>
  </head>
  <body>

  <div class="topnav" id="myTopnav">
    <a href="#home">Home</a>
    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER')">
      <a href="<c:url value="/createAd"/>">Create Ad</a>
    </sec:authorize>

    <a href="#contact">Contact</a>

    <a href="<c:url value="/logout"/>" style="float:right">
      <sec:authorize access="isAuthenticated()">
        Logout
      </sec:authorize>
    </a>

    <a href="#" style="float:right">
      <sec:authorize access="isAuthenticated()">
        Welcome | <sec:authentication property="principal.username" />
      </sec:authorize>
    </a>
  </div>

  <%--<sec:authorize access="isAuthenticated()">--%>
      <%--Welcome <sec:authentication property="principal.username" />--%>
  <%--</sec:authorize>--%>
  </body>
</html>
