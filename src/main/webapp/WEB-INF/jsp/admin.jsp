<%-- 
    Document   : admin
    Created on : Dec 23, 2021, 9:14:35 AM
    Author     : kan_haungo
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<style>
    .small-box {
        border-radius: 0.25rem;
        box-shadow: 0 0 1px rgb(0 0 0 / 13%), 0 1px 3px rgb(0 0 0 / 20%);
        display: block;
        margin-bottom: 20px;
        position: relative;
    }
    .small-box .icon {
        color: rgba(0,0,0,.15);
        z-index: 0;
    }
    .small-box>.small-box-footer {
        background-color: rgba(0,0,0,.1);
        color: rgba(255,255,255,.8);
        display: block;
        padding: 3px 0;
        position: relative;
        text-align: center;
        text-decoration: none;
        z-index: 10;
    }
</style>

<div class="container mt-3">
    <div class="row mb-2">
        <div class="col-sm-6">
            <h1 class="m-0 fs-3">Thống kê</h1>
        </div><!-- /.col -->
    </div><!-- /.row -->
    <div class="row">
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-info">
                <div class="inner p-2">
                    <h3>${countFeed}</h3>
                    <p class="mb-1">Tổng bài viết</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="<c:url value="/admin/report-post/" />" class="small-box-footer">Xem chi tiết<i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box " style="background-color: #6ea8fe">
                <div class="inner p-2">
                    <h3>${countAuction}</h3>
                    <p class="mb-1">Tổng đấu giá</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="<c:url value="/admin/report-auction/" />" class="small-box-footer">Xem chi tiết<i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
        <div class="col-lg-3 col-6">
            <!-- small box -->
            <div class="small-box bg-warning">
                <div class="inner p-2">
                    <h3>${countReport}</h3>
                    <p class="mb-1">Số báo cáo vi phạm</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="<c:url value="/admin" />" class="small-box-footer">Xem chi tiết<i class="fas fa-arrow-circle-right"></i></a>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <h4 class="fs-3">Báo cáo</h4>
    <table class="table">
        <tr>
            <th>Nội dung</th>
            <th>Loại báo cáo</th>
            <th>Người bị báo cáo</th>
        </tr>
        <c:forEach items="${reports}" var="c">
            <tr>
                <td>${c.content}</td>
                <td>${c.typeReport.name}</td>
                <td>${c.userReport.firstName} ${c.userReport.lastName}</td>
            </tr> 
        </c:forEach>
    </table>
</div>

<script>
//    let auctions = [], feeds = [], reports = [];
//    <c:forEach items="${overview}" var="c">
//        auctions.push('${c[0]}')
//        feeds.push('${c[1]}')
//        reports.push('${c[2]}')
//    </c:forEach>
//    console.log({auctions, feeds, reports});
</script>