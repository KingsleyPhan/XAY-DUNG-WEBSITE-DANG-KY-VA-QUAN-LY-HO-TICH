window.onload = function () {
	


}
function changeSelect(){
	var loai = $("#loai-thongke").val();
	switch(loai) {
	case "1":
		$("#condition").html('<div class="title-condition">Nhập tháng :   </div>'
            	+'<input type="text" class="form-control condition-input" placeholder="Nhập điều kiện. . ." autofocus/>');
		$(".condition-input").on("keyup", function(event) {
			// Cancel the default action, if needed
			  event.preventDefault();
			  // Number 13 is the "Enter" key on the keyboard
			  if (event.keyCode === 13) {
			    // Trigger the button element with a click
			    $("#thongke-submit").click();
			  }
		})
		break;
	case "2":
		$("#condition").html('<div class="title-condition">Nhập năm :   </div>'
            	+'<input type="text" class="form-control condition-input" placeholder="Nhập điều kiện. . ." autofocus/>');
		$(".condition-input").on("keyup", function(event) {
			// Cancel the default action, if needed
			  event.preventDefault();
			  // Number 13 is the "Enter" key on the keyboard
			  if (event.keyCode === 13) {
			    // Trigger the button element with a click
			    $("#thongke-submit").click();
			  }
		})
		break;
	default:
		$.alert({
		    title: 'Cảnh báo!',
		    content: 'Bạn chưa chọn loại thống kê!',
		});
		break;
}
}

function showChart(){
	var loai = $("#loai-thongke").val();
	switch(loai) {
		case "1":
			var thang = $("#condition input").val();
			if(thang === ""){
				$("#condition input").focus();
				$.alert({
				    title: 'Cảnh báo!',
				    content: 'Bạn chưa nhập điều kiện!',
				});
				
				return;
			}
			getThongKe1(thang);
			break;
		case "2":
			var nam = $("#condition input").val();
			if(nam === ""){
				$("#condition input").focus();
				$.alert({
				    title: 'Cảnh báo!',
				    content: 'Bạn chưa nhập điều kiện!',
				});
				
				return;
			}
			getThongKe2(nam);
			break;
		default:
			$.alert({
			    title: 'Cảnh báo!',
			    content: 'Bạn chưa chọn loại thống kê!',
			});
			break;
	}
}
function getThongKe1(thang){
	$.ajax({
		method : "POST",
		data : {
			thang : thang
		},
		url : "ThongKe/Loai1",
		success : function(data) {
			console.log(data);
			if(data == "[]"){
				$.alert({
				    title: 'Cảnh báo!',
				    content: 'Không có dữ liệu thống kê!',
				});
				var chart = new CanvasJS.Chart("chartContainer",{});
				chart.render();
				$("h4.title").html('');
				$("p.category").html('');
				return;
			}
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
			$("h4.title").html('Biểu đồ tròn thống kê hồ sơ đăng ký theo loại giấy tờ');
			$("p.category").html('Tháng '+thang);
		}
	})
}


function getThongKe2(nam){
	$.ajax({
		method : "POST",
		data : {
			nam : nam
		},
		url : "ThongKe/Loai2",
		success : function(data) {
			console.log(JSON.parse(data));
			if(data == "[]"){
				$.alert({
				    title: 'Cảnh báo!',
				    content: 'Không có dữ liệu thống kê!',
				});
				var chart = new CanvasJS.Chart("chartContainer",{});
				chart.render();
				$("h4.title").html('');
				$("p.category").html('');
				return;
			}
			var chart = new CanvasJS.Chart("chartContainer", {
				exportEnabled: true,
				animationEnabled: true,
				/*title: {
					text: "Quarterly Sales Comparison"
				},
				subtitles: [{
					text: "Click Legend to Hide or Unhide Data Series"
				}],*/
				axisX: {
					title: "Tháng",
					includeZero: false
					/*prefix: "Tháng "*/
					
				},
				axisY: {
					title: "Số lượng",
/*					prefix: "$",*/
					includeZero: false
				},
				toolTip: {
					shared: true
				},
				legend: {
					cursor: "pointer",
					verticalAlign: "top",
					itemclick: toggleDataSeries
				},
				data: JSON.parse(data)
			});
			chart.render();
			$("h4.title").html('Biểu đồ cột thống kê hồ sơ đăng ký theo loại giấy tờ');
			$("p.category").html('Năm '+nam);
		}
	})
}

function toggleDataSeries(e) {
	if (typeof (e.dataSeries.visible) === "undefined" || e.dataSeries.visible) {
		e.dataSeries.visible = false;
	} else {
		e.dataSeries.visible = true;
	}
	e.chart.render();
}

function explodePie(e) {
	for(var i = 0; i < e.dataSeries.dataPoints.length; i++) {
		if(i !== e.dataPointIndex)
			e.dataSeries.dataPoints[i].exploded = false;
	}
}