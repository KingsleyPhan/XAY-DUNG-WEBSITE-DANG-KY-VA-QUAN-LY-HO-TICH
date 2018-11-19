$(document).ready(function() {
	filterSelection(-1);
});
var table = $('#table_id').DataTable({
	"processing" : true,
	"ajax" : {
		"url" : "HoSoDangKy",
		"dataSrc" : "hsdk",
		"data":{
		},
		"type" : "POST"
	},
	"columns" : [ 
	{
		"className" : 'col-stt',
		"orderable" : false,
	}, 
	{
		"className" : 'col-noidung',
		"orderable" : false,
	}, 
	{
		"className" : 'col-ma',
		"orderable" : false,
	}, 
	{
		"className" : 'col-ngay',
		"orderable" : false,
	}, 
	{
		"className" : 'col-ngay',
		"orderable" : false,
	}, 
	{
		"className" : 'col-ma',
		"orderable" : false,
		"visible" : false,
	},
	{
		"className" : 'col-tacvu',
		"orderable" : false,
	} ],
	scrollCollapse : true,
	lengthMenu : [ [ 10, 25, 50, -1 ], [ 10, 25, 50, "All" ] ],
	order : false,
	
});

function filterSelection(c) {
	if(c === -1){
		table
			.columns(5)
			.search("")
			.draw();
	}
	else{
		table
		.columns(5)
	    .search(c)
	    .draw();
	}
}


table.on('order.dt search.dt', function() {
	table.column(0, {
		search : 'applied',
		order : 'applied'
	}).nodes().each(function(cell, i) {
		cell.innerHTML = i + 1;
	});
}).draw();

// Add active class to the current div (highlight it)
var btnContainer = document.getElementById("myFilterContainer");
var btns = btnContainer.getElementsByClassName("filter");
for (var i = 0; i < btns.length; i++) {
	btns[i].addEventListener("click", function() {
		var current = document.getElementsByClassName("active");
		current[0].className = current[0].className.replace(" active", "");
		this.className += " active";
	});
}

function w3AddClass(element, name) {
	var i, arr1, arr2;
	arr1 = element.className.split(" ");
	arr2 = name.split(" ");
	for (i = 0; i < arr2.length; i++) {
		if (arr1.indexOf(arr2[i]) == -1) {
			element.className += " " + arr2[i];
		}
	}
}

function w3RemoveClass(element, name) {
	var i, arr1, arr2;
	arr1 = element.className.split(" ");
	arr2 = name.split(" ");
	for (i = 0; i < arr2.length; i++) {
		while (arr1.indexOf(arr2[i]) > -1) {
			arr1.splice(arr1.indexOf(arr2[i]), 1);
		}
	}
	element.className = arr1.join(" ");
}