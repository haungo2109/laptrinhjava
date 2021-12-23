<%-- 
    Document : index Created on : Dec 10, 2021, 10:30:24 PM 
    Author : kan_haungo
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>

<!-- Content -->
<div class="container-xxl" >
    <div class="row">
        <!-- Feed-Auction -->
        <div class="col-12 col-lg-10">
            <session>
                <div class="d-flex my-sm-4 mt-3 mb-2 align-items-center">
                    <h3 class="me-3 m-0">Đấu giá đang tham gia</h3>
                </div>

                <div class="d-flex flex-wrap justify-content-evenly list-product">
                    <c:choose>
                        <c:when test="${auctions != null && auctions.size() > 0}">
                            <c:forEach items="${auctions}" var="auction">
                                <div class="card position-relative border-0 m-2">
                                    <img 
                                        src="${auction.images.iterator().next().image}" 
                                        class="card-img-top object-fit-cover"
                                        >
                                    <div class="card-body p-0">
                                        <div class="top-info-item d-flex justify-content-between">
                                            <p class="mb-0">
                                                <span style="color: #dc3545;" class="time-left">${auction.deadline}</span>
                                            </p>
                                            <a class="mb-0"  href="<c:url value="/user/${auction.user.id}" />">
                                                ${auction.user.firstName} ${auction.user.lastName}
                                            </a>
                                        </div>
                                        <div class="my-0 my-sm-1 my-md-2">
                                            <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">${auction.currentPrice}</h4>
                                            <small class="text-capitalize">(${auction.countComment} định giá)</small>
                                        </div>
                                            <a href="<c:url value="/auction/${auction.id}" />" class="text-dark fs-5 fs-md-4 d-block">
                                            ${auction.title}
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <h3>${currentUser != null ? "Không có đấu giá nào hết" : "Vui lòng đăng nhập"}</h3>
                        </c:otherwise>
                    </c:choose>
                </div>
            </session>
        </div>
        <!-- End Feed-Auction  -->

        <!-- Friends -->
        <div class="col-lg-2 p-0 flex-column" style="display: inherit;">
            <div class="position-lg-sticky d-none d-lg-block " style="top: 78px;">
                <div class="d-none d-lg-flex justify-content-between px-2 mt-lg-3">
                    <h4 class="text-center">Người liên hệ</h4>
                </div>
                <ul class="w-100 list-group cus-content-friends list-group-flush d-flex flex-row flex-lg-column overflow-auto pb-2" style="top: 101px;" >
                    <li class="list-group-item d-flex align-items-center bg-none">
                        <div class="me-3 position-relative">
                            <img src="public/assets/img/avatar/user-2.jpg" height="48px" width="48px" 
                                 class="object-fit-cover avatar rounded-circle border " 
                                 alt="user" />
                            <span class="position-absolute bg-success rounded-circle"
                                  style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                  >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Nguyễn Thị Hồng Hà</p>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Friends -->

    </div>
</div>
<!-- End Content -->

