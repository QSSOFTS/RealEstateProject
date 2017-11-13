<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="navigation" tagdir="/WEB-INF/tags/navigation"%>

<html>
<head>
    <title>Message Details</title>
    <navigation:navigationBar/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
</head>
<body>
<h3>Message Details:</h3>
<div class="table-property-details">
    <div class="table-property-details-row">
        <div class="table-property-details-cell">
            ${message.message}
        </div>
    </div>
</div>

<sec:authorize access="isAuthenticated()">
    <div class="table-property-details-row">
        <div style="padding-left:140px">
        <div class="table-message-replay-cell">
            Replay
        </div>
        <div class="table-message-replay-cell">
            <div style="padding-top: 10px">
                <input type="text" id="messagecontent" value="" style="width:500px"/>
                <input type="button" id="js-send-message-btn" style="background: gray" value="Send" />
            </div>
        </div>
        <input type="hidden" id="propertyId" value="${message.propertyId}"/>
        <input type="hidden" id="ownerId" value="${message.ownerId}"/>
    </div>
</sec:authorize>

</body>
</html>

<script type="application/javascript">
    $(document).ready(function() {
        $("#js-send-message-btn").on('click', function(event) {
            var ownerId = $("#ownerId").val();
            var propertyId = $("#propertyId").val();
            var messageToSend = $("#messagecontent").val();
            var messageJSON = {};
            messageJSON["message"] = messageToSend;
            messageJSON["propertyId"] = propertyId;
            messageJSON["ownerId"] = ownerId;
            $.ajax({
                type: 'POST',
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json'
                },
                contentType: "application/json; charset=utf-8",
                url: '/postMessage',
                data: JSON.stringify(messageJSON),
                dataType: 'json',
                success: function(result){
                    alert("Your message has been sent");
                    $("#messagecontent").val("");
                },
                error: function (result) {
                    console.log(result);s
                },
            });
        });
    })
</script>

