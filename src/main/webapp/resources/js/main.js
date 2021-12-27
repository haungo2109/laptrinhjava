function likeFeed(feedId, target) {
    let isLike = target.getAttribute("data-like") == 'false';
    let url = "/laptrinhjava/api/like-feed";

    if (isLike == false)
        url = "/laptrinhjava/api/dislike-feed";

    fetch(url, {
        method: "post",
        body: JSON.stringify({
            feedId: feedId
        }),
        headers: {
            "Content-Type": "application/json"
        }}).then((response) => {
        if (response.status !== 200)
            return console.error(response.message);

        let numberLike = target.textContent.trim().split(" ")[0];

        if (isLike) {
            target.querySelector("i").classList.replace("far", "fas")
            target.lastChild.textContent = `${parseInt(numberLike) + 1} Đã thích`;
            target.setAttribute("data-like", true);
        } else {
            target.querySelector("i").classList.replace("fas", "far")
            target.lastChild.textContent = `${parseInt(numberLike) - 1} Thích`;
            target.setAttribute("data-like", false);
        }
    });
}

function deleteFeed(feedId) {
    let url = "/laptrinhjava/api/remove-feed";

    fetch(url, {
        method: "delete",
        body: JSON.stringify({
            feedId: feedId
        }),
        headers: {
            "Content-Type": "application/json"
        }})
            .then((response) => {
                if (response.status !== 200)
                    return console.error(response.message);

                document.getElementById(`feedId${feedId}`).remove();
            });
}


function showEditFeed(feedId) {
    let modelEditFeed = document.getElementById("editFeedModal");
    modelEditFeed.setAttribute("data-feed-id", feedId);
    modelEditFeed.querySelector("form textarea").textContent = document.getElementById(`feed-content-${feedId}`).textContent.trim();

    document.querySelector("#form-edit-feed button[type='submit']").textContent = "Lưu";
    document.querySelector("#form-edit-feed input[type='file']").value = "";
    document.querySelector("#form-edit-feed button[type='submit']").removeAttribute("disabled");
}
function showReport(uid) {
    let modelReport = document.getElementById("form-report");
    modelReport.setAttribute("data-user-report-id", uid);
    document.querySelector("#reportModal #content").value = "";
}
let feedEdit = document.querySelector("#form-edit-feed button[type='submit']");
if (feedEdit)
    feedEdit.addEventListener("click", function (event) {
        event.preventDefault();
        let id = document.querySelector("#editFeedModal").getAttribute("data-feed-id");
        let content = document.querySelector("#editFeedModal textarea").value;
        let files = document.querySelector("#editFeedModal input[name='files']").files;

        let url = "/laptrinhjava/api/update-feed";

        let body = new FormData()
        body.append('feedId', parseInt(id));
        body.append('content', content);
        if (files.length != 0) {
            body.append("files", files)
        }
        console.log(JSON.stringify(Object.fromEntries(body)));
        fetch(url, {
            method: "post",
            body: JSON.stringify(Object.fromEntries(body)),
//            body,
            headers: {
                "Content-Type": "application/json"
//            "Content-Type": "multipart/form-data"
            }}
        ).then((response) => {
            if (response.status !== 200) {
                return;
            }

            return response.json();
        }).then(feed => {
            if (!feed)
                return;
            document.getElementById(`feed-content-${feed.id}`).textContent = feed.content;
            if (feed.images && feed.iamge.length) {
                let innerImage = '';
                images.forEach((image, index) => {
                    innerImage += `<div class="carousel-item ${index == 0 ? "active" : ""}" style="height: 345px; overflow: hidden;" >
                                    <img height="345px" src="${image.image}" class="d-block rounded rounded-3 object-fit-cover w-100 h-100" alt="image">
                                </div`
                });
                document.getElementById(`feed-images-${feed.id}`).innerHTML = innerImage;
            }
            document.querySelector("#form-edit-feed button[type='submit']").textContent = "Đã lưu";
            document.querySelector("#form-edit-feed button[type='submit']").setAttribute("disabled", true);
        });
    });

