import { Dropdown } from "bootstrap";

import { Chart } from "chart.js/auto";

const canvas = document.getElementById('chartCompras')
const ctx = canvas.getContext('2d');
const btnactualizar = document.getElementById('actualizar')

const data = {
    labels: [],
    datasets: [{
        label: 'compras',
        data: [],
        borderWidth: 5,
        backgroundColor: [] 
    }]
}





const chartProducto = new Chart(ctx, {
    type: 'pie',
    data: data,

})

const getCompras = async () => {
    const url= '/graficacli/API/detalle/index';
    const config= { method: "GET" };
    const response = await fetch(url, config);
    const data = await response.json();

    if (data) { 
        if (chartProducto.data.datasets[0]) {
            chartProducto.data.labels = [];
            chartProducto.data.datasets[0].data = [];
            chartProducto.data.datasets[0].backgroundColor = [];

            data.forEach(r => {
                chartProducto.data.labels.push(r.cliente_nombre);
                chartProducto.data.datasets[0].data.push(r.cantidad_compras);
                chartProducto.data.datasets[0].backgroundColor.push(generateRandomColor());
            });
        }
    }
    chartProducto.update();
}



const generateRandomColor = () => {
    const r = Math.floor(Math.random() * 256);
    const g = Math.floor(Math.random() * 256);
    const b = Math.floor(Math.random() * 256);

    const rebColor = `rgb(${r}, ${g}, ${b})`;
    return rebColor;
}


btnactualizar.addEventListener('click', getCompras);