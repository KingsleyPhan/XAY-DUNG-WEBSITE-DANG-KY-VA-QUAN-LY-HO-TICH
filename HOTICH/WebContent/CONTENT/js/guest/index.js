function SearchCoQuan()
	{
		
		$("#myModal").modal();
	}
	
	

	var set_height;
	var h;

	set_height = function() {
		$('.header').each(function() {
			// lấy height của chính nó
			var el_height = $(this).height();
			h = $(this).height();
			// gán height cho element
			$(this).css('height', el_height);
		});
	}

	$(window).on(
			'load resize',
			function() {
				document.getElementById("ct").style.paddingTop = $(
						'.header').height()
						+ 'px';
				document.getElementById("ct").style.fontSize = '0';
			});


	
	function ChangeLocation()
	{
	    var e = document.getElementById("comboCoQuan");
	    var textThanhPho = e.options[e.selectedIndex].text;
		document.getElementById("bannerCoQuan").innerHTML = textThanhPho;
		
		 e = document.getElementById("modal-quan");
	     textQuan = e.options[e.selectedIndex].text;
		 document.getElementById("CoQuanCap2").innerHTML = textThanhPho;
		 e = document.getElementById("modal-xaPhuong");
	     textPhuong = e.options[e.selectedIndex].text;
		 document.getElementById("CoQuanCap2").innerHTML = textPhuong + " " + textQuan;
		
		 
		 
		$('#myModal').modal('hide');
	}

	function chgQuan()
	{
	    var val = document.getElementById("comboCoQuan").value;
	    var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function()
	    {
	        if(xhttp.readyState===4 && xhttp.status===200)
	        {
	            document.getElementById("modal-quan").innerHTML = xhttp.responseText;
	        }
	    };
	    xhttp.open("POST","updateQuanServlet?valajax=" +val,true)
	    xhttp.send();
	    chgPhuong()
	}

	function chgPhuong()
	{
	    var val = document.getElementById("modal-quan").value;
	    var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function()
	    {
	        if(xhttp.readyState===4 && xhttp.status===200)
	        {
	            document.getElementById("modal-xaPhuong").innerHTML = xhttp.responseText;
	        }
	    };
	    xhttp.open("POST","updatePhuongServlet?valajax=" +val,true)
	    xhttp.send();
	}

    var input = document.getElementById( 'file-upload' );
    var infoArea = document.getElementById( 'file-upload-filename' );

    input.addEventListener( 'change', showFileName );

    function showFileName( event ) {
      
      // the change event gives us the input it occurred in 
      var input = event.srcElement;
      
      // the input has an array of files in the `files` property, each one has a name that you can use. We're just using the name here.
      var fileName = input.files[0].name;
      
      // use fileName however fits your app best, i.e. add it into a div
      infoArea.textContent = 'File name: ' + fileName;
    }


	