//window.onload = function () {
//    let formUpdateFeed = document.querySelector("#form-edit-feed button[type='submit']");
//    if (formUpdateFeed)
//        formUpdateFeed.addEventListener("click", function (event) {
//            event.preventDefault();
//            let id = document.querySelector("#editFeedModal").getAttribute("data-feed-id");
//            let content = document.querySelector("#editFeedModal textarea").value;
//            let files = document.querySelector("#editFeedModal input[name='files']").files;
//            let url = "/laptrinhjava/api/update-feed";
//            let body = new FormData()
//            body.append('id', id);
//            body.append('content', content);
//            if (files && files.length) {
//                body.append('files', files);
//            }
//
//            fetch(url, {
//                method: "post",
//                body,
//                headers: {
//                    "Content-Type": "application/json"
//                }})
//                    .then((response) => {
//                        if (response.status !== 200) {
//                            console.error(response.message);
//                            return;
//                        }
//
//                        return response.json();
//                    }).then(feed => {
//                if (!feed)
//                    return;
//                document.getElementById(`feed-content-${feed.id}`).textContent = feed.content;
//                if (feed.images && feed.images.length) {
//                    let innerImage = '';
//                    images.forEach((image, index) => {
//                        innerImage += `<div class="carousel-item ${index == 0 ? "active" : ""}" style="height: 345px; overflow: hidden;" >
//                                                    <img height="345px" src="${image.image}" class="d-block rounded rounded-3 object-fit-cover w-100 h-100" alt="image">
//                                                </div`
//                    });
//                    document.getElementById(`feed-images-${feed.id}`).innerHTML = innerImage;
//                }
//                document.querySelector("#form-edit-feed button[type='submit']").textContent = "Đã lưu";
//                document.querySelector("#form-edit-feed button[type='submit']").setAttribute("disabled", true);
//            });
//        })


function setWinner(target) {
    let auctionId = target.getAttribute("data-auctionId");
    let commentId = target.getAttribute("data-commentId");

    let url = `/laptrinhjava/api/set-winner/${commentId}/${auctionId}`;

    fetch(url, {
        method: 'post',
        headers: {
            "Content-Type": "application/json"
        }
    }).then((response) => {
        if (response.status !== 200) {
//            alert("Có lỗi vui lòng thử lại");
            return;
        }
        let comments = document.getElementsByClassName("item-auction-comment");
        for (let element of comments) {
            if (element.querySelector(".btnSetWinner").getAttribute("data-commentId") != commentId)
                element.querySelector(".btnSetWinner").remove();
            else {
                element.querySelector(".btnSetWinner").textContent = "Đang thanh toán";
                element.querySelector(".btnSetWinner").classList.replace("btn-success", "btn-link");
            }
        }

    })
}

function sendFeedComment(feedId, target) {
    let inputEle = document.getElementById(`input-feed-content-${feedId}`);
    let feed = document.getElementById(`feedId${feedId}`);
    ``

    if (!inputEle.value) {
        feed.querySelector(".comment-content > .textInvalidForm").textContent = "Vui lòng nhập nội dung."
        return;
    }

    let url = `/laptrinhjava/api/add-comment/${feedId}`;
    fetch(url, {
        method: 'post',
        body: JSON.stringify({
            content: inputEle.value
        }),
        headers: {
            "Content-Type": "application/json"
        }
    }).then((response) => {
        if (response.status !== 200) {
            feed.querySelector(".comment-content > .textInvalidForm").textContent = "Vui lòng thử lại."
            return;
        }
        feed.querySelector(".comment-content > .textInvalidForm").textContent = ""
        return response.json();
    }).then(comment => {
        if (!comment)
            return;
        inputEle.value = "";
        let avatar = target.getAttribute("data-avatar");
        let name = target.getAttribute("data-username");
        let uid = target.getAttribute("data-userId");
        let listFeed = document.getElementById(`list-comment-${feedId}`);
        listFeed.innerHTML = `
        <div class="d-flex mb-2 item-comment px-3 justify-content-between" id="item-comment-${comment.id}">
                <div class="d-flex">
                    <div class="d-flex me-2">
                        <img src="${comment.user.avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                        <a class="mb-0 ms-1" href="/laptrinhjava/user/${comment.user.id}" >
                            ${comment.user.firstName} ${comment.user.lastName}
                        </a>
                    </div>
                    <p>${comment.content}</p>
                </div>
                <div>
                    <span>${timeSince(new Date(comment.createAt))}</span>
                    ${comment.user.id == uid ? `<button class='btn btn-danger' onclick="removeComment(${comment.id})" >Xóa</button>` : ""}
                </div>
            </div>
        ` + listFeed.innerHTML;
    })
}

