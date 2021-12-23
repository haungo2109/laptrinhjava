<%-- 
    Document   : index
    Created on : Dec 10, 2021, 10:30:24 PM
    Author     : kan_haungo
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>

<c:url value="/create-feed" var="actionCreateFeed" />
<c:url value="/create-auction" var="actionCreateAuction" />
<c:url value="/category" var="goCategory" />

<!-- Content -->
<div class="container-xl" >
    <div class="row">

        <!-- Sider Category -->
        <div class="order-0 col-lg-3 p-0 flex-column" style="display: inherit;">
            <div class="position-lg-sticky" style="top: 78px;">
                <a class="fs-4 mt-lg-3 d-none d-lg-block text-center" href="${goCategory}">Các loại đấu giá</a>
                <ul class="ul-none m-auto pb-2 p-0 cus-content-sider-category rounded-3 d-flex overflow-auto flex-row flex-lg-column" >
                    <c:if test="${categories != null}">
                        <c:forEach items="${categories}" var="category">
                            <li class="border-0 mb-lg-2 me-2 me-lg-0">
                                <a class="card hover-border-primary justify-content-center" href="<c:url value="/category/?id=${category.id}" />">
                                    <div class="row g-0">
                                        <div class="col-md-4 d-none d-xl-block wrap-img-category">
                                            <img
                                                src="${category.image}"
                                                class="
                                                h-100
                                                w-100
                                                rounded-start
                                                object-fit-cover
                                                "
                                                alt="image item"
                                                />
                                        </div>
                                        <div class="col-12 col-xl-8">
                                            <div class="card-body p-2">
                                                <h6 class="mb-0">
                                                    ${category.name}
                                                </h6>
                                                <p class="card-text mb-0 d-none d-sm-block">
                                                    <small class="text-muted">
                                                        ${category.description}
                                                    </small>
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        </c:forEach>
                    </c:if>
                </ul>
            </div>
        </div>
        <!-- End Sider Category -->

        <!-- Feed-Auction -->
        <div class="order-2 order-lg-1 col-12 col-lg-6"> 
            <section class="mt-3">

                <!-- CreateButton  -->
                <c:if test="${currentUser != null}">
                    <div 
                        class="card shadow-sm btn mx-auto"
                        style="cursor: pointer; max-width: 733px;" 
                        role="button" data-bs-toggle="modal" data-bs-target="#createFeedModal"
                        >
                        <div class="card-header bg-white p-0 mt-md-2 border-0 mt-1">
                            <div class="d-flex justify-content-between">
                                <div class="me-2">
                                    <img height="48px" width="48px" class="object-fit-cover rounded-circle" src="${currentUser.avatar}" alt="user-1">
                                </div>
                                <div class="info w-100">
                                    <div class="input-group input-group-lg">
                                        <input type="text" class="form-control w-100" disabled placeholder="${currentUser.firstName} ơi, bạn đang nghĩ gì nào?">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="card-body d-flex justify-content-evenly align-items-center p-0 mt-2">
                            <p class="fs-6 mb-0 fw-bold text-secondary">
                                <i class="fas fa-image fs-5 me-2" style="color: rgb(69, 230, 90);"></i> Hình ảnh
                            </p>
                            <div class="y-divide"></div>
                            <p class="fs-6 mb-0 fw-bold text-secondary">
                                <i class="far fa-grin fs-5 me-2" style="color: rgb(250, 166, 57);"></i> Cảm xúc
                            </p>
                        </div>
                    </div>
                </c:if>
                <!-- End CreateButton  -->

                <!--Show List Feed-->
                <div>
                    <c:if test="${feeds != null}" >
                        <c:forEach items="${feeds}" var="feed">
                            <div class="d-flex flex-column pt-3" id="feedId${feed.id}">
                                <div class="mx-auto item-feed-content">
                                    <div class="card shadow-sm">
                                        <div class="card-header bg-white p-0 mx-3 mt-3 border-0">
                                            <div class="d-flex justify-content-between">
                                                <div class="right d-flex">
                                                    <div class="me-2">
                                                        <img height="48px" width="48px" class="object-fit-cover rounded-circle" src="${feed.user.avatar}" alt="user-1">
                                                    </div>
                                                    <div class="info">
                                                        <a href="<c:url value='/user/${feed.user.id}' />" class="m-0 fs-5">${feed.user.firstName} ${feed.user.lastName}</a>
                                                        <p class="m-0 text-muted time-feed"> ${feed.createAt}</p>
                                                    </div>
                                                </div>
                                                <c:if test="${currentUser != null}">
                                                    <div class="left">
                                                        <button type="button" 
                                                                class="btn btn-link dropdown-toggle bg-white" 
                                                                id="optionFeed"
                                                                data-bs-toggle="dropdown" 
                                                                aria-expanded="false" 
                                                                data-bs-offset="10,20"
                                                                >
                                                            <i class="fas fa-ellipsis-v"></i>
                                                        </button>
                                                        <ul class="dropdown-menu dropdown-menu-end shadow-lg" aria-labelledby="optionFeed">
                                                            <c:choose>
                                                                <c:when test="${currentUser != null && feed.user.id == currentUser.id}">
                                                                    <li>
                                                                        <button class="btn dropdown-item" onclick="showEditFeed(${feed.id})" 
                                                                                role="button" data-bs-toggle="modal" data-bs-target="#editFeedModal">
                                                                            <i class="far fa-edit" style="width: 22px;"></i> 
                                                                            Sửa
                                                                        </button>
                                                                    </li>
                                                                    <li>
                                                                        <button class="btn dropdown-item" onclick="deleteFeed(${feed.id})">
                                                                            <i class="far fa-trash-alt" style="width: 22px;"></i> Xóa
                                                                        </button>
                                                                    </li>
                                                                </c:when>
                                                                <c:when test="${currentUser != null}">
                                                                    <li>
                                                                        <button class="btn dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#reportModal" onclick="showReport(${feed.user.id})">
                                                                            <i class="fas fa-exclamation" style="width: 22px;"></i> Báo cáo
                                                                        </button>
                                                                    </li>
                                                                </c:when>
                                                            </c:choose>
                                                        </ul>
                                                    </div>
                                                </c:if>
                                            </div>
                                        </div>
                                        <div class="card-body pt-2" style="max-width: 733px;">
                                            <div class="content-feed my-2">
                                                <p class="card-description mb-2" id="feed-content-${feed.id}">
                                                    ${feed.content}
                                                </p>
                                            </div>
                                            <c:if test="${feed.images != null && feed.images.size() != 0}">
                                                <div href="javascript:;" class="d-block">
                                                    <div id="carouselExampleControls${feed.id}" class="carousel slide" data-bs-ride="carousel">
                                                        <div class="carousel-inner" id="feed-images-${feed.id}">
                                                            <c:forEach items="${feed.images}" var="image" varStatus="loop">
                                                                <c:choose>
                                                                    <c:when test="${loop.index == 0}">
                                                                        <div class="carousel-item active" style="height: 345px; overflow: hidden;" >
                                                                            <img height="345px" src="${image.image}" class="d-block rounded rounded-3 object-fit-cover w-100 h-100" alt="first image">
                                                                        </div>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <div class="carousel-item" style="height: 345px; overflow: hidden;" >
                                                                            <img height="345px" src="${image.image}" class="d-block rounded rounded-3 object-fit-cover w-100 h-100" alt="${image.id}">
                                                                        </div>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                            </c:forEach>
                                                        </div>
                                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${feed.id}" data-bs-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Previous</span>
                                                        </button>
                                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${feed.id}" data-bs-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Next</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            </c:if>
                                            <div class="control d-flex justify-content-between align-items-center mt-2">
                                                <c:choose>
                                                    <c:when test="${feed.isUserLike == true}">
                                                        <button class="btn btn-link" onclick="likeFeed(${feed.id}, this)" data-like="true">
                                                            <i class="fas fa-thumbs-up me-2" style="color: gray; font-size: 20px;"></i>
                                                            ${feed.likes.size()} Đã thích
                                                        </button>
                                                    </c:when>
                                                    <c:when test="${currentUser == null}">
                                                        <button class="btn btn-link">
                                                            <i class="fas fa-thumbs-up me-2" style="color: gray; font-size: 20px;"></i>
                                                            ${feed.likes.size()} Thích
                                                        </button>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <button class="btn btn-link" onclick="likeFeed(${feed.id}, this)" data-like="false">
                                                            <i style="color: gray; font-size: 20px;" class="far fa-thumbs-up me-2"></i>
                                                            ${feed.likes.size()} Thích
                                                        </button>
                                                    </c:otherwise>
                                                </c:choose>
                                                <div class="y-divide"></div>
                                                <button class="btn btn-link" onclick="showCommentFeed(${feed.id}, this)" data-userId="${currentUser.id}"> 
                                                    <i style="color: gray; font-size: 20px;" class="far fa-comment-alt me-2"></i>
                                                    ${feed.countComment} Bình luận
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="comment-content d-none">
                                        <c:if test="${currentUser != null}">
                                            <div class="d-flex my-2 px-3">
                                                <div class="d-flex me-2">
                                                    <img src="${currentUser.avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                                                    <a class="mb-0 ms-1" href="<c:url value="/user/${currentUser.id}" />" style="white-space: nowrap;" >
                                                        ${currentUser.firstName} ${currentUser.lastName}
                                                    </a>
                                                </div>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Nhập nội dung..." id="input-feed-content-${feed.id}">
                                                    <button class="btn btn-outline-secondary" type="button" id="button-addon1" onclick="sendFeedComment(${feed.id}, this)" 
                                                            data-username="${currentUser.firstName} ${currentUser.lastName}"
                                                            data-userId="${currentUser.id}"
                                                            data-avatar="${currentUser.avatar}">
                                                        <i class="fas fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        </c:if>
                                        <div class="textInvalidForm">
                                            
                                        </div>
                                        <div id="list-comment-${feed.id}">
                                            <c:if test="${comments != null}">
                                                <c:forEach items="comments" var="comment">
                                                    <div class="d-flex">
                                                        <div class="d-flex me-2">
                                                            <img src="${comment.user.avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                                                            <a class="mb-0 ms-1" href="<c:url value="/user/${comment.user.id}" />" >
                                                                ${comment.user.firstName} ${comment.user.lastName}
                                                            </a>
                                                        </div>
                                                        <div class="input-group mb-3">
                                                            <input type="text" class="form-control" placeholder="Nhập nội dung...">
                                                            <button class="btn btn-outline-secondary" type="button" id="button-addon1">
                                                                <i class="fas fa-paper-plane"></i>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                    <c:if test="${auctions != null}" >
                        <h4 class="fs-4 mt-md-3 mb-md-2 mt-2 mb-1 item-feed-content m-auto">Các đấu giá nổi bật</h4>
                        <c:forEach items="${auctions}" var="auction">
                            <div class="d-flex flex-column pt-3">
                                <div class="mx-auto item-feed-content">
                                    <div class="card shadow-sm">
                                        <div class="card-header p-0 mx-3 mt-3 position-relative z-index-1">
                                            <a href="<c:url value='/auction/${auction.id}' />" class="d-block">
                                                <img 
                                                    src="${auction.images.iterator().next().image}" 
                                                    class="rounded rounded-3 object-fit-cover"
                                                    width="100%"
                                                    height="345px"
                                                    >
                                            </a>
                                        </div>
                                        <div class="card-body pt-3">
                                            <h5 class="text-gradient text-warning text-uppercase text-xs font-weight-bold my-2">
                                                ${auction.basePrice}
                                            </h5>
                                            <a href="<c:url value='/auction/${auction.id}' />" class="text-dark h5 d-block">
                                                ${auction.title}
                                            </a>
                                            <p class="card-description mb-2">
                                                ${auction.content}
                                            </p>
                                            <p class="card-text mb-0 d-none d-sm-block">
                                                <small class="text-muted time-feed">${auction.createAt}</small>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:if>
                </div>

                <!--End Show List Feed-->
            </section>
        </div>
        <!-- End Feed-Auction  -->

        <!-- Friends -->
        <div class="order-1 order-lg-2 col-lg-3 p-0 flex-column" style="display: inherit;">
            <div class="position-lg-sticky" style="top: 78px;">
                <div class="d-none d-lg-flex justify-content-between px-2 mt-lg-3">
                    <h4 class="text-center">Người liên hệ</h4>
                    <button type="button" class="btn btn-link p-0">
                        <i class="fas fa-search" style="font-size: 20px;"></i>
                    </button>
                </div>
                <ul class="w-100 list-group cus-content-friends list-group-flush d-flex flex-row flex-lg-column overflow-auto pb-2" style="top: 101px;" >
                    <li class="list-group-item d-flex align-items-center bg-none">
                        <div class="me-3 position-relative">
                            <img src="<c:url value="/img/avatar/user-2.jpg" /> " height="48px" width="48px" 
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


