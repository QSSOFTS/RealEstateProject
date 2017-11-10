<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="navigation" tagdir="/WEB-INF/tags/navigation"%>

<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
<head>
    <navigation:navigationBar/>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
    <meta charset="utf-8">
</head>
<body>
<%--<div id="hiddenSendMessageDiv" style="display: none;">--%>
    <%--<div>--%>
        <%--<div>--%>
            <%--<p>Comment:</p>--%>
            <%--<p>--%>
                <%--<textarea value="" name="Comment" cols="55" rows="5" id="Comment"/>--%>
            <%--</p>--%>
            <%--<p>--%>
                <%--<input type="button"  style="background: gray" value="Send" />--%>
            <%--</p>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>

<h3>View property:</h3>
    <div class="table-property-details">
        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="dealDescription">Ad Type</label>
            </div>
            <div class="table-property-details-cell" id="dealDescription">
                ${property.dealDescription}
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="title">Title:</label>
            </div>
            <div class="table-property-details-cell" id="title">
                ${property.title}
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="descriptionStr">Description:</label>
            </div>
            <div class="table-property-details-cell">
                <div id="descriptionStr">${property.description}</div>
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="priceStr">Price:</label>
            </div>
            <div class="table-property-details-cell">
                <dir id="priceStr">${property.price}</dir>
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="address">Address:</label>
            </div>
            <div class="table-property-details-cell">
                <br/>
                <div id="address">${property.address}</div>
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="nearbyLocations">Important places:</label>
            </div>
            <div class="table-property-details-cell">
                <br/>
                <div id="nearbyLocations">${property.nearbyLocations}</div>
            </div>
        </div>

        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <label for="map">Location:</label>
            </div>
            <div class="table-property-details-cell">
                <div id="map" style="margin-bottom: 20px"></div>
            </div>
        </div>

        <sec:authorize access="isAuthenticated()">
            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    Message to owner
                </div>
                <div class="table-property-details-cell">
                    <div style="padding-top: 10px">
                        <input type="text" id="messageToCustomer" name="messageToCustomer" style="width:500px"/>
                        <input type="button" id="js-send-message-btn" style="background: gray" value="Send" />
                    </div>
                </div>
            </div>
        </sec:authorize>

        <input type="hidden" id="latitude" name="latitude" value="${property.latitude}"/>
        <input type="hidden" id="longitude" name="longitude" value="${property.longitude}"/>
        <input type="hidden" id="propertyId" value="${property.id}"/>
        <input type="hidden" id="ownerId" value="${property.ownerId}"/>
    </div>

    <%--<sec:authorize access="isAuthenticated()">--%>
        <%--<div class="table-property-details-row">--%>
            <%--<div class="table-property-details-cell">--%>
                <%--<label for="message">Message to owner:</label>--%>
            <%--</div>--%>
            <%--<div class="table-property-details-cell">--%>
                <%--<textarea value="" name="Comment" cols="55" rows="5" id="Comment"/>--%>
                <%--<button class="btn js-open-send-message-dlg" style="background: darkgray ">Contact owner</button>--%>
            <%--</div>--%>
        <%--</div>--%>
    <%--</sec:authorize>--%>

</body>
</html>

<script type="application/javascript">
    $(document).ready(function() {
        var ownerId = $("#ownerId").val();
        var propertyId = $("#propertyId").val();
        var message = $("#messageToCustomer").val();
        $("#js-send-message-btn").on('click', function(event) {
            $.ajax({
                type: 'POST',
                url: '/' + propertyId + '/' + ownerId + '/postMessage',
                data: '{"message" :' + message + '}',
                contentType: "application/json",
                cache: false,
                crossDomain: false,
                success: function(result){
                    alert("Your message has been sent");
                },
                error: function (result) {
                    console.log(result);
//                    location.reload();
                },
            });
        });
    })
</script>

<script type="application/javascript">
    function initMap() {
        var latVal = $("#latitude").val();
        var longVal = $("#longitude").val();
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: Number(latVal), lng: Number(longVal)}
        });

        var Latlng = new google.maps.LatLng(Number(latVal), Number(longVal));
        var marker = new google.maps.Marker(
                {
                    position: Latlng,
                    title:"0"
                }
        );
        marker.setMap(map);
    }
</script>

<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqdG0IEkNfpnAvbTk_CuRd0Dhl5trYb30&callback=initMap">
</script>
