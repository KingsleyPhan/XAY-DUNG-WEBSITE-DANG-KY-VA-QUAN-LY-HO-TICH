
	function chgQuan(id_selectTP,id_selectQuan)
	{
		 var TP = id_selectTP;
		 var Quan = id_selectQuan;
		 var val = TP.value;
	  
	    var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function()
	    {
	        if(xhttp.readyState===4 && xhttp.status===200)
	        {
	            Quan.innerHTML = xhttp.responseText;
	        }
	    };
	    xhttp.open("POST","updateQuanServlet?valajax=" +val,true)
	    xhttp.send();
	}
	function chgPhuong(id_selectQuan,id_selectPhuong)
	{
		 var Phuong = id_selectPhuong;
		 var Quan = id_selectQuan;
	    var val = Quan.value;
	    var xhttp = new XMLHttpRequest();
	    xhttp.onreadystatechange = function()
	    {
	        if(xhttp.readyState===4 && xhttp.status===200)
	        {
	        	Phuong.innerHTML = xhttp.responseText;
	        }
	    };
	    xhttp.open("POST","updatePhuongServlet?valajax=" +val,true)
	    xhttp.send();
	}
	
	window.onload = function() {
		 chgQuan()
		 chgPhuong()
		};

	

	


	