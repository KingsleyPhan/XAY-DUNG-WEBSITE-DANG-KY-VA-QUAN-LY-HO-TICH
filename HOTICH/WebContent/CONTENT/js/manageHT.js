/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table class="adding" border="0" style="">'+
        '<tr>'+
			'<td class="col-title">Nội dung  </td>'+
            '<td class="col-lable">Tên hộ tịch :</td>'+
            '<td class="col-content">'+d.tenhotich+'</td>'+
        '</tr>'+
        '<tr>'+
			'<td class="col-title"></td>'+
            '<td class="col-lable">Người yêu cầu :</td>'+
            '<td class="col-content">'+d.tennguoiyc+'</td>'+
        '</tr>'+
        '<tr>'+
			'<td class="col-title"></td>'+
            '<td class="col-lable">Thêm thông tin:</td>'+
            '<td class="col-content">Thêm thông tin cần thiết của 1 hộ tịch</td>'+
        '</tr>'+
    '</table>';
}
 
$(document).ready(function() {
	// Setup - add a text input to each footer cell
    $('#table_id tfoot th.search').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" class="form-control" placeholder="Tìm kiếm '+title+'..." />' );
    } );
	
    var table = $('#table_id').DataTable( {
    	"ajax" : {
			"data" : {key : -1},
			"url" : "QuanLyHoTich/getAll",
			"dataSrc" : "hotich",
			"type" : "POST",
		},
        "columns": [
			{
                "className":      'col-stt',
                "orderable":      false,
				"data":           null,
            },
			{
				"data": "id",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "giayToID",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "hoSoDangKyID",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "coQuanID",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "loaiGiayToID",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "ma",
				"className":      'col-ma',
				"orderable":      false,
			},
            {
				"data": "soQuyen",
				"className":      'col-ma',
				"orderable":      false,
			},
            {
				"data": "ngayKy",
				"className":      'col-ngay',
				"orderable":      false,
			},
            {
				"data": "nguoiXuLy",
				"className":      'col-canbo',
				"orderable":      false,
			},
			{
				"data": "nguoiKy",
				"className":      'col-canbo',
				"orderable":      false,
			},
			{
				"orderable":      false,
				"data":		null,
				"defaultContent": '<div style="text-align: center;"><a href="HoTichKhaiSinh.html" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i> Xem</a></div>',
				"classname":	'col-tacvu',
				
			},
        ],
		"lengthMenu" : [[10, 25, 50, -1], [10, 25, 50, "All"]],
		"order" : false,
    } );
	
	new $.fn.dataTable.Buttons( table, {
        buttons: [
            { extend: 'copyHtml5'},
            { extend: 'excelHtml5' },
            { extend: 'csvHtml5'},
            { extend: 'pdfHtml5'}
        ],
    } );
 
    table.buttons( 0, null ).container().prependTo(
        table.table().container()
    );
	
    table.on('order.dt search.dt', function(){
		table.column(0,{search:'applied',order:'applied'}).nodes().each(function(cell,i){
			cell.innerHTML = i + 1;
		});
	});
    
    // Apply the search
    table.columns([6,7,8,9,10]).every( function () {
        var that = this;
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
    
    // Add event listener for opening and closing details
    $('#table_id tbody').on('click', 'td', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
		var deafaultTr = document.getElementsByClassName('shown');
		for (i = 0; i < deafaultTr.length; i++) {
			var deafaultRow = table.row(deafaultTr[i]);
			if(!row.child.isShown())
				{
					deafaultRow.child.hide();
					RemoveClass(deafaultTr[i],'shown');
				}
	  	}
        if ( row.child.isShown() ) {
            // This row is already open - close it
            row.child.hide();
            tr.removeClass('shown');
        }
        else {
            // Open this row
            row.child( format(row.data()) ).show();
            tr.addClass('shown');
        }
    } );
	
    function filterSelection(c) {
    	var table = $('#table_id').DataTable();
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
	
    function AddClass(element, name) {
    	var i, arr1, arr2;
    	arr1 = element.className.split(" ");
    	arr2 = name.split(" ");
    	for (i = 0; i < arr2.length; i++) {
    		if (arr1.indexOf(arr2[i]) == -1) {
    			element.className += " " + arr2[i];
    		}
    	}
    }

    function RemoveClass(element, name) {
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
} );
