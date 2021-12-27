<%-- 
    Document : index Created on : Dec 10, 2021, 10:30:24 PM 
    Author : kan_haungo
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>


<!-- Content -->
<div class="container-xxl">
    <div class="row">
        <!-- Feed-Auction -->
        <div class="col-12 col-lg-10">
            <section>
                <nav aria-label="breadcrumb" class="my-lg-4 my-2">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="<c:url value="/"/>">KanJ</a></li>
                        <li class="breadcrumb-item">
                            <a href="<c:url value="/category"/>">Đấu giá</a></li>
                        </li>
                        <li class="breadcrumb-item active" aria-current="page">
                            ${auction.title}
                        </li>
                    </ol>
                </nav>
                <div class="d-flex mb-4 align-items-center">
                    <h3 class="me-3 m-0">${auction.category.name}</h3>
                    <button
                        type="button"
                        class="btn rounded-0"
                        style="background-color: #0aa2c0; color: white"
                        >
                        <i class="far fa-heart" style="color: white"></i>
                        <span class="fs-6">Theo dõi loại này</span>
                    </button>
                </div>

                <div class="row">
                    <div class="col-md-6 col-12 d-flex flex-column flex-md-row">
                        <ul
                            class="
                            d-flex
                            flex-row flex-md-column
                            order-1 order-md-0
                            ul-none
                            mx-md-2
                            my-2 my-md-0
                            px-0
                            "
                            id="list-item-image"
                            >
                            <c:forEach items="${auction.images}" var="image">
                                <li class="mb-md-2 me-2 me-md-0">
                                    <img
                                        width="54px"
                                        height="54px"
                                        class="object-fit-cover"
                                        src="${image.image}"
                                        alt="${image.id}"
                                        />
                                </li>
                            </c:forEach>
                        </ul>
                        <div
                            class="
                            order-0 order-md-1
                            flex-grow-3
                            position-relative
                            wrap-main-image
                            "
                            >
                            <img
                                id="main-image"
                                class="object-fit-cover"
                                src="${auction.images.iterator().next().image}" 
                                alt="main-image"
                                />
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <h3 class="fs-2 mb-sm-4 mt-2">
                            ${auction.title}
                        </h3>
                        <div class="d-flex justify-content-between">
                            <p class="mb-1">Giá ban đầu ${auction.basePrice}</p>

                            <p class="mb-1 text-danger time-left">${auction.deadline}</p>
                        </div>
                        <div class="p-4" style="background-color: #fbf6f4">
                            <div class="d-flex align-items-center">
                                <p class="fs-1 mb-0 me-2 me-lg-3">${auction.currentPrice} đ</p>
                                <p
                                    class="
                                    bg-white
                                    mb-0
                                    p-3
                                    py-2
                                    fs-5
                                    rounded rounded-pill
                                    "
                                    >
                                    ${auction.countComment} định giá
                                </p>
                            </div>
                            <c:choose>
                                <c:when test="${currentUser != null && comments != null && comments.size() != 0 && currentUser.id == auction.user.id}">
                                    <div>
                                        <ul class="list-group">
                                            <c:forEach items="${comments}" var="comment">
                                                <li class="list-group-item list-group-item-warning item-auction-comment" data-status-transaction="${comment.statusTransaction}" >
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <div class="d-flex">
                                                            <img src="${comment.user.avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                                                            <a class="mb-0 ms-1" href="<c:url value="/user/${comment.user.id}" />" >
                                                                ${comment.user.firstName} ${comment.user.lastName}
                                                            </a>
                                                        </div>
                                                        <p class="mb-0">${comment.price}</p>
                                                        <c:choose>
                                                            <c:when test="${auction.statusAuction == 'being'}">
                                                                <button class="btn btn-success btnSetWinner" onclick="setWinner(this)" data-commentId="${comment.id}" data-auctionId="${auction.id}" >Chọn thắng đấu giá</button>
                                                            </c:when>
                                                            <c:when test="${auction.statusAuction == 'inprocess' && comment.statusTransaction == 'inprocess'}">
                                                                <button class="btn btn-link">Đang thanh toán</button>
                                                            </c:when>
                                                        </c:choose>
                                                    </div>
                                                </li>
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </c:when>
                                <c:when test="${currentUser != null && comments != null && currentUser.id == auction.user.id}">
                                    <div>
                                        <h3 class="fs-4">Chưa có người tham gia</h3>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <c:url value='/add-auction-comment/${auction.id}' var="actionAddAuctionComment" />
                                    <form:form action="${actionAddAuctionComment}" method="post" modelAttribute="auctionComment">
                                        <c:if test="${auction.statusAuction == 'being'}">
                                            <div class="my-3">
                                                <c:if test="${messageErrorCreateAuctionComment != null}">
                                                    <div class="textInvalidForm">${messageErrorCreateAuctionComment}</div>
                                                </c:if>
                                                <label for="bid">Chọn giá bạn muốn</label>
                                                <form:select
                                                    path="price"
                                                    class="form-select form-select-lg"
                                                    aria-label="Chọn giá muốn đấu giá"
                                                    >
                                                    <c:forEach begin="1" end="7" step="1" varStatus="loop">
                                                        <form:option value="${loop.count * 50000 + auction.currentPrice}">${loop.count * 50000 + auction.currentPrice}</form:option>
                                                    </c:forEach>
                                                </form:select>
                                            </div>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${currentUser != null && comments[0].price == auction.currentPrice}">
                                                <button
                                                    class="
                                                    btn btn-info
                                                    w-100
                                                    mb-3
                                                    mt-2
                                                    fw-bold
                                                    text-white
                                                    fs-5
                                                    text-uppercase
                                                    "
                                                    disabled
                                                    >
                                                    Bạn đã đấu giá
                                                </button>
                                            </c:when>
                                            <c:when test="${currentUser != null}">
                                                <button
                                                    class="
                                                    btn btn-info
                                                    w-100
                                                    mb-3
                                                    mt-2
                                                    fw-bold
                                                    text-white
                                                    fs-5
                                                    text-uppercase
                                                    "
                                                    style="${auction.statusAuction == "being" ? '' : 'pointer-events: none;'}"
                                                    type="submit"
                                                    >
                                                    ${auction.statusAuction == "being" ? "Đấu giá" : "Đấu giá đã kết thúc"}
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button
                                                    class="
                                                    btn btn-info
                                                    w-100
                                                    mb-3
                                                    mt-2
                                                    fw-bold
                                                    text-white
                                                    fs-5
                                                    text-uppercase
                                                    "
                                                    disabled
                                                    >
                                                    ${auction.statusAuction == "being" ? "Bạn cần đăng nhập" : "Đấu giá đã kết thúc"}
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </form:form>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <c:if test="${currentUser != null && auction.buyler.id == currentUser.id}">
                            <c:choose>
                                <c:when test="${auction.statusAuction == 'success'}">
                                    <h3 class="fs-4 " href="#" style="background-color: #04be04; color: white" >Đã thanh toán</h3>
                                </c:when>
                                <c:when test="${auction.statusAuction == 'inprocess'}">
                                    <p>Hình thức thanh toán:</p>
                                    <div class="mb-1">
                                        <label><input type="radio" name="iCheck" onchange="getLinkPayment(${auction.id})" class="iradio_flat-blue"> Ví 
                                            <img src="<c:url value="/img/logo/logo-zalopay.svg" />" alt="logozalopage">
                                        </label>
                                    </div>
                                    <a class="btn w-50" target="_blank" id="btn-payment" href="javascript::" style="background-color: #04be04; color: white;" disabled >Thanh toán</a>
                                </c:when>
                            </c:choose>
                            <script>
                                function getLinkPayment(feedId) {
                                    fetch("/laptrinhjava/api/payment/zalopay/" + feedId).then(res => res.json()).then(url => {
                                        document.getElementById("btn-payment").setAttribute("href", url)
                                    })
                                }
                            </script>
                        </c:if>
                    </div>
                </div>
                <div class="row mt-2 mt-md-3">
                    <div class="col-md-6 col-12">
                        <h3
                            class="fs-3 border-bottom border-1 border-gray py-2"
                            >
                            Chi tiết
                        </h3>
                        <p class="fs-5">Mô tả</p>
                        <p class="ms-2 ms-md-3">
                            ${auction.content}
                        </p>
                        <p class="fs-5">Điều kiện</p>
                        <p class="ms-2 ms-md-3">${auction.condition}</p>
                    </div>
                    <div
                        class="col-md-6 col-12 mb-3"
                        style="max-height: 220px; max-width: 515px"
                        >
                        <div class="row mb-2 mb-md-3">
                            <div class="col-5">
                                <img
                                    src="${auction.user.avatar}"
                                    class="
                                    img-fluid
                                    rounded
                                    h-100
                                    w-100
                                    object-fit-cover
                                    "
                                    alt=""
                                    />
                            </div>
                            <div class="col-7">
                                <div class="">
                                    <a class="fs-3 fw-bold" href="<c:url value='/user/${auction.user.id}'/>" >
                                        ${auction.user.firstName} ${auction.user.lastName}
                                    </a>
                                    <p class="card-text"></p>
                                    <p class="mb-0">
                                        <i
                                            class="fas fa-star fs-5"
                                            style="color: #0aa2c0"
                                            ></i>
                                        <i
                                            class="fas fa-star fs-5"
                                            style="color: #0aa2c0"
                                            ></i>
                                        <i
                                            class="fas fa-star fs-5"
                                            style="color: #0aa2c0"
                                            ></i>
                                        <i
                                            class="fas fa-star fs-5"
                                            style="color: #0aa2c0"
                                            ></i>
                                        <i
                                            class="far fa-star fs-5"
                                            style="color: #0aa2c0"
                                            ></i>
                                        <a href="#user-detail" class="ms-2">
                                            <span>74 Reviews</span>
                                        </a>
                                    </p>
                                    <p class="fs-4 fw-normal mb-0">
                                        1,286 Followers
                                    </p>
                                </div>
                            </div>
                        </div>
                        <c:if test="${currentUser != null && currentUser.id != auction.user.id}">
                            <div class="row">
                                <div class="col-5">
                                    <button
                                        type="button"
                                        class="btn rounded-0 w-100"
                                        style="
                                        color: #0aa2c0;
                                        background-color: white;
                                        border: 1px solid #0aa2c0;
                                        "
                                        onclick="sendMessage(${auction.user.id})"
                                        >
                                        Đặt câu hỏi
                                    </button>
                                </div>

                                <div class="col-7">
                                    <button
                                        type="button"
                                        class="btn rounded-0 w-100"
                                        style="
                                        background-color: #0aa2c0;
                                        color: white;
                                        "
                                        id="btn-report"
                                        role="button" data-bs-toggle="modal" data-bs-target="#reportModal" onclick="showReport(${auction.user.id})"
                                        >
                                        <i
                                            class="fas fa-exclamation-circle"
                                            style="color: white"
                                            ></i>
                                        <span class="fs-6">Báo cáo</span>
                                    </button>
                                </div>
                            </div> 
                        </c:if>
                    </div>
                </div>
            </section>
        </div>
        <!-- End Feed-Auction  -->

        <!-- Notification -->
        <div class="col-lg-2 p-0 flex-column" style="display: inherit;">
            <div class="position-lg-sticky" style="top: 78px;">
                <div class="d-none d-lg-flex justify-content-between px-2 mt-lg-3">
                    <h4 class="text-center">Thông báo</h4>
                </div>
                <c:if test="${currentUser != null && notifications != null && notifications.size() != 0}">
                    <ul id="notification-content" class="w-100 list-group cus-content-friends list-group-flush d-flex flex-row flex-lg-column overflow-auto pb-2" style="top: 101px;" >
                        <c:forEach items="${notifications}" var="message">
                            <li class="list-group-item-none shadow-sm border border-1 p-2">
                                <div class="d-flex justify-content-between">
                                    <a class="fs-6 mb-0" style="white-space: nowrap;overflow: hidden;" href="${message.url != null ? message.url : 'javascript::'}">
                                        ${message.title}
                                    </a>

                                </div>

                                <p class="mb-0 text-muted" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">
                                    ${message.content}
                                </p>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
            </div>
        </div>
        <!-- End Notification -->
    </div>
</div>
<!-- End Content -->

<script>
    let imagesEvent = document.querySelectorAll('#list-item-image > li');
    let image = document.getElementById('main-image');

    imagesEvent.forEach((li) => {
        li.addEventListener('click', (event) => {
            image.setAttribute('src', event.target.getAttribute('src'));
        });
    });
</script>


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
                        document.getElementById("btn-report").textContent = "Đã gửi báo cáo"
                        document.getElementById("btn-report").setAttribute("disabled", "true")
                    })
                });
    </script>
</c:if>