function showCommentFeed(feedId, target) {
    let feed = document.getElementById(`feedId${feedId}`);
    feed.querySelector(".comment-content").classList.toggle("d-none");

    if (target.getAttribute("isRenderComment"))
        return;

    let uid = target.getAttribute("data-userId");
    let url = `/laptrinhjava/api/comment/${feedId}`;
    fetch(url).then(res => res.json()).then(comments => {
        console.log(comments)
        for (let comment of comments) {
            document.getElementById(`list-comment-${feedId}`).innerHTML += `
            <div class="d-flex mb-2 item-comment px-3 justify-content-between" id="item-comment-${comment.id}">
                <div class="d-flex">
                    <div class="d-flex me-2">
                        <img src="${comment.user.avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                        <a class="mb-0 ms-1" href="/laptrinhjava/user/${comment.user.id}" >
                            ${comment.user.firstName} ${comment.user.lastName}
                        </a>
                    </div>
                    <p>${comment.content}</p>
                </div>
                <div>
                    <span>${timeSince(new Date(comment.createAt))}</span>
                    ${comment.user.id == uid ? `<button class='btn btn-danger' onclick="removeComment(${comment.id})" >Xóa</button>` : ""}
                </div>
            </div>
            `
        }
        target.setAttribute("isRenderComment", "true")
    })
}
function removeComment(commentId) {
    let url = `/laptrinhjava/api/remove-comment/${commentId}`;
    fetch(url, {
        method: 'delete'
    }).then(res => {
        if (res.status !== 200)
            return;
        document.getElementById(`item-comment-${commentId}`).remove();
    })
}
const getUrl = (page) => "/laptrinhjava/api/getMoreFeed/?page=" + page;


function loadMoreFeed(target, uid = null, avatar = null, fullName = null) {
    let minHeight = 400 + window.screen.height;
    let loading = false;
    let page = 2;

    let user = {
        uid: target.getAttribute("data-uid") || null,
        avatar: target.getAttribute("data-avatar") || null,
        fullName: target.getAttribute("data-fullName") || null,
    }

    var sub = document.addEventListener("scroll", function () {
        var offsetTop = target.getBoundingClientRect().top;
        if (offsetTop < minHeight && loading === false) {
            loading = true;
            fetch("/laptrinhjava/api/getMoreFeed/?page=" + page).then(res => {
                if (res.status !== 200)
                    return;
                else
                    return res.json();
            }).then(feeds => {
                if (!feeds) {
                    target.textContent = "Hết";
                    document.removeEventListener("scroll", null);
                    return;
                }

                for (let feed of feeds) {
                    console.log(feed)
                    document.getElementById("feed-content").innerHTML += render(feed, user.uid, user.avatar, user.fullName);
                }
                page += 1;
                loading = false;
            }).catch(error => {
                console.error(error);
                target.textContent = "Hết";
                document.removeEventListener("scroll", null);
            })
        }
    });
}
const loadImage = images => {
    let rs = '';
    images.forEach((image, index) => {
        rs += `
            <div class="carousel-item ${index == 0 ? 'active' : ''}" style="height: 345px; overflow: hidden;" >
                <img height="345px" src="${image.image}" class="d-block rounded rounded-3 object-fit-cover w-100 h-100" alt="first image">
            </div>`
    });
    return rs;
}

