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
                        <li class="breadcrumb-item">Đấu giá</li>
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
                                src="${auction.images[0].image}"
                                alt="main-image"
                                />
                            <button
                                class="
                                btn btn-light
                                position-absolute
                                top-0
                                end-0
                                rounded-circle
                                p-1
                                mt-2
                                me-2
                                "
                                style="width: 30px; height: 30px"
                                type="button"
                                >
                                <i
                                    class="fas fa-heart"
                                    style="color: #dc3545; font-size: 20px"
                                    ></i>
                            </button>
                        </div>
                    </div>
                    <div class="col-md-6 col-12">
                        <h3 class="fs-2 mb-sm-4 mt-2">
                            ${auction.title}
                        </h3>
                        <div class="d-flex justify-content-between">
                            <p class="mb-1">Estimate $31,525 - $36,996</p>
                            <p class="mb-1 text-danger">1d 11h 41m 13s</p>
                        </div>
                        <div class="p-4" style="background-color: #fbf6f4">
                            <div class="d-flex align-items-center">
                                <p class="fs-1 mb-0 me-2 me-lg-3">${auction.basePrice}đ</p>
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
                                    ${auction.countComment} bids
                                </p>
                            </div>
                            <div class="my-3">
                                <label for="bid">Chọn giá bạn muốn</label>
                                <select
                                    class="form-select form-select-lg"
                                    aria-label="Chọn giá muốn đấu giá"
                                    >
                                    <option selected>350</option>
                                    <option value="1">400</option>
                                    <option value="2">450</option>
                                    <option value="3">500</option>
                                    <option value="4">600</option>
                                    <option value="5">800</option>
                                    <option value="6">1.000</option>
                                </select>
                            </div>
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
                                data-bs-toggle="modal" data-bs-target="#loginModal" role="button"
                                >
                                ${currentUser != null ? 'Đấu giá' : 'Bạn cần đăng nhập'}
                            </button>
                        </div>
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

<script>
    let imagesEvent = document.querySelectorAll('#list-item-image > li');
    let image = document.getElementById('main-image');

    imagesEvent.forEach((li) => {
        li.addEventListener('click', (event) => {
            image.setAttribute('src', event.target.getAttribute('src'));
        });
    });
</script>
