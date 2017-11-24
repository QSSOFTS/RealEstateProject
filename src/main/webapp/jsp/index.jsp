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

  <div class="body2">
    <div class="main">
        <div class="wrapper">
          <article class="col1">
            <div id="slider"> <img src="images/img1.jpg" alt="" title="<strong>Villa Neverland, 2006</strong><span>9 rooms, 3 baths, 6 beds, building size: 5000 sq. ft. &nbsp; &nbsp; &nbsp; Price: $ 600 000 &nbsp; &nbsp; &nbsp; <a href='#'>Read more</a></span>"> <img src="images/img2.jpg" alt="" title="<strong>Villa Lipsum, 2008</strong><span>8 rooms, 4 baths, 4 beds, building size: 4500 sq. ft. &nbsp; &nbsp; &nbsp; Price: $ 500 000 &nbsp; &nbsp; &nbsp; <a href='#'>Read more</a></span>"> <img src="images/img3.jpg" alt="" title="<strong>Villa Dolor Sid, 2007</strong><span>11 rooms, 3 baths, 5 beds, building size: 6000 sq. ft. &nbsp; &nbsp; &nbsp; Price: $ 650 000 &nbsp; &nbsp; &nbsp; <a href='#'>Read more</a></span>"> <img src="images/img4.jpg" alt="" title="<strong>Villa Nemo Enim, 2010</strong><span>5 rooms, 2 baths, 4 beds, building size: 3000 sq. ft. &nbsp; &nbsp; &nbsp; Price: $ 400 000 &nbsp; &nbsp; &nbsp; <a href='#'>Read more</a></span>"> <img src="images/img5.jpg" alt="" title="<strong>Villa Nam Libero, 2003</strong><span>7 rooms, 4 baths, 6 beds, building size: 7000 sq. ft. &nbsp; &nbsp; &nbsp; Price: $ 700 000 &nbsp; &nbsp; &nbsp; <a href='#'>Read more</a></span>"> </div>
          </article>

          <article class="col2">
              <div class="pad1">
                <h3>Find Your Property</h3>
                <form action="/search" path="/search" method="GET">
                  <div class="search-form-div">
                    <input type="text" id="searchQuery" name="searchQuery"/>
                    <select name="searchCondition" id="searchCondition">
                      <option value="city">City</option>
                      <option value="price">Price</option>
                    </select>
                    <input id="searchButton" type="submit" class="button" value="Search">
                  </div>
                </form>
              </div>
          </article>
        </div>
    </div>
        <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN', 'ROLE_OWNER', 'ROLE_BUYER')">--%>
    <%--<form action="/search" path="/search" method="GET">--%>
    <%--<div class="search-form-div">--%>
    <%--<input type="text" id="searchQuery" name="searchQuery"/>--%>
    <%--<select name="searchCondition" id="searchCondition">--%>
    <%--<option value="city">City</option>--%>
    <%--<option value="price">Price</option>--%>
    <%--</select>--%>
    <%--<input id="searchButton" type="submit" class="btn" value="Search">--%>
    <%--</div>--%>
    <%--</form>--%>
    <%--</sec:authorize>--%>

  </div>

  <div tiles:fragment="content" class="body3">
    <div class="main">
      <section id="content">
        <div class="wrapper">

          <article class="common_col">
            <div class="pad2">
              <h2>Popular properties</h2>

              <c:choose>
                <c:when test="${not empty propertiesList}">
                  <c:forEach items="${propertiesList}" var="property">
                    <div class="wrapper pad_bot3">
                      <input type="hidden" class="js_property_id" value="${property.id}" />
                      <c:set var="imgUrl" value="/images/noimage.png"/>
                      <c:if test="${not empty property.pictureCode}">
                          <c:set var="imgUrl" value="/images/property/${property.pictureCode}"/>
                      </c:if>
                      <figure class="left marg_right1"><img width="100" src="${imgUrl}" alt=""></figure>
                      <p class="pad_bot1"><strong class="color2">${property.title}<br>
                        Price: <span class="color1">$&nbsp;${property.price}</span></strong></p>
                      <p class="pad_bot2">${property.description}</p>
                      <a href="viewProperty/${property.id}" class="button">Read more</a>
                      <sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">
                        <a href="#" class="button js_delete_property_btn" style="background: orangered">Delete</a>
                      </sec:authorize>
                      <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
                        <a href="#" class="button js_approve_property_btn" style="background: greenyellow">Delete</a>
                        <%--<button class="btn js_approve_property_btn" style="background: greenyellow">Approve</button>--%>
                      </sec:authorize>
                    </div>
                  </c:forEach>
                </c:when>

                <c:otherwise>
                  <div style="display: table; width: 100%;">
                    <div style="display: table-row;">
                      There is nothing to display now.
                    </div>
                  </div>
                </c:otherwise>
              </c:choose>
            </div>
          </article>

          <%--<c:choose>--%>
            <%--<c:when test="${not empty propertiesList}">--%>
              <%--<div class="table-property">--%>
                <%--<div class="table-property-title">--%>
                  <%--<p>List of properties available</p>--%>
                <%--</div>--%>
                <%--<div class="table-property-heading">--%>
                  <%--<div class="table-property-cell">--%>
                    <%--<p>Type</p>--%>
                  <%--</div>--%>
                  <%--<div class="table-property-cell">--%>
                    <%--<p>Title</p>--%>
                  <%--</div>--%>
                  <%--<div class="table-property-cell">--%>
                    <%--<p>Price</p>--%>
                  <%--</div>--%>
                  <%--<div class="table-property-cell">--%>
                    <%--<p>Address</p>--%>
                  <%--</div>--%>
                  <%--<sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<p>Status</p>--%>
                    <%--</div>--%>
                  <%--</sec:authorize>--%>
                  <%--<div class="table-property-cell">--%>
                    <%--<p>Action</p>--%>
                  <%--</div>--%>
                <%--</div>--%>
                <%--<c:forEach items="${propertiesList}" var="property">--%>
                  <%--<div class="table-property-row">--%>
                    <%--<input type="hidden" class="js_property_id" value="${property.id}" />--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<p>${property.dealDescription}</p>--%>
                    <%--</div>--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<p>${property.title}</p>--%>
                    <%--</div>--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<p>${property.price}</p>--%>
                    <%--</div>--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<p>${property.address}</p>--%>
                    <%--</div>--%>
                    <%--<sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">--%>
                      <%--<div class="table-property-cell">--%>
                        <%--<p>${property.statusDescription}</p>--%>
                      <%--</div>--%>
                    <%--</sec:authorize>--%>
                    <%--<div class="table-property-cell">--%>
                      <%--<sec:authorize access="hasAnyRole('ROLE_OWNER', 'ROLE_ADMIN')">--%>
                        <%--<button class="btn js_delete_property_btn" style="background: orangered">Delete</button>--%>
                        <%--<sec:authorize access="hasAnyRole('ROLE_ADMIN')">--%>
                          <%--<button class="btn js_approve_property_btn" style="background: greenyellow">Approve</button>--%>
                        <%--</sec:authorize>--%>
                        <%--<sec:authorize access="hasAnyRole('ROLE_OWNER')">--%>
                          <%--<button class="btn js_update_property_btn" onclick="location.href='/updateProperty/' + ${property.id};" style="background: greenyellow">Edit</button>--%>
                        <%--</sec:authorize>--%>
                      <%--</sec:authorize>--%>
                      <%--<sec:authorize access="hasAnyRole('ROLE_BUYER', 'ROLE_ANONYMOUS')">--%>
                        <%--<input type="button" onclick="location.href='/viewProperty/' + ${property.id};" style="background: greenyellow" value="View" />--%>
                      <%--</sec:authorize>--%>
                    <%--</div>--%>
                  <%--</div>--%>
                <%--</c:forEach>--%>
              <%--</div>--%>
            <%--</c:when>--%>

            <%--<c:otherwise>--%>
              <%--<div style="display: table; width: 100%;">--%>
                <%--<div style="display: table-row;">--%>
                  <%--There is nothing to display now.--%>
                <%--</div>--%>
              <%--</div>--%>
            <%--</c:otherwise>--%>
          <%--</c:choose>--%>

        </div>
      </section>
    </div>
  </div>

  <navigation:footer/>

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

  </body>
</html>
