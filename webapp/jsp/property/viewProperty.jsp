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
                <label for="nearbyLocations">Important places:</label>
            </div>
            <div class="table-property-details-cell">
                (input coma-separated list)
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
    </div>
</body>
</html>

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: Number($("#latitude").val()), lng: Number($("#longitude").val())}
        });
//        var geocoder = new google.maps.Geocoder();
//
//        document.getElementById('findLocation').addEventListener('click', function() {
//            geocodeAddress(geocoder, map);
//        });
    }

//    function geocodeAddress(geocoder, resultsMap) {
//        var address = document.getElementById('location').value;
//        geocoder.geocode({'address': address}, function(results, status) {
//            if (status === 'OK') {
//                console.log('Here is the result' +  results[0].geometry.location);
//                resultsMap.setCenter(results[0].geometry.location);
//                var marker = new google.maps.Marker({
//                    map: resultsMap,
//                    position: results[0].geometry.location
//                });
//                $("#propertyForm input[name='latitude']").val(marker.position.lat());
//                $("#propertyForm input[name='longitude']").val(marker.position.lng());
//                $("#propertyForm input[name='address']").val($("#propertyForm input[name='location']").val());
//                $("#propertyForm input[name='description']").val($('#trumbowyg-demo').html());
//            } else {
//                console.log('Geocode was not successful for the following reason: ' + status);
//            }
//        });
//    }
</script>
<script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqdG0IEkNfpnAvbTk_CuRd0Dhl5trYb30&callback=initMap">
</script>

<script>
    $(function() {$('#trumbowyg-demo').trumbowyg();});
    $("#js_form_submit").click(function (event) {
        $("#propertyForm").submit();
    })
</script>