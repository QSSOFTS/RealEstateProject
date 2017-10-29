<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="navigation" tagdir="/WEB-INF/tags/navigation"%>

<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
    <head>
        <navigation:navigationBar/>
    </head>
    <body>
    <h3>Add your property:</h3>
    <form id="propertyForm" name="f" th:action="@{/addProperty}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div id="property_details">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title"/>
            <br/>
            <label for="trumbowyg-demo">Description:</label>
            <div id="trumbowyg-demo" name="description"></div>
            <br/>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" min="1" step="any" />
            <br/>
            <label for="location">Location:</label>
            <input type="text" id="location" name="location"/>
            <br/>
            <div class="form-actions">
                <button type="submit" class="btn">Submit</button>
            </div>
        </div>
    </form>
    </body>
</html>

<script>
    $(function() {$('#trumbowyg-demo').trumbowyg();});

    $( "#propertyForm" ).submit(function( event ) {
        alert( "Handler for .submit() called." );
//        event.preventDefault();
    });
</script>