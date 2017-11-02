<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:url value="/css/main.css" var="mainCss" />
<spring:url value="/css/trumbowyg.min.css" var="trumbowygCss" />

<spring:url value="/js/jquery-3.2.1.min.js" var="jqueryJs" />
<spring:url value="/js/trumbowyg.min.js" var="trumbowygJs" />
<spring:url value="/js/main.js" var="mainJs" />

<link href="${mainCss}" rel="stylesheet" />
<link href="${trumbowygCss}" rel="stylesheet" />

<script src="${jqueryJs}"></script>
<script src="${mainJs}"></script>
<script src="${trumbowygJs}"></script>

<div class="topnav" id="myTopnav">
    <a href="<c:url value="/"/>">Home</a>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER')">
        <a href="<c:url value="/addProperty"/>">Add property</a>
    </sec:authorize>

    <sec:authorize access="hasAnyRole('ROLE_OWNER')">
        <a href="<c:url value="/showMessages"/>">My messages</a>
    </sec:authorize>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER', 'ROLE_BUYER')">
        <a href="<c:url value="/addProperty"/>">
            <input type="text" id="search" name="search" value="${property.title}"/>
            <input id="searchButton" type="button" value="Search">
        </a>
    </sec:authorize>

    <a href="<c:url value="/logout"/>" style="float:right">
        <sec:authorize access="isAuthenticated()">
            Logout
        </sec:authorize>
    </a>

    <a href="#" style="float:right" id="userName">
        <sec:authorize access="isAuthenticated()">
            Welcome | <sec:authentication property="principal.username" />
        </sec:authorize>
    </a>
</div>
