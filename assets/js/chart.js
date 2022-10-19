import Chart from "../node_modules/chart.js/dist/chart.js";
import "../node_modules/chart.js-plugin-labels-dv/dist/chartjs-plugin-labels.min.js";

const colors = ["#36a2eb"];

class HorizontalBarChart {
  constructor(ctx, labels, values) {
    this.chart = new Chart(ctx, {
      type: "bar",
      data: {
        labels: labels,
        datasets: [
          {
            axis: "x",
            label: "Nombre des eleves",
            data: values,
            fill: false,
            borderColor: colors,
            backgroundColor: colors,
            borderWidth: 1,
            color: "#fff",
          },
        ],
      },
      options: {
        indexAxis: "x",
        responsive: true,
        plugins: {
          labels: {
            render: "value",
            fontColor: "#5c5c5c",
            position: "outside",
          },
          legend: {
            position: "bottom",
          },
          title: {
            display: true,
            text: "Nombre eleves par classe",
          },
          datalabels: {
            color: "#fff",
          },
        },
      },
    });
  }
}
export {
    HorizontalBarChart 
  };