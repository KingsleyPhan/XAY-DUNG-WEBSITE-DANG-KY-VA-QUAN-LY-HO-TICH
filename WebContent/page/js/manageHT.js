/* Formatting function for row details - modify as you need */
function format ( d ) {
    // `d` is the original data object for the row
    return '<table cellpadding="5" cellspacing="0" border="0" style="padding-left:50px;">'+
        '<tr>'+
            '<td>Full name:</td>'+
            '<td>'+d.name+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extension number:</td>'+
            '<td>'+d.extn+'</td>'+
        '</tr>'+
        '<tr>'+
            '<td>Extra info:</td>'+
            '<td>And any further details here (images etc)...</td>'+
        '</tr>'+
    '</table>';
}
 
$(document).ready(function() {
    var table = $('#table_id').DataTable( {
        "ajax": "../js/ajax.json",
        "columns": [
            {
                "className":      'details-control col-id',
                "orderable":      false,
                "data":           null,
                "defaultContent": ''
            },
			{
				"data": "name",
                "className":      'col-ma',
            },
            {
				"data": "name",
				"className":      'col-ma',
			},
            {
				"data": "position",
				"className":      'col-ma',
			},
            {
				"data": "office",
				"className":      'col-ngay',
			},
            {
				"data": "salary",
				"className":      'col-canbo',
			},
			{
				"data": "salary",
				"className":      'col-canbo',
			},
			{
				"data":		null,
				"defaultContent": '<div style="text-align: center;"><button class="btn btn-primary"><i class="glyphicon glyphicon-pencil"></i> Kiểm duyệt</button>',
				"classname":	'col-tacvu',
			},
        ],
		"lengthMenu" : [[2, 25, 50, -1], [2, 25, 50, "All"]],
    } );
     
    // Add event listener for opening and closing details
    $('#table_id tbody').on('click', 'td.details-control', function () {
        var tr = $(this).closest('tr');
        var row = table.row( tr );
 
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
} );