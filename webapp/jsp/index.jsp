<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ taglib prefix="navigation" tagdir="/WEB-INF/tags/navigation"%>

<html xmlns:th="http://www.thymeleaf.org" xmlns:tiles="http://www.thymeleaf.org">
  <head>
    <title>List of available properties</title>
  </head>
  <body>

  <navigation:navigationBar/>

  <c:choose>
    <c:when test="${not empty propertiesList}">
      <div class="table-property">
        <div class="table-property-title">
          <p>Here is the list of properties</p>
        </div>
        <div class="table-property-heading">
          <div class="table-property-cell">
            <p>Type</p>
          </div>
          <div class="table-property-cell">
            <p>Title</p>
          </div>
          <div class="table-property-cell">
            <p>Price</p>
          </div>
          <div class="table-property-cell">
            <p>Address</p>
          </div>
          <sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">
            <div class="table-property-cell">
              <p>Status</p>
            </div>
          </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN', 'ROLE_BUYER')">
            <div class="table-property-cell">
              <p>Action</p>
            </div>
          </sec:authorize>
        </div>
        <c:forEach items="${propertiesList}" var="property">
        <div class="table-property-row">
          <input type="hidden" class="js_property_id" value="${property.id}" />
          <div class="table-property-cell">
            <p>${property.dealDescription}</p>
          </div>
          <div class="table-property-cell">
            <p>${property.title}</p>
          </div>
          <div class="table-property-cell">
            <p>${property.price}</p>
          </div>
          <div class="table-property-cell">
            <p>${property.address}</p>
          </div>
          <sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">
            <div class="table-property-cell">
              <p>${property.statusDescription}</p>
            </div>
          </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">
            <div class="table-property-cell">
              <button class="btn js_delete_property_btn" style="background: orangered">Delete</button>
              <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                <button class="btn js_approve_property_btn" style="background: greenyellow">Approve</button>
              </sec:authorize>
            </div>
          </sec:authorize>
          <sec:authorize access="hasAnyRole('ROLE_BUYER')">
            <div class="table-property-cell">
              <input type="button" onclick="location.href='/viewProperty/' + ${property.id};" style="background: greenyellow" value="View" />
              <%--<button class="btn js_view_property_btn" style="background: greenyellow">View</button>--%>
            </div>
          </sec:authorize>
        </div>
        </c:forEach>
      </div>
    </c:when>

    <c:otherwise>
      <div style="display: table; width: 100%;">
        <div style="display: table-row;">
          There is nothing to display now.
        </div>
      </div>
    </c:otherwise>
  </c:choose>

  </body>
</html>

<script type="application/javascript">
  $(document).ready(function() {
    $(".js_delete_property_btn").on('click', function(event) {
      var index = $(event.target).closest('.table-property-row').find('.js_property_id').val();
      $.ajax({
        type: 'POST',
        url: '/deleteProperty/' + index,
        contentType: "application/json",
        cache: false,
        crossDomain: false,
        success: function(result){
          location.reload();
        },
        error: function (result) {
          location.reload();
        },
      });
    });

    $(".js_approve_property_btn").on('click', function(event) {
      var index = $(event.target).closest('.table-property-row').find('.js_property_id').val();
      $.ajax({
        type: 'POST',
        url: '/approveProperty/' + index,
        contentType: "application/json",
        cache: false,
        crossDomain: false,
        success: function(result){
          location.reload();
        },
        error: function (result) {
          location.reload();
        },
      });
    });
  });

  $(".js_view_property_btn").on('click', function(event) {
    var index = $(event.target).closest('.table-property-row').find('.js_property_id').val();
    $.ajax({
      type: 'POST',
      url: '/viewProperty/' + index,
      contentType: "application/json",
      cache: false,
      crossDomain: false,
      success: function(result){
        location.reload();
      },
      error: function (result) {
        location.reload();
      },
    });
  });

</script>
