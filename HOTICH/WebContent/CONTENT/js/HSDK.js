$(document).ready( function () {
		 
	    // get inputs
	    var coQuanID = 1;
	 
	    $.ajax({
	        url: "HoSoDangKy",
	        type: 'POST',
	        dataType: 'json',
	        data: JSON.stringify(coQuanID),
	        contentType: 'application/json',
	        mimeType: 'application/json',
	 
	        success: function (data) {
	        	alert("success: "+data+" status: "+status);
	        },
	        error:function(data,status,er) {
	            alert("error: "+data+" status: "+status+" er:"+er);
	        }
	    });
});