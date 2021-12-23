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

let formUpdateFeed = document.querySelector("#form-edit-feed button[type='submit']");
if (formUpdateFeed)
    formUpdateFeed.addEventListener("click", function (event) {
        event.preventDefault();
        let id = document.querySelector("#editFeedModal").getAttribute("data-feed-id");
        let content = document.querySelector("#editFeedModal textarea").value;
        let files = document.querySelector("#editFeedModal input[name='files']").files;

        let url = "/laptrinhjava/api/update-feed";

        let body = new FormData()
        body.append('id', id);
        body.append('content', content);
        if (files && files.length) {
            body.append('files', files);
        }

        fetch(url, {
            method: "post",
            body,
            headers: {
                "Content-Type": "application/json"
            }})
                .then((response) => {
                    if (response.status !== 200) {
                        console.error(response.message);
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