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
        <!-- Main Content -->
        <div class="col-12 col-lg-10">
            <session>
                <!-- User && Map -->
                <div class="row mt-3 mt-md-4">
                    <div class="col-12 col-sm-6 mb-3">
                        <div>
                            <div class="row mb-2 mb-md-3">
                                <div class="col-5">
                                    <img
                                        src="${user.avatar}"
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
                                        <h3 class="fs-3 fw-bold">
                                            ${user.firstName} ${user.lastName}
                                        </h3>
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
                                        >
                                        <i
                                            class="far fa-heart"
                                            style="color: white"
                                            ></i>
                                        <span class="fs-6">Theo dõi</span>
                                    </button>
                                </div>
                            </div>
                        </div>
                        <p class="mt-2 mt-md-3">
                            Riverside Galleries offers the finest quality,
                            certified collection of unique jewelry. We offer our
                            pieces at wholesale prices with exceptional value.
                            Whether your looking for a gift or to add to your
                            personal collection Riverside Galleries has what you
                            looking for. Preview our collection at one of our
                            auction partners and give us your best bid. You will
                            be amazed at the quality and value!
                        </p>
                    </div>
                    <div class="col-12 col-sm-6 mb-3">
                        <div class="card mb-3">
                            <div class="card-body">
                                <div style="height: 300px">
                                    <iframe
                                        src="https://www.google.com/maps/embed?pb=!1m10!1m8!1m3!1d7808.550551918089!2d107.1149681!3d11.8859101!3m2!1i1024!2i768!4f13.1!5e0!3m2!1sen!2s!4v1639107306520!5m2!1sen!2s"
                                        width="100%"
                                        height="100%"
                                        style="border: 0"
                                        allowfullscreen=""
                                        loading="lazy"
                                        ></iframe>
                                </div>
                                <div class="">
                                    <div class="card-body">
                                        <h5 class="card-title">
                                            Thôn 10, Bom Bo Bù Đăng
                                        </h5>
                                        <h5 class="fs-5">Bình Phước - VN</h5>
                                        <div
                                            class="
                                            d-flex
                                            justify-content-between
                                            "
                                            >
                                            <p class="card-text">
                                                (+84) 383793662
                                            </p>
                                            <a href="#mesage" class="card-text"
                                               >Nhắn tin</a
                                            >
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End User && Map  -->

                <!-- Navigate -->
                <div class="flex-column" style="display: inherit">
                    <div
                        class="position-lg-sticky"
                        style="
                        top: 78px;
                        background-color: #ffffff;
                        z-index: 1800;
                        "
                        >
                        <div class="d-flex border-bottom border-1 border-gray">
                            <div class="">
                                <a
                                    href="#auction"
                                    class="
                                    text-dark
                                    fs-4
                                    text-decoration-none
                                    me-2 me-md-4
                                    "
                                    >Đấu giá</a
                                >
                                <a
                                    href="#review"
                                    class="
                                    text-dark
                                    fs-4
                                    text-decoration-none
                                    me-2 me-md-4
                                    "
                                    >Đánh giá</a
                                >
                                <a
                                    href="#auction-finish"
                                    class="
                                    text-dark
                                    fs-4
                                    text-decoration-none
                                    me-2 me-md-4
                                    "
                                    >Đấu giá đã hoàn thành</a
                                >
                            </div>
                        </div>
                    </div>
                </div>
                <!-- End Navitgate -->

                <!-- List Auction  -->
                <div
                    class="
                    d-flex
                    flex-row flex-wrap
                    d-md-block
                    mt-3
                    position-relative
                    "
                    >
                    <div
                        id="auction"
                        class="position-absolute"
                        style="top: -87px"
                        ></div>
                    <h2 class="fs-2 pt-md-4 mt-3">Đấu giá</h2>
                    <c:forEach items="${auctions}" var="auction" >
                        <c:if test="${auction.acceptPrice == null}">
                            <div
                                class="
                                item-auction
                                row
                                m-0
                                flex-column flex-md-row
                                pb-3
                                shadow-sm
                                "
                                >
                                <div
                                    class="
                                    col-md-5
                                    p-0
                                    mt-3
                                    position-relative
                                    z-index-1
                                    "
                                    >
                                    <div
                                        href="javascript:;"
                                        class="d-block wrap-item-image"
                                        >
                                        <img
                                            src="${auction.images.iterator().next().image}"
                                            class="
                                            object-fit-cover
                                            h-100
                                            w-100
                                            rounded rounded-3
                                            "
                                            width="100%"
                                            />
                                    </div>
                                </div>
                                <div class="col-md-5 pt-3">
                                    <a href="<c:url value='/auction/${auction.id}' />" class="text-dark h5 d-block">
                                        ${auction.title}
                                    </a>
                                    <p class="mb-2">
                                        ${auction.content}
                                    </p>
                                </div>
                                <div class="col-md-2 pt-md-3">
                                    <div
                                        class="
                                        mb-0
                                        d-flex d-md-block
                                        justify-content-between
                                        "
                                        >
                                        <small class="text-muted"
                                               >Started ${auction.createAt}</small
                                        >
                                        <p class="mb-0 my-md-3">
                                            <span style="color: #dc3545"
                                                  >10 Hrs Left</span
                                            >
                                        </p>
                                    </div>
                                    <a
                                        type="button"
                                        href="<c:url value='/auction/${auction.id}' />"
                                        class="btn rounded-0 w-100 d-none d-md-block"
                                        style="background-color: #0aa2c0; color: white"
                                        >
                                        <span class="fs-6">Chi tiết</span>
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <!-- End List Auction  -->

                <!-- Review  -->
                <div class="overview-review mt-3 position-relative">
                    <div
                        id="review"
                        class="position-absolute"
                        style="top: -87px"
                        ></div>
                    <h2 class="fs-2 mt-3 pt-md-4">Đánh giá</h2>
                    <div
                        class="
                        d-flex
                        align-items-center
                        flex-column flex-sm-row
                        "
                        >
                        <div
                            class="
                            left
                            d-flex
                            flex-column
                            justify-content-center
                            "
                            >
                            <div class="star">
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
                            </div>
                            <p class="text-gray mb-0">4.5 out of 5.0 Stars</p>
                        </div>
                        <div class="right ms-3 ms-md-5">
                            <div class="d-flex align-items-center my-1 my-md-2">
                                <span class="me-2 me-md-4">5 Star</span>
                                <div
                                    class="progress"
                                    style="width: 200px; height: 10px"
                                    >
                                    <div
                                        class="progress-bar"
                                        role="progressbar"
                                        style="width: 85%"
                                        aria-valuenow="85"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                        ></div>
                                </div>
                                <span class="ms-2 ms-md-4"> 85% (85) </span>
                            </div>
                            <div class="d-flex align-items-center my-1 my-md-2">
                                <span class="me-2 me-md-4">4 Star</span>
                                <div
                                    class="progress"
                                    style="width: 200px; height: 10px"
                                    >
                                    <div
                                        class="progress-bar"
                                        role="progressbar"
                                        style="width: 10%"
                                        aria-valuenow="10"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                        ></div>
                                </div>
                                <span class="ms-2 ms-md-4"> 10% (10) </span>
                            </div>
                            <div class="d-flex align-items-center my-1 my-md-2">
                                <span class="me-2 me-md-4">3 Star</span>
                                <div
                                    class="progress"
                                    style="width: 200px; height: 10px"
                                    >
                                    <div
                                        class="progress-bar"
                                        role="progressbar"
                                        style="width: 5%"
                                        aria-valuenow="5"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                        ></div>
                                </div>
                                <span class="ms-2 ms-md-4"> 5% (5) </span>
                            </div>
                            <div class="d-flex align-items-center my-1 my-md-2">
                                <span class="me-2 me-md-4">2 Star</span>
                                <div
                                    class="progress"
                                    style="width: 200px; height: 10px"
                                    >
                                    <div
                                        class="progress-bar"
                                        role="progressbar"
                                        style="width: 0%"
                                        aria-valuenow="0"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                        ></div>
                                </div>
                                <span class="ms-2 ms-md-4"> 0% (0) </span>
                            </div>
                            <div class="d-flex align-items-center my-1 my-md-2">
                                <span class="me-2 me-md-4">1 Star</span>
                                <div
                                    class="progress"
                                    style="width: 200px; height: 10px"
                                    >
                                    <div
                                        class="progress-bar"
                                        role="progressbar"
                                        style="width: 0%"
                                        aria-valuenow="0"
                                        aria-valuemin="0"
                                        aria-valuemax="100"
                                        ></div>
                                </div>
                                <span class="ms-2 ms-md-4"> 0% (0) </span>
                            </div>
                        </div>
                    </div>

                    <!-- List review -->
                    <div class="list-review mt-2 mt-md-3 mt-lg-4">
                        <div class="item-review row mb-2 mb-md-3">
                            <div class="col-10 d-flex align-items-start">
                                <div style="flex: 2">
                                    <h4 class="fs-4 mb-0">
                                        Lucy
                                        <i
                                            class="fas fa-check-circle fs-6"
                                            style="color: #0aa2c0"
                                            ></i>
                                    </h4>
                                    <p class="m-0">Binh Phuoc, VN</p>
                                </div>
                                <div class="content mt-2" style="flex: 6">
                                    <div class="d-flex align-items-center">
                                        <div class="star">
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="far fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                        </div>
                                        <span class="date ms-2 ms-md-3"
                                              >Dec 08, 2021</span
                                        >
                                    </div>
                                    <p class="fs-6">
                                        This is the way that the whole online
                                        auction experience should work
                                    </p>
                                </div>
                            </div>
                            <div class="col-2 image-review">
                                <img
                                    src="public/assets/img/item/item-1.jpg"
                                    alt=""
                                    class="object-fit-cover"
                                    />
                            </div>
                        </div>
                        <div class="item-review row mb-2 mb-md-3">
                            <div class="col-10 d-flex align-items-start">
                                <div style="flex: 2">
                                    <h4 class="fs-4 mb-0">
                                        Lucy
                                        <i
                                            class="fas fa-check-circle fs-6"
                                            style="color: #0aa2c0"
                                            ></i>
                                    </h4>
                                    <p class="m-0">Binh Phuoc, VN</p>
                                </div>
                                <div class="content mt-2" style="flex: 6">
                                    <div class="d-flex align-items-center">
                                        <div class="star">
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="fas fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                            <i
                                                class="far fa-star fs-6"
                                                style="color: #0aa2c0"
                                                ></i>
                                        </div>
                                        <span class="date ms-2 ms-md-3"
                                              >Dec 08, 2021</span
                                        >
                                    </div>
                                    <p class="fs-6">
                                        This is the way that the whole online
                                        auction experience should work
                                    </p>
                                </div>
                            </div>
                            <div class="col-2 image-review">
                                <img
                                    src="public/assets/img/item/item-1.jpg"
                                    alt=""
                                    class="object-fit-cover"
                                    />
                            </div>
                        </div>
                    </div>
                    <!-- End List review -->
                </div>
                <!-- End Review -->

                <!-- Auction Finish -->
                <div class="auction-finish mt-3 position-relative">
                    <div
                        id="auction-finish"
                        class="position-absolute"
                        style="top: -87px"
                        ></div>
                    <h2 class="fs-2 mt-3 pt-md-4">Đấu giá đã hoàn thành</h2>
                    <c:forEach items="${auctions}" var="auction" >
                        <c:if test="${auction.acceptPrice != null}">
                            <div class="card position-relative border-0 m-2">
                                <c:if test="${auction.images != null && auction.images.size() > 0}">
                                    <img
                                        src="${auction.images.iterator().next().image}"
                                        class="card-img-top object-fit-cover"
                                        />
                                </c:if>
                                <button
                                    class="
                                    btn btn-light
                                    position-absolute
                                    top-0
                                    end-0
                                    rounded-circle
                                    p-1
                                    mt-1
                                    me-1
                                    "
                                    style="width: 30px; height: 30px"
                                    type="button"
                                    >
                                    <i
                                        class="fas fa-heart"
                                        style="color: #dc3545; font-size: 20px"
                                        ></i>
                                </button>

                                <div class="card-body p-0">
                                    <div
                                        class="
                                        top-info-item
                                        d-flex
                                        justify-content-between
                                        "
                                        >
                                        <p class="mb-0">
                                            <span style="color: #dc3545"
                                                  >10 Hrs Left</span
                                            >
                                        </p>
                                        <a class="mb-0" href="<c:url value="/user/${auction.user.id}" />">
                                            ${auction.user.firstName} ${auction.user.lastName}
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4
                                            class="
                                            m-0
                                            d-inline-block
                                            text-uppercase text-xs
                                            font-weight-bold
                                            "
                                            >
                                            ${auction.basePrice}
                                        </h4>
                                        <small class="text-capitalize">(${auction.countComment} bids)</small>
                                    </div>
                                    <a
                                        href="<c:url value="/auction/${auction.id}" />"
                                        class="text-dark fs-5 fs-md-4 d-block"
                                        >
                                        ${auction.title}
                                    </a>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
                <!-- End Auction Finish -->
            </session>
        </div>
        <!-- End Main Content  -->

        <!-- Friends -->
        <div class="col-lg-2 p-0 flex-column" style="display: inherit">
            <div class="position-lg-sticky d-none d-lg-block" style="top: 78px">
                <div
                    class="
                    d-none d-lg-flex
                    justify-content-between
                    px-2
                    mt-lg-3
                    "
                    >
                    <h4 class="text-center">Người liên hệ</h4>
                </div>
                <ul
                    class="
                    w-100
                    list-group
                    cus-content-friends
                    list-group-flush
                    d-flex
                    flex-row flex-lg-column
                    overflow-auto
                    pb-2
                    "
                    style="top: 101px"
                    >
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-2.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Nguyễn Thị Hồng Hà</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-1.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Dung Ly</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-3.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Uyen Nguyen</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-4.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Thao Trang</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-2.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Ngoc Ha</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-1.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Dung Ly</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-3.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Uyen Nguyen</p>
                    </li>
                    <li
                        class="
                        list-group-item
                        d-flex
                        align-items-center
                        bg-none
                        "
                        >
                        <div class="me-3 position-relative">
                            <img
                                src="public/assets/img/avatar/user-4.jpg"
                                height="48px"
                                width="48px"
                                class="
                                object-fit-cover
                                avatar
                                rounded-circle
                                border
                                "
                                alt="user"
                                />
                            <span
                                class="
                                position-absolute
                                bg-success
                                rounded-circle
                                "
                                style="
                                width: 12px;
                                height: 12px;
                                bottom: 1px;
                                right: 1px;
                                "
                                >
                                <span class="visually-hidden">New alerts</span>
                            </span>
                        </div>
                        <p class="mb-0">Thao Trang</p>
                    </li>
                </ul>
            </div>
        </div>
        <!-- End Friends -->
    </div>
</div>
<!-- End Content -->