<!-- Modal Add Feed -->
<c:if test="${currentUser != null}">
    <div class="modal fade" id="createFeedModal" tabindex="-1" aria-labelledby="createFeedModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body p-0 position-relative">
                    <button type="button" class="btn-close position-absolute top-0 end-0 z-index-2000 p-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="card m-0 w-100 border-0">
                        <div class="card-body my-3">
                            <ul class="nav nav-tabs border-0  mb-2 mb-md-3 m-auto" id="tabCreate" role="tablist">
                                <li class="nav-item" role="presentation">
                                    <button 
                                        class="nav-link border-0 active"  id="create-feed-tab" 
                                        data-bs-toggle="tab"  data-bs-target="#create-feed" 
                                        type="button" role="tab" aria-controls="create-feed" 
                                        aria-selected="true">
                                        Tạo bài viết
                                    </button>
                                </li>
                                <li class="nav-item" role="presentation">
                                    <button 
                                        class="nav-link border-0" id="create-auction-tab" 
                                        data-bs-toggle="tab" data-bs-target="#create-auction" 
                                        type="button" role="tab" aria-controls="create-auction" 
                                        aria-selected="false">
                                        Tạo đấu giá
                                    </button>
                                </li>
                            </ul>
                            <div class="tab-content" id="tabCreateContent">
                                <div class="tab-pane fade show active" id="create-feed" role="tabpanel" aria-labelledby="create-feed-tab">
                                    <div class="mb-2 d-flex">
                                        <div class="me-2">
                                            <img height="48px" width="48px" class="object-fit-cover rounded-circle" src="${currentUser.avatar}" alt="user-1">
                                        </div>
                                        <div class="info">
                                            <h5 class="m-0">${currentUser.firstName} ${currentUser.lastName}</h5>
                                            <p class="m-0 text-muted">Công khai</p>
                                        </div>
                                    </div>
                                    <form:form enctype="multipart/form-data" action="${actionCreateFeed}" method="post" modelAttribute="feed" >
                                        <c:if test="${messageErrorCreateFeed != null}" >
                                            <div class="textInvalidForm">
                                                ${messageErrorCreateFeed}
                                            </div>
                                        </c:if>
                                        <div class="mb-2 mb-md-3">
                                            <form:textarea cssClass="form-control w-100"
                                                           name="content"
                                                           path="content"
                                                           placeholder="${currentUser.firstName} ơi, bạn đang nghĩ gì thế???"
                                                           rows="5"
                                                           />
                                        </div>
                                        <div class="mb-2 mb-md-3">
                                            <div class="input-group">
                                                <label for="imagesFeed" class="form-label m-0 input-group-text">
                                                    <string:message code="label.image" />
                                                </label>                                            
                                                <form:input path="files" type="file" multiple="multiple" class="form-control" name="file-upload-feed" id="input-img-feed" />
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary text-uppercase w-100 mt-3">Đăng</button>
                                    </form:form>
                                </div>
                                <div class="tab-pane fade" id="create-auction" role="tabpanel" aria-labelledby="create-auction-tab">
                                    <form:form commandName="action" enctype="multipart/form-data" action="${actionCreateAuction}" method="post" modelAttribute="auction">
                                        <c:if test="${messageErrorCreateAuction != null}" >
                                            <div class="textInvalidForm">
                                                ${messageErrorCreateAuction}
                                            </div>
                                        </c:if>
                                        <div class="mb-2">
                                            <form:input type="text" class="form-control" placeholder="Nhập tiêu đề" value="Pablo Picasso (Oil on Canvas)" path="title" required="true" />
                                            <form:errors path="title" cssClass="textInvalidForm" />
                                        </div>
                                        <div class="mb-2">
                                            <form:textarea class="form-control w-100" 
                                                           path="content"
                                                           placeholder="Nhập mô tả"
                                                           required="true"
                                                           value="Picasso appears in Lower right. Rendered in the cubist style of Pablo Picasso. Technique: Oil on Canvas. Measures: 26 x 20 Inches. Provenance: Private collection"
                                                           rows="4"/>
                                            <form:errors path="content" cssClass="textInvalidForm" />
                                        </div>
                                        <div class="mb-2">
                                            <form:textarea class="form-control w-100" 
                                                           path="condition"
                                                           placeholder="Nhập điều kiện"
                                                           value="Good condition, the artwork is framed, no tears or any damage. Please Note:All the pieces in this catalog are sold in the style of the artist, they are not accompanied by any authentication issued by the artist's authority"
                                                           rows="2" />
                                            <form:errors path="condition" cssClass="textInvalidForm" />
                                        </div>
                                        <div class="mb-2">
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <string:message code="label.category" />
                                                </span>
                                                <form:select path="categoryId" class="form-control">
                                                    <c:forEach items="${categories}" var="category">
                                                        <form:option value="${category.id}">${category.name}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                            <form:errors path="categoryId" cssClass="textInvalidForm" />
                                        </div>
                                        <div class="mb-2">
                                            <div class="input-group m-0">
                                                <span class="input-group-text">
                                                    <string:message code="label.deadline" />
                                                </span>
                                                <form:input type="date" class="form-control" path="date" />
                                                <form:input type="number" class="form-control" path="basePrice" />
                                            </div>
                                            <form:errors path="deadline" cssClass="textInvalidForm" />
                                            <form:errors path="basePrice" cssClass="textInvalidForm" />
                                        </div>
                                        <div class="mb-2">
                                            <div class="input-group">
                                                <span class="input-group-text">
                                                    <string:message code="label.image" />
                                                </span>
                                                <form:input path="files" id="input-img-auction" type="file" class="form-control" name="file-upload-auction" required="true" />
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary text-uppercase w-100 mt-3">Đăng</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        var modal = document.getElementById('createFeedModal');
        var createFeedTab = document.querySelector('#create-feed-tab');
        var createAuctionTab = document.querySelector('#create-auction-tab');

        if (window.location.pathname.indexOf("create-feed") !== -1) {
            new bootstrap.Modal(modal, {keyboard: false}).show();
            new bootstrap.Tab(createFeedTab).show();

            console.log("open feed modal");
        } else if (window.location.pathname.indexOf("create-auction") !== -1) {
            new bootstrap.Modal(modal, {keyboard: false}).show();
            new bootstrap.Tab(createAuctionTab).show();
            console.log("open auction modal");
        }
        document.getElementById("input-img-feed").setAttribute("multiple", "true");
        document.getElementById("input-img-auction").setAttribute("multiple", "true");
    </script>
