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
    $('#table_id thead div.search').each( function () {
        var title = $(this).text();
        $(this).html( '<input type="text" class="form-control" placeholder="Nhập '+title+'. . ." />' );
    } );
	
    var table = $('#table_id').DataTable( {
    	"processing" : true,
    	"ajax" : {
			"data" : {key : -1},
			"url" : "QuanLyHoTich/getAll",
			"dataSrc":"",
			"type" : "POST",
		},
        "columns": [
        	{
    			"data": "stt",
    			"className" : 'col-stt',
    			"orderable" : false,
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
				"className":	'col-tacvu',
				"orderable":      false,
				"data":		null,
				"defaultContent": '<div style="text-align:center;">'
									+'<button type="button" class="btn btn-info view" data-toggle="modal" data-target="#exampleModal">'
										+'<i class="glyphicon glyphicon-search"></i>'
									+'</button>'
									+'<button class="btn btn-warning edit">'
										+'<i class="glyphicon glyphicon-pencil"></i>'
									+'</button>'
									+'<button class="btn btn-danger delete">'
										+'<i class="glyphicon glyphicon-ban-circle"></i>'
									+'</button>'
								+'</div>',
			},
        ],
        scrollCollapse : true,
		lengthMenu : [[10, 25, 50, -1], [10, 25, 50, "Tất cả"]],
		order : false,
		/*"initComplete": function () {
            var api = this.api();
            api.$('td:not(.col-tacvu)').click( function () {
                api.search( this.innerHTML ).draw();
            } );
        },*/
    } );
    
    table.on('order.dt search.dt', function() {
		table.column(0, {
			search : 'applied',
			order : 'applied'
		}).nodes().each(function(cell, i) {
			cell.innerHTML = i + 1;
			//Lưu số thứ tự vào lại datatable
			var tr = $(cell).closest('tr');
			table.row(tr).data().stt = i + 1;
			/*console.log(table.row(tr).data().stt)*/
		});
	}).draw();
	
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
	
    // Apply the search
    table.columns([6,7,8,9,10]).every( function () {
        var that = this;
        $( 'input', this.header() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } ).draw();;
    
    $('#table_id tbody').on( 'click', 'td.col-tacvu .edit', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
        console.log( table.row( tr ).data().id);
        /*table.ajax.reload();*/
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
    
    
    $('#table_id tbody').on( 'click', 'td.col-tacvu .view', function () {
    	var tr = $(this).closest('tr');
        var row = table.row( tr );
        console.log( table.row( tr ).data().id);
    	/*$.confirm({
            title: 'Adding images',
            content: '<p class="image">Images from flickr</p>' +
            '<img src="https://c2.staticflickr.com/4/3891/14354989289_2eec0ba724_b.jpg">',
            animation: 'scale',
            animationClose: 'top',
            buttons: {
                confirm: {
                    text: 'Add more',
                    btnClass: 'btn-blue',
                    action: function () {
                        this.$content.append('<img src="https://c2.staticflickr.com/6/5248/5240523362_8d6d315391_b.jpg">');
                        return false; // prevent dialog from closing.
                    }
                },
                cancel: function () {
                    // lets the user close the modal.
                }
            },
        });*/
    	var ma = table.row( tr ).data().ma;
    	var soQuyen = table.row( tr ).data().soQuyen;
    	var loai = table.row( tr ).data().loaiGiayToID;
    	$('#giayHoTich').attr("src","QuanLyHoTich/getImage?ma="+ma+"&soQuyen="+soQuyen+"&loai="+loai);
    });
    
    $('#table_id tbody').on( 'click', 'td.col-tacvu .delete', function () {
    	$.confirm({
    	    title: 'Confirm!',
    	    content: 'Simple confirm!',
    	    buttons: {
    	        confirm: function () {
    	            $.alert('Confirmed!');
    	        },
    	        cancel: function () {
    	            $.alert('Canceled!');
    	        },
    	        somethingElse: {
    	            text: 'Something else',
    	            btnClass: 'btn-blue',
    	            keys: ['enter', 'shift'],
    	            action: function(){
    	                $.alert('Something else?');
    	            }
    	        }
    	    }
    	});
    });
} );
function showChange(){
	console.log($("#loai-giay").val())
	filterSelection($("#loai-giay").val());
}

function filterSelection(c) {
	var table = $('#table_id').DataTable();
	table.search("").draw();
	if(c == -1){
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
