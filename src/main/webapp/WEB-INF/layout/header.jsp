<%-- 
    Document   : header
    Created on : Dec 12, 2021, 9:22:07 AM
    Author     : kan_haungo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>


<!--Init-->
<c:url var="backgroundLogin" value="/img/background/bg-login.jpg" />
<c:url value="/register" var="actionRegister" />
<c:url value="/login" var="actionLogin" />
<c:url value="/" var="goHome" />
<!--End Init-->



<nav class="navbar navbar-expand-lg navbar-light bg-white z-index-33 py-2 shadow sticky-top">
    <div class="container flex-wrap flex-lg-nowrap">
        <div class="d-flex d-lg-block flex-nowrap justify-content-between w-100 w-lg-auto">
            <a
                class="navbar-brand fs-3"
                href="${goHome}"
                rel="tooltip"
                title="Kanj - Social Media"
                data-placement="bottom"
                >
                KANJ
            </a>
            <div class="d-lg-none">
                <div class="input-group">
                    <div class="d-none d-sm-block">
                        <select
                            class="form-select"
                            aria-label="type search"
                            >
                            <option selected>Loại tìm kiếm</option>
                            <option value="1">Tên người</option>
                            <option value="2">Nội dung</option>
                            <option value="3">Tiêu đề</option>
                        </select>
                    </div>
                    <input type="text" class="form-control flex-grow-2 rounded-start" />
                    <button
                        class="btn btn-outline-secondary"
                        type="button"
                        >
                        <i class="fas fa-search"></i>
                    </button>
                </div>
            </div>
            <button
                class="navbar-toggler shadow-none ms-2"
                style="width: 43px; height: 43px;"
                type="button"
                data-bs-toggle="collapse"
                data-bs-target="#navigation"
                aria-controls="navigation"
                aria-expanded="false"
                aria-label="Toggle navigation"
                >
                <i class="fas fa-bars"></i>
            </button>

        </div>
        <div
            class="collapse navbar-collapse w-100 pt-3 pb-2 py-lg-0"
            id="navigation"
            >
            <ul class="navbar-nav navbar-nav-hover mx-auto align-items-lg-center">
                <li class="nav-item mx-2 d-none d-lg-block">
                    <div class="input-group">
                        <span class="input-group-text">Tìm kiếm</span>
                        <input
                            type="text"
                            style="width: 365px;"
                            class="form-control flex-grow-3"
                            id="input-search-kw"
                            aria-label="Text input with dropdown button"
                            />
                        <button
                            class="btn btn-outline-secondary"
                            type="submit"
                            onclick="searchKw()"
                            >
                            <i class="fas fa-search"></i>
                        </button>
                        <script>
                            function searchKw(){
                                let kw = document.getElementById("input-search-kw").value.trim();
                                window.location.href = "/laptrinhjava/category/?kw="+kw;
                            }
                        </script>
                    </div>
                </li>
                <c:choose>
                    <c:when test="${currentUser != null}">
                        <li><a class="dropdown-item d-lg-none" href="<c:url value="/user/${currentUser.id}" />">Cá nhân</a></li>
                        <li><a class="dropdown-item d-lg-none" href="<c:url value="/user/${currentUser.id}#auction" />">Đấu giá của tôi</a></li>
                        <li><a class="dropdown-item d-lg-none" href="<c:url value="/auctionJoin" />">Đấu giá đã tham gia</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item d-lg-none" href="<c:url value="/logout" />"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
                        </c:when>
                        <c:otherwise>
                        <li>
                            <div class="dropdown-item d-lg-none bg-gradient-primary m-0" role="button" style="cursor: pointer;"
                                 data-bs-toggle="modal" data-bs-target="#loginModal">
                                <i class="fas fa-sign-in-alt"></i> 
                                Đăng nhập
                            </div>
                        </li>
                        <li><div class="dropdown-item d-lg-none bg-gradient-primary m-0" role="button"
                                 style="cursor: pointer;"
                                 data-bs-toggle="modal" data-bs-target="#registerModal">
                                <i class="fas fa-user-plus"></i>
                                Đăng ký
                            </div>
                        </li>
                    </c:otherwise>
                </c:choose>
            </ul>
        </div>

        <c:choose>
            <c:when test="${currentUser != null}">
                <div class="d-none d-lg-block nav-item ms-3 h-100">
                    <a href="<c:url value="/auctionJoin" />"
                        class="btn btn-sm bg-gradient-primary m-0"
                        role="button"
                        style="cursor: pointer;"
                        >
                        <i class="far fa-heart" style="font-size: 22px; color: gray"></i>
                        <p class="fs-6 fw-lighter mb-0 text-nowrap">Đang đấu giá</p> 
                    </a>
                </div>
                <div class="d-none d-lg-block nav-item ms-3 h-100 position-relative">
                    <div type="button" class="btn btn-link dropdown-toggle dropdown-toggle-split m-0" 
                         data-bs-toggle="dropdown" 
                         aria-expanded="false"
                         id="hidden-after"
                         role="button"
                         style="cursor: pointer;"
                         >
                        <div class="m-0">
                            <img
                                class="rounded-circle object-fit-cover"
                                width="22px"
                                height="22px"
                                alt="Image placeholder"
                                src="${currentUser.avatar}"
                                />
                        </div>
                        <p class="fs-6 fw-lighter mb-0 text-nowrap text-dark text-decoration-none">
                            ${currentUser.firstName} ${currentUser.lastName}
                        </p>
                    </div>
                    <ul class="dropdown-menu dropdown-menu-lg-end shadow-lg">
                        <li><a class="dropdown-item" href="<c:url value="/user/${currentUser.id}" />">Cá nhân</a></li>
                        <li><a class="dropdown-item" href="<c:url value="/user/${currentUser.id}#auction" />">Đấu giá của tôi</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="<c:url value="/logout" />">
                                <i class="fas fa-sign-out-alt"></i> Đăng xuất
                            </a>
                        </li>
                    </ul>
                </div>
            </c:when>
            <c:otherwise>
                <div class="d-none d-lg-block nav-item ms-3 h-100">
                    <div
                        class="btn btn-sm bg-gradient-primary m-0"
                        role="button"
                        style="cursor: pointer;"
                        data-bs-toggle="modal" data-bs-target="#loginModal"
                        >
                        <i class="fas fa-sign-in-alt" style="font-size: 22px; color: gray"></i>
                        <p class="fs-6 fw-lighter mb-0 text-nowrap">Đăng nhập</p> 
                    </div>
                </div>
                <div class="d-none d-lg-block nav-item ms-3 h-100">
                    <div
                        class="btn btn-sm bg-gradient-primary m-0"
                        role="button"
                        style="cursor: pointer;"
                        data-bs-toggle="modal" data-bs-target="#registerModal"
                        >
                        <i class="fas fa-user-plus" style="font-size: 22px; color: gray"></i>
                        <p class="fs-6 fw-lighter mb-0 text-nowrap">Đăng ký</p> 
                    </div>
                </div>
            </c:otherwise>
        </c:choose>        
    </div>