</c:if>
<!-- End Modal Add Feed  -->

<!--Modal edit feed-->
<c:if test="${currentUser != null}">
    <div class="modal fade" id="editFeedModal" tabindex="-1" aria-labelledby="editFeedModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body p-0 position-relative">
                    <button type="button" class="btn-close position-absolute top-0 end-0 z-index-2000 p-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="card m-0 w-100 border-0">
                        <div class="card-body my-3">
                            <h3 class="mb-2 mb-md-3 m-auto">Chỉnh sửa bài viết</h3>
                            <div class="mb-2 d-flex">
                                <div class="me-2">
                                    <img height="48px" width="48px" class="object-fit-cover rounded-circle" src="${currentUser.avatar}" alt="user-1">
                                </div>
                                <div class="info">
                                    <h5 class="m-0">${currentUser.firstName} ${currentUser.lastName}</h5>
                                    <p class="m-0 text-muted">Công khai</p>
                                </div>
                            </div>
                            <form enctype="multipart/form-data" id="form-edit-feed">
                                <div class="textInvalidForm" id="editModelError">
                                </div>
                                <div class="mb-2 mb-md-3">
                                    <textarea class="form-control w-100"
                                              name="content"
                                              path="content"
                                              placeholder="${currentUser.firstName} ơi, bạn đang nghĩ gì thế???"
                                              rows="5"
                                              ></textarea>
                                </div>
                                <div class="mb-2 mb-md-3">
                                    <div class="input-group">
                                        <label for="imagesFeed" class="form-label m-0 input-group-text">
                                            Chọn lại ảnh
                                        </label>                                            
                                        <input type="file" multiple="multiple" class="form-control" name="files" />
                                    </div>
                                </div>
                                <button type="submit" class="btn btn-primary text-uppercase w-100 mt-3">Cập nhật</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:if>
