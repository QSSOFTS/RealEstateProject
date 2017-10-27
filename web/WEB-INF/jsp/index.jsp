<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<sec:authentication var="user" property="principal" />
<html>
  <head>
    <title>Home page</title>
  </head>
  <body>
  <sec:authorize access="isAuthenticated()">
      Welcome <sec:authentication property="principal.username" />
  </sec:authorize>
  </body>
</html>
