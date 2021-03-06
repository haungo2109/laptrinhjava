/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */


let stompClient = null;
let notificationCount = 0;

function connect() {
    let socket = new SockJS("/laptrinhjava/notification");
    stompClient = Stomp.over(socket);
    stompClient.heartbeat.outgoing = 20000; // client will send heartbeats every 20000ms
    stompClient.connect({}, function (frame) {
        console.log('Connected: ' + frame);

        stompClient.subscribe("/user/topic/pushNotification", function (res) {
            const notification = JSON.parse(res.body);
            console.info({notification});
            const mess = {
                title: notification.title,
                options: {
                    body: notification.content,
                }
            }
            showNotification(mess);
            showMessage(notification);
        });
        stompClient.subscribe('/user/topic/chatMessages', function (res) {
            const message = JSON.parse(res.body);
            console.info({message});
        });
    });

    // Reconnect socket
    socket.onclose = function (e) {
        setTimeout(function () {
            connect();
        }, 1000);
    }
}

function disconnect() {
    if (stompClient != null) {
        stompClient.disconnect();
    }
}
function sendMessage(uid) {
    stompClient.send("/laptrinhjava/app/message", {}, JSON.stringify({'content': "sended ahihi", 'toUserId': uid}));
    stompClient.send("/app/message", {}, {'content': "sended ahihi", 'toUserId': uid});
    stompClient.send("/app/send-message", {}, JSON.stringify({'content': "sended ahihi", 'toUserId': uid}));
}
function showNotification(mess) {
    console.log("Message: ", mess)
    if (!("Notification" in window)) {
        alert("Trình duyệt không hỗ trợ thông báo.");
    } else if (Notification.permission === "granted") {
        new Notification(mess.title, mess.options);
    } else {
        console.log("Bạn chưa bật thông báo.");
    }
}

function showMessage(message) {
    let contentEle = document.getElementById("notification-content");
    contentEle.innerHTML =
            `<li class="list-group-item-none shadow-sm border border-1 p-2">
        <div class="d-flex justify-content-between">
            <a class="fs-6 mb-0" style="white-space: nowrap;overflow: hidden;" href="${message.url == null ? 'javascript::' : message.url}">
                ${message.title}
            </a>
            <span class="time-feed ms-1" style="font-size: 12px;">${timeSince(new Date(message.createAt))}</span>
        </div>

        <p class="mb-0 text-muted" style="white-space: nowrap;text-overflow: ellipsis;overflow: hidden;">
            ${message.content}
        </p>
    </li>` + contentEle.innerHTML;

}

function sendPrivateMessage() {
    console.log("sending private message");
    stompClient.send("/ws/private-message", {}, JSON.stringify({'messageContent': $("#private-message").val()}));
}

function updateNotificationDisplay() {
    if (notificationCount == 0) {
        $('#notifications').hide();
    } else {
        $('#notifications').show();
        $('#notifications').text(notificationCount);
    }
}

function resetNotificationCount() {
    notificationCount = 0;
    updateNotificationDisplay();
}