<!--End Modal edit feed-->


<!--Modal report-->
<c:if test="${currentUser != null && typeReports != null}">
    <div class="modal fade" id="reportModal" tabindex="-1" aria-labelledby="reportModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body p-0 position-relative">
                    <button type="button" class="btn-close position-absolute top-0 end-0 z-index-2000 p-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="card m-0 w-100 border-0">
                        <div class="card-body my-3">
                            <h3 class="mb-2 mb-md-3 m-auto">Báo cáo</h3>
                            <form id="form-report" name="form-report">
                                <div class="textInvalidForm" id="errorMessageReport">

                                </div>
                                <select class="form-select mb-md-3 mb-2" name="typeReportId" id="typeReportId" required>
                                    <option selected value="${typeReports[0].id}">${typeReports[0].name}</option>
                                    <c:forEach items="${typeReports}" var="typeReport" begin="1" >
                                        <option value="${typeReport.id}">${typeReport.name}</option>
                                    </c:forEach>
                                </select>
                                <div class="mb-2 mb-md-3">
                                    <textarea class="form-control w-100"
                                              name="content"
                                              id="content"
                                              placeholder="Nội dung báo cáo"
                                              required
                                              rows="3"
                                              ></textarea>
                                </div>

                                <button type="submit" class="btn btn-primary text-uppercase w-100 mt-3">Gửi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        document.querySelector("#form-report button[type='submit']")
                .addEventListener("click", function (event) {
                    event.preventDefault();
                    let reportModal = document.getElementById("reportModal");
                    let myForm = document.getElementById('form-report');
                    let formData = new FormData(myForm);

                    if (!formData.get("content")) {
                        document.getElementById("errorMessageReport").textContent = "Vui lòng điền nội dung"
                        return;
                    }
                    let url = "/laptrinhjava/api/add-report/" + myForm.getAttribute('data-user-report-id');
                    let body = JSON.stringify(Object.fromEntries(formData));

                    fetch(url, {
                        method: "post",
                        body,
                        headers: {
                            "Content-Type": "application/json"
                        }
                    }).then((response) => {
                        if (response.status !== 200) {
                            document.getElementById("errorMessageReport").textContent = "Đã có lỗi xảy ra vui lòng thử lại"
                        }
                        bootstrap.Modal.getInstance(document.getElementById('reportModal')).hide();
                    })
                });
    </script>
</c:if>
<!--End Modal report-->

