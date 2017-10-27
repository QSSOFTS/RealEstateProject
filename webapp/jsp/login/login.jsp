<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<head>
    <title tiles:fragment="title">Login</title>
</head>
<body>
<div tiles:fragment="content">
    <form name="f" th:action="@{/login}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <fieldset>
            <legend>Please Login</legend>
                <c:if test="${param.error ne null}">
                    <div style="color: red;">
                        Invalid username or password.
                    </div>
                </c:if>
                <c:if test="${param.logout ne null}">
                    <div style="color: red;">
                        You have logged out
                    </div>
                </c:if>
            <label for="username">Login</label>
            <input type="text" id="username" name="username"/>
            <label for="password">Password</label>
            <input type="password" id="password" name="password"/>
            <div class="form-actions">
                <button type="submit" class="btn">Log in</button>
            </div>
        </fieldset>
    </form>
</div>
</body>
</html>

<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">--%>
    <%--<title>Login</title>--%>
<%--</head>--%>
<%--<body>--%>
<%--<form:form id="loginForm" modelAttribute="login" action="loginProcess" method="post">--%>
    <%--<table align="center">--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<form:label path="username">Username: </form:label>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<form:input path="username" name="username" id="username" />--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>--%>
                <%--<form:label path="password">Password:</form:label>--%>
            <%--</td>--%>
            <%--<td>--%>
                <%--<form:password path="password" name="password" id="password" />--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td></td>--%>
            <%--<td align="left">--%>
                <%--<form:button id="login" name="login">Login</form:button>--%>
            <%--</td>--%>
        <%--</tr>--%>
        <%--<tr></tr>--%>
        <%--<tr>--%>
            <%--<td></td>--%>
            <%--<td><a href="/">Home</a>--%>
            <%--</td>--%>
        <%--</tr>--%>
    <%--</table>--%>
<%--</form:form>--%>
<%--</body>--%>
<%--</html>--%>