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
    <h3>Add your property:</h3>
    <form id="propertyForm" name="f" th:action="@{/addProperty}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div id="property_details">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title"/>
            <br/>
            <label for="trumbowyg-demo">Description:</label>
            <div id="trumbowyg-demo" class="trumbowyg-div"></div>
            <br/>
            <label for="price">Price:</label>
            <input type="number" id="price" name="price" min="1" step="any" />
            <br/>
            <label for="location">Location:</label>
            <input type="textbox" id="location" name="location" value=""/>
            <input id="findLocation" type="button" value="Find">
            <br/>
            <input type="hidden" id="address" name="address"/>
            <input type="hidden" id="description" name="description"/>
            <input type="hidden" id="latitude" name="latitude" value="${latitude}"/>
            <input type="hidden" id="longitude" name="longitude" value="${longitude}"/>
        </div>
    </form>

    <div id="map"></div>

    <div class="form-actions">
        <button type="submit" id="js_form_submit" class="btn">Submit</button>
    </div>

    </body>
</html>

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
//            center: {lat: -34.397, lng: 150.644}
            center: {lat: 56.9712662, lng: 24.180182699999932}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('findLocation').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
        });
    }

    function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('location').value;
        geocoder.geocode({'address': address}, function(results, status) {
            if (status === 'OK') {
                console.log('Here is the result' +  results[0].geometry.location);
                resultsMap.setCenter(results[0].geometry.location);
                var marker = new google.maps.Marker({
                    map: resultsMap,
                    position: results[0].geometry.location
                });
                $("#propertyForm input[name='latitude']").val(marker.position.lat());
                $("#propertyForm input[name='longitude']").val(marker.position.lng());
                $("#propertyForm input[name='address']").val($("#propertyForm input[name='location']").val());
                $("#propertyForm input[name='description']").val($('#trumbowyg-demo').html());
            } else {
                console.log('Geocode was not successful for the following reason: ' + status);
            }
        });
    }
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

<%--<script>--%>
    <%--function myMap() {--%>
        <%--var myCenter = new google.maps.LatLng(51.508742,-0.120850);--%>
        <%--var mapCanvas = document.getElementById("map");--%>
        <%--var mapOptions = {center: myCenter, zoom: 5};--%>
        <%--var map = new google.maps.Map(mapCanvas, mapOptions);--%>
        <%--var marker = new google.maps.Marker({position:myCenter});--%>
        <%--marker.setMap(map);--%>
    <%--}--%>
<%--</script>--%>

<%--<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDqdG0IEkNfpnAvbTk_CuRd0Dhl5trYb30"></script>--%>


<%--<script type="text/javascript">--%>

    <%--// Standard google maps function--%>
    <%--function initialize() {--%>
        <%--var myLatlng = new google.maps.LatLng(40.779502, -73.967857);--%>
        <%--var myOptions = {--%>
            <%--zoom: 12,--%>
            <%--center: myLatlng,--%>
            <%--mapTypeId: google.maps.MapTypeId.ROADMAP--%>
        <%--}--%>
        <%--map = new google.maps.Map(document.getElementById("map"), myOptions);--%>
        <%--TestMarker();--%>
    <%--}--%>

    <%--// Function for adding a marker to the page.--%>
    <%--function addMarker(location) {--%>
        <%--marker = new google.maps.Marker({--%>
            <%--position: location,--%>
            <%--map: map--%>
        <%--});--%>
    <%--}--%>

    <%--// Testing the addMarker function--%>
    <%--function TestMarker() {--%>
        <%--CentralPark = new google.maps.LatLng(37.7699298, -122.4469157);--%>
        <%--addMarker(CentralPark);--%>
    <%--}--%>
<%--</script>--%>
