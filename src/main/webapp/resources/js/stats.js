/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
const monthEng = ['Tháng 1', 'Tháng 2', 'Tháng 3', 'Tháng 4', 'Tháng 5', 'Tháng 6', 'Tháng 7', 'Tháng 8', 'Tháng 9', 'Tháng 10', 'Tháng 11', 'Tháng 12'];
function generateColor() {
    let r = parseInt(Math.random() * 255);
    let g = parseInt(Math.random() * 255);
    let b = parseInt(Math.random() * 255);
    return `rgb(${r}, ${g}, ${b})`
}

function cateChart(id, cateLabels = [], cateInfo = []) {
    let colors = []
    for (let i = 0; i < cateInfo.length; i++)
        colors.push(generateColor())

    const data = {
        labels: cateLabels,
        datasets: [{
                label: 'Thong ke san pham theo danh muc',
                data: cateInfo,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };

    const config = {
        type: 'doughnut',
        data: data,
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}

function lineChart(id, cateLabels = [], cateInfo = []) {
    let colors = []
    for (let i = 0; i < cateInfo.length; i++)
        colors.push(generateColor())

    const data = {
        labels: cateLabels.map(c=>monthEng[parseInt(c) - 1]) ,
        datasets: [{
                label: 'Số bài viết theo tháng',
                data: cateInfo,
                fill: false,
                borderColor: generateColor(),
                tension: 0.1
            }]
    };

    const config = {
        type: 'line',
        data: data,
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}

function twoLineChart(id, labels = [], basePrice = [], currentPrice = [], total = []) {
    let colors = []
    for (let i = 0; i < labels.length; i++)
        colors.push(generateColor())

    const data = {
        labels: labels.map(month => monthEng[parseInt(month) - 1]),
        datasets: [
            {
                label: 'Giá cơ bản',
                data: basePrice,
                borderColor: generateColor(),
                yAxisID: 'y',
            },
            {
                label: 'Giá hiện có',
                data: currentPrice,
                borderColor: generateColor(),
                yAxisID: 'y1',
            }
        ]
    };

    const config = {
        type: 'line',
        data: data,
        options: {
            responsive: true,
            interaction: {
                mode: 'index',
                intersect: false,
            },
            stacked: false,
            scales: {
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                },
                y1: {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    grid: {
                        drawOnChartArea: false, // only want the grid lines for one axis to show up
                    },
                },
            }
        },
    };

    let ctx = document.getElementById(id).getContext("2d")

    new Chart(ctx, config)
}