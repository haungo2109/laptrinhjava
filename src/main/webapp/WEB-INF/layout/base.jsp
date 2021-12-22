<%-- 
    Document   : base
    Created on : Dec 12, 2021, 9:20:09 AM
    Author     : kan_haungo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:importAttribute name="javascripts"/>
<tiles:importAttribute name="stylesheets"/>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title><tiles:insertAttribute name="title" /></title>
        <link rel="shortcut icon" href="<c:url value="/img/logo/logo.png" />" type="image/x-icon">
        <link
            href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
            rel="stylesheet"
            integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
            crossorigin="anonymous"
            />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:ital,wght@0,400;0,600;0,700;1,300;1,400&display=swap" rel="stylesheet">
        <c:if test="${stylesheets != null}">
            <c:forEach var="css" items="${stylesheets}">
                <link rel="stylesheet" type="text/css" href="<c:url value="${css}"/>">
            </c:forEach>
        </c:if>
        <link
            rel="stylesheet"
            href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
            integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
            crossorigin="anonymous"
            />
        <script
            src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"
        ></script>
        <script src="<c:url value="/js/utils.js"/>"></script>
        <style>
            .textInvalidForm{
                font-size: 0.8rem;
                color: red;
            }
        </style>
    </head>
    <body style="background-color: #ffffff;">
        <tiles:insertAttribute name="header" />
        <tiles:insertAttribute name="content" />
        <tiles:insertAttribute name="footer" />
        <c:if test="${javascripts != null}">
            <c:forEach var="script" items="${javascripts}">
                <script src="<c:url value="${script}"/>"></script>
            </c:forEach>
        </c:if>
        <script>
            let items = document.getElementsByClassName("time-feed");
            for (const c of items) {
                let t = new Date(c.textContent.trim());
                if (t.getTime()) {
                    c.textContent = timeSince(t);
                }
            }
            
            let itemTimeLeft = document.getElementsByClassName("time-left");
            for (const c of itemTimeLeft) {
                let t = new Date(c.textContent.trim());
                if (t.getTime()) {
                    c.textContent = futureSince(t);
                }
            }
        </script>
    </body>
</html>
