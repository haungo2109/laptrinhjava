<%-- 
    Document   : reportPost
    Created on : Dec 23, 2021, 8:56:24 AM
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
    <div style="width: 50%" >
        <h1 class="fs-4">Biều đồ số bài viết theo tháng</h1>
        <div style="width: 400px; height: 400px" class="m-auto">
            <canvas id="countFeedChart" width="400" height="400"></canvas>
        </div>
    </div>
</div>

<script>
    let cateLabels = [], cateInfo = [];

    <c:forEach items="${feedStats}" var="c">
    cateLabels.push('${c[0]}')
    cateInfo.push(${c[1]})
    </c:forEach>
    console.log({cateLabels, cateInfo});
    
    window.onload = function () {
        lineChart("countFeedChart", cateLabels, cateInfo);
    }
</script>