const render = (feed, uid, avatar, fullName) => (`
                <div class="d-flex flex-column pt-3" id="feedId${feed.id}">
                                <div class="mx-auto item-feed-content">
                                    <div class="card shadow-sm">
                                        <div class="card-header bg-white p-0 mx-3 mt-3 border-0">
                                            <div class="d-flex justify-content-between">
                                                <div class="right d-flex">
                                                    <div class="me-2">
                                                        <img height="48px" width="48px" class="object-fit-cover rounded-circle" src="${feed.user.avatar}" alt="user-1">
                                                    </div>
                                                    <div class="info">
                                                        <a href="/user/${feed.user.id}" class="m-0 fs-5">${feed.user.firstName} ${feed.user.lastName}</a>
                                                        <p class="m-0 text-muted time-feed"> ${feed.createAt}</p>
                                                    </div>
                                                </div>
                                                    ${uid != null ? `
                                                    <div class="left">
                                                        <button type="button" 
                                                                class="btn btn-link dropdown-toggle bg-white" 
                                                                id="optionFeed"
                                                                data-bs-toggle="dropdown" 
                                                                aria-expanded="false" 
                                                                data-bs-offset="10,20"
                                                                >
                                                            <i class="fas fa-ellipsis-v"></i>
                                                        </button>
                                                        <ul class="dropdown-menu dropdown-menu-end shadow-lg" aria-labelledby="optionFeed">
                                                            ${uid != null && feed.user.id == uid ? `
                                                                <li>
                                                                    <button class="btn dropdown-item" onclick="showEditFeed(${feed.id})" 
                                                                            role="button" data-bs-toggle="modal" data-bs-target="#editFeedModal">
                                                                        <i class="far fa-edit" style="width: 22px;"></i> 
                                                                        Sửa
                                                                    </button>
                                                                </li>
                                                                <li>
                                                                    <button class="btn dropdown-item" onclick="deleteFeed(${feed.id})">
                                                                        <i class="far fa-trash-alt" style="width: 22px;"></i> Xóa
                                                                    </button>
                                                                </li>
                                                            ` : `
                                                                <li>
                                                                    <button class="btn dropdown-item" role="button" data-bs-toggle="modal" data-bs-target="#reportModal" onclick="showReport(${feed.user.id})">
                                                                        <i class="fas fa-exclamation" style="width: 22px;"></i> Báo cáo
                                                                    </button>
                                                                </li>
                                                            `}
                                                        </ul>
                                                    </div>` : ""}
                                            </div>
                                        </div>
                                        <div class="card-body pt-2" style="max-width: 733px;">
                                            <div class="content-feed my-2">
                                                <p class="card-description mb-2" id="feed-content-${feed.id}">
                                                    ${feed.content}
                                                </p>
                                            </div>
                                            ${feed.images != null && feed.images.length != 0 ?
            `
                                                <div href="javascript:;" class="d-block">
                                                    <div id="carouselExampleControls${feed.id}" class="carousel slide" data-bs-ride="carousel">
                                                        <div class="carousel-inner" id="feed-images-${feed.id}">
                                                            ${loadImage(feed.images)}
                                                        </div>
                                                        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls${feed.id}" data-bs-slide="prev">
                                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Previous</span>
                                                        </button>
                                                        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls${feed.id}" data-bs-slide="next">
                                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                                            <span class="visually-hidden">Next</span>
                                                        </button>
                                                    </div>
                                                </div>
                                            ` : ''}
                                            <div class="control d-flex justify-content-between align-items-center mt-2">
                                                ${feed.isUserLike == true ?
            `
                                                    <button class="btn btn-link" onclick="likeFeed(${feed.id}, this)" data-like="true">
                                                        <i class="fas fa-thumbs-up me-2" style="color: gray; font-size: 20px;"></i>
                                                        ${feed.countLike} Đã thích
                                                    </button>
                                                `
            : (uid == null ? `
                                                    <button class="btn btn-link">
                                                        <i class="fas fa-thumbs-up me-2" style="color: gray; font-size: 20px;"></i>
                                                        ${feed.countLike} Thích
                                                    </button>
                                                ` :
                    `
                                                    <button class="btn btn-link" onclick="likeFeed(${feed.id}, this)" data-like="false">
                                                        <i style="color: gray; font-size: 20px;" class="far fa-thumbs-up me-2"></i>
                                                        ${feed.countLike} Thích
                                                    </button>
                                                `)}
                                                <div class="y-divide"></div>
                                                <button class="btn btn-link" onclick="showCommentFeed(${feed.id}, this)" data-userId="${uid}"> 
                                                    <i style="color: gray; font-size: 20px;" class="far fa-comment-alt me-2"></i>
                                                    ${feed.countComment} Bình luận
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="comment-content d-none">
                                        ${uid != null ? `
                                        <div class="d-flex my-2 px-3">
                                                <div class="d-flex me-2">
                                                    <img src="${avatar}" class="rounded-circle object-fit-cover" alt="user" width="40px" height="40px"/>
                                                    <a class="mb-0 ms-1" href="/user/${uid}" style="white-space: nowrap;" >
                                                        ${fullName}
                                                    </a>
                                                </div>
                                                <div class="input-group">
                                                    <input type="text" class="form-control" placeholder="Nhập nội dung..." id="input-feed-content-${feed.id}">
                                                    <button class="btn btn-outline-secondary" type="button" id="button-addon1" onclick="sendFeedComment(${feed.id}, this)" 
                                                            data-username="${fullName}"
                                                            data-userId="${uid}"
                                                            data-avatar="${avatar}">
                                                        <i class="fas fa-paper-plane"></i>
                                                    </button>
                                                </div>
                                            </div>
                                        ` : ''}
                                        <div class="textInvalidForm">

                                        </div>
                                        <div id="list-comment-${feed.id}">
                                            
                                        </div>
                                    </div>
                                </div>
                            </div>`);