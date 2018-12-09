function functionButtonAdd(x) {
    if (document.getElementById("buttonSave").disabled == true) {
        document.getElementById("buttonCancel").disabled = false;
        document.getElementById("buttonAdd").disabled = true;
        document.getElementById("buttonEdit").disabled = true;

        document.getElementById("user_MACANBO").readOnly = false;
        document.getElementById("user_HoVaten").readOnly = false;
        document.getElementById("user_NgaySinh").readOnly = false;
        document.getElementById("user_ChucVu").readOnly = false;
        document.getElementById("user_Quyen").disabled = false;
        document.getElementById("user_Email").readOnly = false;
        document.getElementById("user_SDT").readOnly = false;
        document.getElementById("user_TrangThai").readOnly = false;



        document.getElementById("user_MACANBO").value = '';
        document.getElementById("user_HoVaten").value = '';
        document.getElementById("user_NgaySinh").value = '';
        document.getElementById("user_ChucVu").value = '';

        document.getElementById("user_Quyen").value = 0;


        document.getElementById("user_Email").value = '';
        document.getElementById("user_SDT").value = '';

        document.getElementById("buttonSave").disabled = false;

        document.getElementById("ResetPassword").style.display = "none";
        document.getElementById("Username").style.display = "block";
        document.getElementById("password").style.display = "block";
        document.getElementById("buttonReset").style.display = "none";


    }


}
function myFunction(x) {
    document.getElementById("buttonCancel").disabled = false;

    if (document.getElementById("buttonSave").disabled == true) {
        var t = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[2].innerHTML;
        // alert("Row index is: " + document.getElementById("table-user-imfor").rows[x.rowIndex].cells[2].innerHTML + document.getElementById("table-user-imfor").rows[x.rowIndex].cells[3].innerHTML );

        document.getElementById("buttonEdit").disabled = false;
        document.getElementById("buttonReset").disabled = false;
        document.getElementById("user_MACANBO").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[1].innerHTML;
        document.getElementById("user_HoVaten").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[2].innerHTML;
        document.getElementById("user_NgaySinh").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[3].innerHTML;
        document.getElementById("user_ChucVu").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[4].innerHTML;
        if (document.getElementById("table-user-imfor").rows[x.rowIndex].cells[7].innerHTML == "Cán bộ hộ tịch") {
            document.getElementById("user_Quyen").value = 1;
        }
        else {
            if (document.getElementById("table-user-imfor").rows[x.rowIndex].cells[7].innerHTML == "Quản trị cơ quan") {
                document.getElementById("user_Quyen").value = 2;
            }
        }

        document.getElementById("user_Email").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[6].innerHTML;
        document.getElementById("user_SDT").value = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[5].innerHTML;

        // document.getElementById("user_TrangThai").innerHTML = document.getElementById("table-user-imfor").rows[x.rowIndex].cells[9].innerHTML;

        // alert( document.getElementById("table-user-imfor").rows[x.rowIndex].cells[7].innerHTML);
    }



}
$(document).ready(function () {
    // Setup - add a text input to each footer cell
    $('#example tfoot th').each(function () {
        var title = $(this).text();
        $(this).html('<input type="text" placeholder="Search ' + title + '" />');
    });

    // DataTable
    var table = $('#example').DataTable();

    // Apply the search
    table.columns().every(function () {
        var that = this;

        $('input', this.footer()).on('keyup change', function () {
            if (that.search() !== this.value) {
                that
                    .search(this.value)
                    .draw();
            }
        });
    });
});

function functionChinhSua(x) {
    document.getElementById("buttonSave").disabled = false;

    document.getElementById("store").value=1;
    
    
  
    document.getElementById("user_HoVaten").readOnly = false;
    document.getElementById("user_NgaySinh").readOnly = false;
    document.getElementById("user_ChucVu").readOnly = false;
    document.getElementById("user_Quyen").disabled = false;
    document.getElementById("user_Email").readOnly = false;
    document.getElementById("user_SDT").readOnly = false;
    document.getElementById("user_TrangThai").readOnly = false;


    x.disabled = true;
}

function functionButtonSave(x) {
	
    if (document.getElementById("buttonAdd").disabled == true) 
    {
      
        if(!validateSubmitThemNhanVien());
        {
            return false;
        }

        document.getElementById("buttonAdd").disabled = false;
        document.getElementById("ResetPassword").style.display = "block";
        document.getElementById("Username").style.display = "none";
        document.getElementById("password").style.display = "none";
        document.getElementById("buttonReset").style.display = "block";

        
    }
   

   

    document.getElementById("buttonReset").disabled = true;
    document.getElementById("user_MACANBO").readOnly = true;
    document.getElementById("user_HoVaten").readOnly = true;
    document.getElementById("user_NgaySinh").readOnly = true;
    document.getElementById("user_ChucVu").readOnly = true;
    document.getElementById("user_Quyen").readOnly = true;
    document.getElementById("user_Email").readOnly = true;
    document.getElementById("user_SDT").readOnly = true;
    document.getElementById("user_TrangThai").readOnly = true;

    

  

return true;
    //  document.getElementById("buttonEdit").disabled = false;
}

function functionReset(x) {
    document.getElementById("buttonCancel").disabled = false;
    if (document.getElementById("buttonEdit").disabled==false) {
        if (document.getElementById("user_RSP").readOnly == true) {
            document.getElementById("user_RSP").readOnly = false;
            x.innerHTML = "LƯU PASSWORD";
            document.getElementById("user_RSP").focus();
            return false;
        }
        else {
           
            return true;
        }
    }
}

function functionCancel(x)
{
       x.disabled = true;
       document.getElementById("store").value=0;
       

      
       document.getElementById("user_MACANBO").readOnly = true;
       document.getElementById("user_HoVaten").readOnly = true;
       document.getElementById("user_NgaySinh").readOnly = true;
       document.getElementById("user_ChucVu").readOnly = true;
       document.getElementById("user_Quyen").disabled = true;
       document.getElementById("user_Email").readOnly = true;
       document.getElementById("user_SDT").readOnly = true;
       document.getElementById("user_TrangThai").readOnly = true;
   
       document.getElementById("user_MACANBO").value = '';
       document.getElementById("user_HoVaten").value = '';
       document.getElementById("user_NgaySinh").value = '';
       document.getElementById("user_ChucVu").value = '';
   
       document.getElementById("user_Quyen").value = 0;
   
   
       document.getElementById("user_Email").value = '';
       document.getElementById("user_SDT").value = '';

       document.getElementById("Username").value = '';
       document.getElementById("password").value = '';

       document.getElementById("buttonAdd").disabled = true;
       document.getElementById("buttonEdit").disabled = true;
       document.getElementById("ResetPassword").style.display = "block";
       document.getElementById("Username").style.display = "none";
       document.getElementById("password").style.display = "none";
       document.getElementById("buttonReset").style.display = "block";
       document.getElementById("buttonSave").disabled = true;
       document.getElementById("buttonReset").disabled = true;
}