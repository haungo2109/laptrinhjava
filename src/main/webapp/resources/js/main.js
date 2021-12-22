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
    document.querySelector("#reportModal #content").value="";
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