</nav>

<c:if test="${user != null}">

    <!-- Modal Login -->
    <div class="modal fade" id="loginModal" tabindex="-1" aria-labelledby="loginModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body p-0 position-relative">
                    <button type="button" class="btn-close position-absolute top-0 end-0 z-index-2000 p-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="card m-0 w-100 border-0">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="${backgroundLogin}" 
                                     class="img-fluid h-100 w-100 object-fit-cover rounded-start" 
                                     alt="bg-login"
                                     style="object-position: 77% 50%;"
                                     >
                            </div>
                            <div class="col-md-8">
                                <div class="card-body my-4">
                                    <h4 class="card-title text-center">KANJ - Login</h4>
                                    <p class="card-text mt-4 mb-3">Đăng nhập để bắt đầu các cuộc đấu giá</p>
                                    <c:if test="${param.error != null}">
                                        <div class="textInvalidForm">
                                            Thông tin đăng nhập sai, vui lòng thử lại
                                        </div>
                                    </c:if>
                                    <c:if test="${param.accessDenied != null}">
                                        <div class="textInvalidForm">
                                            Bạn không có quyền truy cập!!
                                        </div>
                                    </c:if>

                                    <form action="${actionLogin}" method="post">
                                        <div class="mb-2">
                                            <label for="username_email" class="form-label m-0">
                                                <string:message code="label.namelogin" />
                                            </label>
                                            <input
                                                type="text" 
                                                name="username" 
                                                class="form-control" 
                                                placeholder="Nhập tên đăng nhập" 
                                                id="username_email"
                                                required />
                                        </div>
                                        <div class="mb-2">
                                            <label for="password-login" class="form-label m-0">
                                                <string:message code="label.password" />
                                            </label>
                                            <input type="password"
                                                   name="password" 
                                                   class="form-control" 
                                                   placeholder="Nhập password"
                                                   required
                                                   id="password-login" />
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100 mt-3">Đăng nhập</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Login  -->



    <!-- Modal Register -->
    <div class="modal fade" id="registerModal" tabindex="-1" aria-labelledby="registerModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-body p-0 position-relative">
                    <button type="button" class="btn-close position-absolute top-0 end-0 z-index-2000 p-3" data-bs-dismiss="modal" aria-label="Close"></button>
                    <div class="card m-0 w-100 border-0">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <img src="${backgroundLogin}" 
                                     class="img-fluid h-100 w-100 object-fit-cover rounded-start" 
                                     alt="bg-login"
                                     style="object-position: 77% 50%;"
                                     >
                            </div>
                            <div class="col-md-8">
                                <div class="card-body my-4">
                                    <h4 class="card-title text-center">KANJ - Đăng ký</h4>

                                    <form:form method="post" modelAttribute="user" enctype="multipart/form-data" action="${actionRegister}" >
                                        <div class="mb-2">
                                            <label for="firstName" class="form-label m-0">
                                                <string:message code="label.fullName" />
                                            </label>
                                            <div class="input-group">
                                                <form:input type="text" 
                                                            path="firstName" 
                                                            name="firstName" 
                                                            class="form-control" 
                                                            placeholder="Nhập họ và tên đệm" 
                                                            required="true"
                                                            id="firstName"
                                                            />
                                                <form:input type="text" 
                                                            path="lastName" 
                                                            name="lastName" 
                                                            class="form-control" 
                                                            required="true"
                                                            placeholder="Nhập tên của bạn" 
                                                            />
                                            </div>
                                            <form:errors path="firstName" cssClass="textInvalidForm" element="div"  />
                                            <form:errors path="lastName" cssClass="textInvalidForm" element="div"  />
                                        </div>
                                        <div class="mb-2">
                                            <label for="username" class="form-label mb-1">
                                                <string:message code="label.username" />
                                            </label>
                                            <form:input type="text"
                                                        path="username" 
                                                        name="username"
                                                        class="form-control" 
                                                        placeholder="Nhập tên đăng nhập" 
                                                        id="username"
                                                        required="true"
                                                        />
                                            <c:if test="${messageErrorRegister != null}" >
                                                <div class="textInvalidForm">
                                                    ${messageErrorRegister}
                                                </div>
                                            </c:if>
                                            <form:errors path="username" cssClass="textInvalidForm" element="div"  />
                                        </div>
                                        <div class="mb-2">
                                            <label for="email" class="form-label m-0">
                                                <string:message code="label.email" />
                                            </label>
                                            <form:input type="email" 
                                                        path="email" 
                                                        name="email" 
                                                        class="form-control" 
                                                        placeholder="Nhập địa chỉ email" 
                                                        id="email"
                                                        required="true"
                                                        />
                                        </div>
                                        <div class="mb-2">
                                            <label for="phone" class="form-label m-0">
                                                <string:message code="label.phone" />
                                            </label>
                                            <form:input type="text" 
                                                        path="phone" 
                                                        name="phone" 
                                                        class="form-control" 
                                                        placeholder="Nhập số điện thoại" 
                                                        id="phone"
                                                        required="true"
                                                        />
                                            <form:errors path="phone" cssClass="textInvalidForm" element="div"  />
                                        </div>
                                        <div class="mb-2">
                                            <label for="password" class="form-label m-0">
                                                <string:message code="label.password" />
                                            </label>
                                            <form:input type="password"
                                                        path="password"
                                                        name="password" 
                                                        class="form-control" 
                                                        placeholder="Nhập password" 
                                                        required="true"
                                                        id="password"/>
                                            <form:errors path="password" cssClass="textInvalidForm" element="div"  />
                                        </div>
                                        <div class="mb-2">
                                            <label for="avatar" class="form-label m-0">
                                                <string:message code="label.image" />
                                            </label>
                                            <form:input type="file" 
                                                        path="file"
                                                        name="avatar" 
                                                        class="form-control" 
                                                        required="true"
                                                        id="avatar" />
                                            <form:errors path="file" cssClass="textInvalidForm" element="div"  />
                                        </div>
                                        <button type="submit" class="btn btn-primary w-100 mt-2">Đăng ký</button>
                                    </form:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Modal Register  -->

</c:if>

<script>
    var loginModal = document.getElementById('loginModal');
    var registerModal = document.getElementById('registerModal');
    if (window.location.pathname.indexOf("login") !== -1) {
        new bootstrap.Modal(loginModal, {keyboard: false}).show()
        console.log("open login modal");
    } else if (window.location.pathname.indexOf("register") !== -1) {
        new bootstrap.Modal(registerModal, {keyboard: false}).show()
        console.log("open register modal");
    }
</script>