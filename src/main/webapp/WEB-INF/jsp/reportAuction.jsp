<%-- 
    Document   : reportAuction
    Created on : Dec 23, 2021, 8:56:13 AM
    Author     : kan_haungo
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<style>
    .content{
        display: flex;
        flex-wrap: wrap;
        box-sizing: border-box;
    }
    .content > div {
        flex: 50%
    }
</style>

<div class="content mt-3 container justify-content-evenly text-center">
    <div style="width: 50%">
        <h1 class="fs-4">Thống kê đấu giá theo loại đấu giá</h1>
        <div style="width: 400px; height: 400px" class="m-auto">
            <canvas id="categoryAuctionChart" width="400" height="400"></canvas>
        </div>
    </div>
    <div style="width: 50%" >
        <h1 class="fs-4">Biều đồ giá</h1>
        <div style="width: 400px; height: 400px" class="m-auto">
            <canvas id="priceAuctionChart" width="400" height="400"></canvas>
        </div>
        <div class="mb-3 w-50 m-auto" id="filterDateAuction">
            <div class="input-group mb-1">
                <label class="input-group-text">Từ</label>
                <input type="date" class="form-control" value="2021-01-01" id="fromDate">
            </div>
            <div class="input-group mb-1">
                <span class="input-group-text">đến</span>
                <input type="date" class="form-control" value="2021-12-31" id="toDate">
            </div>
            <button onclick="filterDateAuction()" class="btn btn-success w-100">Lọc</button>
        </div>
    </div>
    <div style="width: 50%">
        <h1 class="fs-4">Thống kê theo trạng thái đấu giá</h1>
        <div style="width: 400px; height: 400px" class="m-auto">
            <canvas id="statusAuctionChart" width="400" height="400"></canvas>
        </div>
    </div>
</div>

<script>
    let params = getQueryParams();
    if (params.fromDate)
        document.getElementById("fromDate").value = params.fromDate;
    if (params.toDate)
        document.getElementById("toDate").value = params.toDate;
</script>
<script>
    const nameStatus = {
        being: "Đang đấu giá",
        inprocess: "Đang giao dịch",
        fail: "Đấu giá thất bại",
        success: "Đấu giá thành công",
    }
    function filterDateAuction() {
        let fromDate = document.getElementById("fromDate").value;
        let toDate = document.getElementById("toDate").value;

        const baseUrl = "http://localhost:8088/laptrinhjava/admin/report-auction/?"
        window.location.href = baseUrl + new URLSearchParams({fromDate, toDate}).toString();
    }
    (function () {
        let cateLabels = [], cateInfo = [];

    <c:forEach items="${categoryStats}" var="c">
        cateLabels.push('${c[1]}')
        cateInfo.push(${c[2]})
    </c:forEach>
        
        let statusLabels = [], countAuction = [];

    <c:forEach items="${statusAuction}" var="c">
        statusLabels.push('${c[0]}')
        countAuction.push(${c[1]})
    </c:forEach>
        statusLabels = statusLabels.map(c=>nameStatus[c])
        console.log({cateLabels, cateInfo});

        let labels = [], basePrice = [], currentPrice = [], total = [];
    <c:forEach items="${auctionStats}" var="c">
        labels.push('${c[0]}')
        total.push('${c[1]}')
        currentPrice.push('${c[2]}')
        basePrice.push(${c[3]})
    </c:forEach>

        console.log({labels, basePrice, currentPrice, total});
        window.onload = function () {
            twoLineChart("priceAuctionChart", labels, basePrice, currentPrice, total);
            cateChart("categoryAuctionChart", cateLabels, cateInfo);
            cateChart("statusAuctionChart", statusLabels, countAuction);
        }
    })();
</script>