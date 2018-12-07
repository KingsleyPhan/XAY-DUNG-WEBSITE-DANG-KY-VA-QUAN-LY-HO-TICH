window.onload = function () {
	$.ajax({
		method : "POST",
		data : {
			thang : 12
		},
		url : "ThongKe",
		success : function(data) {
			console.log(data);
			var chart = new CanvasJS.Chart("chartContainer", {
				exportEnabled: true,
				animationEnabled: true,
				legend:{
					cursor: "pointer",
					itemclick: explodePie
				},
				data: [{
					type: "pie",
					showInLegend: true,
					toolTipContent: "{name}: <strong>{y}%</strong>",
					indexLabel: "{name} - {y}%",
					click: explodePie,
					dataPoints: JSON.parse(data)
				}]
			});
			chart.render();
		}
	})


}

function explodePie(e) {
	for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
		if(i !== e.dataPointIndex)
			e.dataSeries.dataPoints[i].exploded = false;
	}
}