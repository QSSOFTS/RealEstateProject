<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<head>
    <title tiles:fragment="title">Login</title>
    <spring:url value="/css/main.css" var="mainCss" />
    <link href="${mainCss}" rel="stylesheet" />
</head>
<body>
<div tiles:fragment="content">
    <form name="f" th:action="@{/login}" method="post">
        <div class="login-div-format">
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
            <div style="display: table; width: 100%;">
                <div>
                    <div style="display: table-row;">
                        <div style="border: none; display: table-cell; padding: 3px 10px;"><label
                                for="username">Login</label></div>
                        <div style="border: none; display: table-cell; padding: 3px 10px;"><input type="text"
                                                                                                  id="username"
                                                                                                  name="username"/>
                        </div>
                    </div>
                    <div style="display: table-row;">
                        <div style="border: none; display: table-cell; padding: 3px 10px;">Password</div>
                        <div style="border: none; display: table-cell; padding: 3px 10px;"><input type="password"
                                                                                                  id="password"
                                                                                                  name="password"/>
                        </div>
                    </div>
                </div>
            </div>
            <div class="form-actions">
                <button type="submit" class="btn">Log in</button>
            </div>
            <br/>
            <div style="float:right">
                <a href="<c:url value="/register"/>" class="right_corner_item">
                    Become a user
                </a>
            </div>
        </div>
    </form>
</div>
</body>
</html>