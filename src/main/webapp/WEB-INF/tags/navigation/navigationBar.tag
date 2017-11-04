<%@ tag body-content="empty" trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<spring:url value="/css/main.css" var="mainCss" />
<spring:url value="/css/trumbowyg.min.css" var="trumbowygCss" />

<spring:url value="/js/jquery-3.2.1.min.js" var="jqueryJs" />
<spring:url value="/js/trumbowyg.min.js" var="trumbowygJs" />

<link href="${mainCss}" rel="stylesheet" />
<link href="${trumbowygCss}" rel="stylesheet" />

<script src="${jqueryJs}"></script>
<script src="${trumbowygJs}"></script>

<div class="topnav" id="myTopnav">
    <a href="<c:url value="/"/>">Home</a>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER')">
        <a href="<c:url value="/addProperty"/>">Add property</a>
    </sec:authorize>

    <%--<sec:authorize access="hasAnyRole('ROLE_OWNER')">--%>
        <%--<a href="<c:url value="/showMessages"/>">My messages</a>--%>
    <%--</sec:authorize>--%>

    <sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER', 'ROLE_BUYER')">
        <form action="/search" path="/search" method="GET">
        <div class="search-form-div">
            <input type="text" id="searchQuery" name="searchQuery"/>
            <select name="searchCondition" id="searchCondition">
                <option value="city">City</option>
                <option value="price">Price</option>
            </select>
            <input id="searchButton" type="submit" class="btn" value="Search">
        </div>
        </form>
    </sec:authorize>

    <a href="<c:url value="/logout"/>" class="right_corner_item">
        <sec:authorize access="isAuthenticated()">
            Logout
        </sec:authorize>
    </a>

    <a href="#" class="right_corner_item" id="userName">
        <sec:authorize access="isAuthenticated()">
            Welcome | <sec:authentication property="principal.username" />
        </sec:authorize>
    </a>
</div>

<script>
    $("#js_form_submit").click(function () {
        $("#propertyForm input[name='address']").val($("#propertyForm input[name='location']").val());
        $("#propertyForm input[name='description']").val($('#trumbowyg-demo').html());
        $("#propertyForm").attr('action', '/addProperty');
        $("#propertyForm").submit();
    })
</script>
