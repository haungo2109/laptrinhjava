const intervals = [
    {label: 'năm', seconds: 31536000},
    {label: 'tháng', seconds: 2592000},
    {label: 'ngày', seconds: 86400},
    {label: 'giờ', seconds: 3600},
    {label: 'phút', seconds: 60},
    {label: 'giây', seconds: 1}
];

function timeSince(date) {
    const seconds = Math.floor((Date.now() - date.getTime()) / 1000);
    const interval = intervals.find(i => i.seconds < seconds);
    if (!interval) return "Vừa mới";
    const count = Math.floor(seconds / interval.seconds);
    return `${count} ${interval.label}${count !== 1 ? 's' : ''} trước`;
}

function futureSince(date) {
    const seconds = Math.floor((date.getTime() - Date.now()) / 1000);
    if (seconds < 0) {
        return "Hết thời gian"
    }
    const interval = intervals.find(i => i.seconds < seconds);
    const count = Math.floor(seconds / interval.seconds);
    return `${count} ${interval.label} hết`;
}
const categoryUrl = "http://localhost:8088/laptrinhjava/category/?"
function getQueryParams(){
    const urlSearchParams = new URLSearchParams(window.location.search);
    const params = Object.fromEntries(urlSearchParams.entries());
    return params;
}
function searchKw(){
    let params = getQueryParams()
    params['kw']=document.getElementById("filter-kw").value;
    window.location.href = categoryUrl + new URLSearchParams(params).toString()
}
function sortAuction(){
    let params = getQueryParams()
    params['sort']=document.getElementById("sort-auction").value;
    window.location.href = categoryUrl + new URLSearchParams(params).toString()
}