<%-- 
    Document : index Created on : Dec 10, 2021, 10:30:24 PM 
    Author : kan_haungo
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>

<c:url value="/" var="goHome" />

<!-- Content -->
<div class="container-xxl">
    <div class="row">
        <!-- Feed-Auction -->
        <div class="col-12 col-lg-10">
            <section>
                <nav aria-label="breadcrumb" class="my-lg-4 my-2">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item">
                            <a href="${goHome}">KanJ</a>
                        </li>
                        <li class="breadcrumb-item">Đấu giá</li>
                        <li class="breadcrumb-item active" aria-current="page">
                            ${typeCategory}
                        </li>
                    </ol>
                </nav>
                <div class="d-flex mb-4 align-items-center">
                    <h3 class="me-3 m-0">${typeCategory}</h3>
                    <c:if test="${typeCategory != 'Tất cả'}" >
                        <button
                            type="button"
                            class="btn rounded-0"
                            style="background-color: #0aa2c0; color: white"
                            >
                            <i class="far fa-heart" style="color: white"></i>
                            <span class="fs-6">Theo dõi loại này</span>
                        </button>
                    </c:if>
                </div>


                <!--Category-->
                <div
                    id="carouselCategory"
                    class="carousel slide"
                    data-bs-ride="carousel"
                    >
                    <div class="carousel-inner px-0 px-sm-5">
                        <div class="carousel-item active">
                            <ul
                                class="
                                d-flex
                                flex-row
                                justify-content-between
                                overflow-auto
                                ul-none
                                m-0
                                pb-2
                                p-0 p-lg-0
                                cus-content-scroll-category
                                "
                                >
                                <c:if test="${categories != null}">
                                    <c:forEach items="${categories}" var="category" >
                                        <li class="border-0 mb-lg-2 me-2 me-lg-0">
                                            <div
                                                class="hover-border-primary"
                                                style="overflow: hidden"
                                                >
                                                <a
                                                    class="
                                                    mx-1
                                                    py-xxl-2
                                                    px-xxl-4
                                                    p-0
                                                    rounded rounded-3 d-block
                                                    "
                                                    style="background-color: #f4f4f4"
                                                    href="<c:url value="/category/?id=${category.id}" />"
                                                    >
                                                    <img
                                                        src="${category.image}"
                                                        class="
                                                        object-fit-cover
                                                        w-100
                                                        h-100
                                                        "
                                                        alt=""
                                                        />
                                                </a>
                                                <h6 class="text-center mt-2">
                                                    ${category.name}
                                                </h6>
                                            </div>
                                        </li>
                                    </c:forEach>
                                </c:if>
                            </ul>
                        </div>
                    </div>
                    <button
                        class="carousel-prev start-1"
                        type="button"
                        data-bs-target="#carouselCategory"
                        data-bs-slide="prev"
                        >
                        <i
                            class="fas fa-chevron-left"
                            style="font-size: 30px; color: #495057"
                            ></i>
                    </button>
                    <button
                        class="carousel-next"
                        type="button"
                        data-bs-target="#carouselCategory"
                        data-bs-slide="next"
                        >
                        <i
                            class="fas fa-chevron-right"
                            style="font-size: 30px; color: #495057"
                            ></i>
                    </button>
                </div>

                <!--End category-->


                <!--Tool filter-->
                <div class="filter-rs d-flex justify-content-between">
                    <div class="left d-flex align-items-center">
                        <h5 class="d-none d-sm-block m-0 one-line me-1">
                            50 kết quả
                        </h5>
                        <div class="input-group">
                            <input
                                type="text"
                                id="filter-kw"
                                class="form-control"
                                placeholder="Nhập từ khóa"
                                aria-label="Nhập từ khóa cần lọc"
                                />
                            <button
                                class="btn btn-outline-secondary"
                                type="button"
                                >
                                <i class="fas fa-search"></i>
                            </button>
                        </div>
                    </div>
                    <div class="right d-flex align-items-center">
                        <h5 class="d-none d-sm-block m-0 one-line me-1">Lọc</h5>
                        <select
                            class="form-select"
                            aria-label="Default select example"
                            id="filter"
                            >
                            <option selected>Phù hợp nhất</option>
                            <option value="1">Mới nhất</option>
                            <option value="2">Ưa thích nhiều</option>
                        </select>
                    </div>
                </div>

                <!--End Tool filter-->


                <div
                    class="d-flex flex-wrap justify-content-evenly list-product"
                    >
                    <c:if test="${auctions != null}">
                        <c:forEach items="${auctions}" var="auction" >
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
                        </c:forEach>
                    </c:if>
                </div>
            </section>
        </div>
        <!-- End Feed-Auction  -->

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
