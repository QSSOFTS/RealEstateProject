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
    <h3>Manage your property:</h3>

    <form id="propertyForm" name="f" th:action="@{/addProperty}" method="post">
        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        <div class="table-property-details">
            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="dealTypeId">Ad Type</label>
                </div>
                <div class="table-property-details-cell">
                    <select name="dealTypeId" id="dealTypeId">
                        <c:forEach items="${dealTypes}" var="dealType">
                            <option value="${dealType.id}">${dealType.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="title">Title:</label>
                </div>
                <div class="table-property-details-cell">
                    <input type="text" id="title" name="title" value="${property.title}"/>
                </div>
            </div>

            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="trumbowyg-demo">Description:</label>
                </div>
                <div class="table-property-details-cell">
                    <div id="trumbowyg-demo" class="trumbowyg-div" style="width: 50%s"></div>
                </div>
            </div>

            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="price">Price:</label>
                </div>
                <div class="table-property-details-cell">
                    <input type="number" id="price" name="price" min="1" step="any" value="${property.price}"/>
                </div>
            </div>

            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="nearbyLocations">Important places:</label>
                </div>
                <div class="table-property-details-cell">
                    (input coma-separated list)
                    <br/>
                    <input type="text" id="nearbyLocations" name="nearbyLocations" value="${property.nearbyLocations}"/>
                </div>
            </div>

            <div class="table-property-details-row">
                <div class="table-property-details-cell">
                    <label for="location">Location:</label>
                </div>
                <div class="table-property-details-cell">
                    <input type="textbox" id="location" name="location" value=""/>
                    <input id="findLocation" type="button" value="Show on map">
                </div>
            </div>

            <input type="hidden" id="address" name="address"/>
            <input type="hidden" id="description" name="description"/>
            <input type="hidden" id="latitude" name="latitude" value="${latitude}"/>
            <input type="hidden" id="longitude" name="longitude" value="${longitude}"/>
        </div>
    </form>

    <div class="table-property-details">
        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                &nbsp;
            </div>
            <div class="table-property-details-cell">
                <div id="map"></div>
            </div>
        </div>
        <div class="table-property-details-row">
            <div class="table-property-details-cell">
                <div class="form-actions">
                    <button type="submit" id="js_form_submit" class="btn">Submit</button>
                </div>
            </div>
            <div class="table-property-details-cell">
                &nbsp;
            </div>
        </div>
    </div>

    </body>
</html>

<script>
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
            zoom: 12,
            center: {lat: -34.397, lng: 150.644}
        });
        var geocoder = new google.maps.Geocoder();

        document.getElementById('findLocation').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
//            var popup = window.open("", "popupWindow", "width=600, height=400, scrollbars=yes");
//            $(popup.document.body).html($("#hiddenMapDiv").html());
//            popup.addEventListener('load', initMap, true);
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
