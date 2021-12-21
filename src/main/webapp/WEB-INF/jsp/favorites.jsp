<%-- 
    Document : index Created on : Dec 10, 2021, 10:30:24 PM 
    Author : kan_haungo
--%> 

<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="string" uri="http://www.springframework.org/tags" %>

        <!-- Content -->
		<div class="container-xxl" >
			<div class="row">
                <!-- Feed-Auction -->
				<div class="col-12 col-lg-10">
                    <session>
                        <div class="d-flex my-sm-4 mt-3 mb-2 align-items-center">
                            <h3 class="me-3 m-0">Danh sách yêu thích</h3>
                        </div>
                        <div class="flex-column p-0" style="display: inherit;">
                            <div class="position-lg-sticky w-100 px-sm-4 pb-sm-2 filter-favorites" style="background-color: #ffffff; z-index: 1080;">
                                <div class="filter-rs d-flex justify-content-between">
                                    <div class="left d-flex align-items-center">
                                        <h5 class="d-none d-sm-block m-0 one-line me-1">50 kết quả </h5>
                                        <div class="input-group">
                                            <input type="text" id="filter-kw" class="form-control" placeholder="Nhập từ khóa" aria-label="Nhập từ khóa cần lọc">
                                            <button class="btn btn-outline-secondary" type="button">
                                                <i class="fas fa-search"></i>
                                            </button>
                                        </div>
                                    </div>
                                    <div class="right d-flex align-items-center">
                                        <h5 class="d-none d-sm-block m-0 one-line me-1">Lọc</h5>
                                        <select class="form-select" aria-label="Default select example" id="filter">
                                            <option selected>Phù hợp nhất</option>
                                            <option value="1">Mới nhất</option>
                                            <option value="2">Ưa thích nhiều</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="d-flex flex-wrap justify-content-evenly list-product">
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="card-text mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#go-to-store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="card-text mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#go-to-store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="card-text mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#go-to-store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="card-text mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#go-to-store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                            <div class="card position-relative border-0 m-2">
                                <img 
                                    src="public/assets/img/item/item-1.jpg" 
                                    class="card-img-top object-fit-cover"
                                >
                                <button 
                                    class="btn btn-light position-absolute top-0 end-0 rounded-circle p-1 mt-1 me-1"
                                    style="width: 30px; height: 30px;"
                                    type="button" 
                                >
                                    <i class="fas fa-heart" style="color: #dc3545; font-size: 20px;"></i>
                                </button>

                                <div class="card-body p-0">
                                    <div class="top-info-item d-flex justify-content-between">
                                        <p class="card-text mb-0">
                                            <span style="color: #dc3545;">10 Hrs Left</span>
                                        </p>
                                        <a class="mb-0"  href="#go-to-store">
                                            Hill Auction Gallery
                                        </a>
                                    </div>
                                    <div class="my-0 my-sm-1 my-md-2">
                                        <h4 class="m-0 d-inline-block text-uppercase text-xs font-weight-bold">150đ</h4>
                                        <small class="text-capitalize">(6 bids)</small>
                                    </div>
                                    <a href="javascript:;" class="text-dark fs-5 fs-md-4 d-block">
                                        Wholesale Louis Chanel Hermes Gucci & More
                                    </a>
                                </div>
                            </div>
                        </div>
                    </session>
                </div>
                <!-- End Feed-Auction  -->

                <!-- Friends -->
                <div class="col-lg-2 p-0 flex-column" style="display: inherit;">
                    <div class="position-lg-sticky d-none d-lg-block " style="top: 78px;">
                        <div class="d-none d-lg-flex justify-content-between px-2 mt-lg-3">
                            <h4 class="text-center">Người liên hệ</h4>
                        </div>
                        <ul class="w-100 list-group cus-content-friends list-group-flush d-flex flex-row flex-lg-column overflow-auto pb-2" style="top: 101px;" >
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-2.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Nguyễn Thị Hồng Hà</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-1.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Dung Ly</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-3.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Uyen Nguyen</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-4.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Thao Trang</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-2.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Ngoc Ha</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-1.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Dung Ly</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-3.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
                                    >
                                        <span class="visually-hidden">New alerts</span>
                                    </span>
                                </div>
                                <p class="mb-0">Uyen Nguyen</p>
                            </li>
                            <li class="list-group-item d-flex align-items-center bg-none">
                                <div class="me-3 position-relative">
                                    <img src="public/assets/img/avatar/user-4.jpg" height="48px" width="48px" 
                                        class="object-fit-cover avatar rounded-circle border " 
                                        alt="user" />
                                    <span class="position-absolute bg-success rounded-circle"
                                        style="width: 12px; height: 12px; bottom: 1px; right: 1px;"
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

