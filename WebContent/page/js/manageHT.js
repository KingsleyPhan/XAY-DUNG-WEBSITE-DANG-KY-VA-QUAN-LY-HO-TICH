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
        $(this).html( '<input type="text" placeholder="Search '+title+'" />' );
    } );
	
    var table = $('#table_id').DataTable( {
        "ajax": "../js/hotich.json",
        "columns": [
			{
                "className":      'col-stt',
                "orderable":      false,
				"data":           null,
            },
			{
				"data": "ma-hotich",
                "className":      'col-ma',
				"visible" : false,
				"orderable":      false,
            },
            {
				"data": "so-hotich",
				"className":      'col-ma',
				"orderable":      false,
			},
            {
				"data": "quyen",
				"className":      'col-ma',
				"orderable":      false,
			},
            {
				"data": "ngay-hieuluc",
				"className":      'col-ngay',
				"orderable":      false,
			},
            {
				"data": "nguoi-xu-li",
				"className":      'col-canbo',
				"orderable":      false,
			},
			{
				"data": "nguoi-ki",
				"className":      'col-canbo',
				"orderable":      false,
			},
			{
				"orderable":      false,
				"data":		null,
				"defaultContent": '<div style="text-align: center;"><a href="HoTichKhaiSinh?'+row.data().ma-hotich+'.html" class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i> Xem</a></div>',
				"classname":	'col-tacvu',
				
			},
        ],
		"lengthMenu" : [[10, 25, 50, -1], [10, 25, 50, "All"]],
		"order" : false,
//		dom: 'Bfrtip',
//        buttons: [
//            { extend: 'copyHtml5'},
//            { extend: 'excelHtml5' },
//            { extend: 'csvHtml5'},
//            { extend: 'pdfHtml5'}
//        ],
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
	
	
	// Apply the search
    table.columns([2,3,4,5,6]).every( function () {
        var that = this;
 
        $( 'input', this.footer() ).on( 'keyup change', function () {
            if ( that.search() !== this.value ) {
                that
                    .search( this.value )
                    .draw();
            }
        } );
    } );
	
    table.on('order.dt search.dt', function(){
		table.column(0,{search:'applied',order:'applied'}).nodes().each(function(cell,i){
			cell.innerHTML = i + 1;
		});
	});
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
					w3RemoveClass(deafaultTr[i],'shown');
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
} );
