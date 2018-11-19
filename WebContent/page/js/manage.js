
$(document).ready( function () {
	
	
	
	
	
	
    var table =  $('#table_id').DataTable({
		"ajax": "../js/HSDK.json",
        "columns": [
			{
                "className":      'col-stt',
                "orderable":      false,
				"data":           null,
            },
			{
				"data": "noidung",
                "className":      'col-noidung',
				"orderable":      false,
            },
			{
				"data": "ma",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "ngay-dangky",
				"className":      'col-ngay',
				"orderable":      false,
			},
            {
				"data": "ngay-hethan",
				"className":      'col-ngay',
				"orderable":      false,
			},
			{
				"orderable":      false,
				"data":		null,
				"defaultContent": '<div><a href="" class="btn btn-primary search"><i class="glyphicon glyphicon-pencil"></i> Kiểm duyệt</a></div>',
				"classname":	'col-tacvu',
				
			},
        ],
        scrollCollapse: true,
		lengthMenu : [[2, 25, 50, -1], [2, 25, 50, "All"]],
		order : false,
		searching: false,
	});
	
	table.on('order.dt search.dt', function(){
		table.column(0,{search:'applied',order:'applied'}).nodes().each(function(cell,i){
			cell.innerHTML = i + 1;
		});
	});
	
} );


