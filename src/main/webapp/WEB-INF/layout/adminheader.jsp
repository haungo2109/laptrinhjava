<%-- 
    Document   : adminheader
    Created on : Dec 23, 2021, 9:58:11 AM
    Author     : kan_haungo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<c:url value="/admin" var="goHome" />

<header class="shadow mb-1">
<div class="container ">
    <ul class="nav align-items-center">
        <li>
            <a
                class="navbar-brand fs-3"
                href="${goHome}"
                rel="tooltip"
                title="Kanj - Social Media"
                data-placement="bottom"
                >
                KANJ
            </a>
        </li>
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="<c:url value="/admin" />">Thống kê</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/report-post/" />">Báo cáo bài viết</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="<c:url value="/admin/report-auction/" />">Báo cáo đấu giá</a>
        </li>
        <li><a class="nav-item" href="<c:url value="/logout" />"><i class="fas fa-sign-out-alt"></i> Đăng xuất</a></li>
    </ul>
</div>
</header>