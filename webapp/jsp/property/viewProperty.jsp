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
                <div id="map"></div>
            </div>
        </div>

        <input type="hidden" id="latitude" name="latitude" value="${property.latitude}"/>
        <input type="hidden" id="longitude" name="longitude" value="${property.longitude}"/>
        <br/>
    </div>
</body>
</html>

<script>
    function initMap() {
        var latVal = $("#latitude").val();
        console.log(latVal);
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

<%--<script>--%>
    <%--$("#js_contact_owner").click(function () {--%>
        <%--$("#send-message-div").css("visibility:block");--%>
        <%--$('#message_to_owner').val('Put your message here');--%>
    <%--})--%>

    <%--$("#js_send_message_to_owner").click(function () {--%>
        <%--$.ajax({--%>
            <%--type: 'POST',--%>
            <%--url: '/sendMessage/' + index,--%>
            <%--contentType: "application/json",--%>
            <%--cache: false,--%>
            <%--crossDomain: false,--%>
            <%--success: function(result){--%>
                <%--location.reload();--%>
            <%--},--%>
            <%--error: function (result) {--%>
                <%--location.reload();--%>
            <%--},--%>
            <%--done: function (result) {--%>
                <%--console.log("here");--%>
            <%--}--%>
        <%--});--%>
    <%--})--%>
<%--</script>--%>