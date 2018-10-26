		function AddClass(element, name) {
		  var i, arr1, arr2;
		  arr1 = element.className.split(" ");
		  arr2 = name.split(" ");
		  for (i = 0; i < arr2.length; i++) {
			if (arr1.indexOf(arr2[i]) == -1) {element.className += " " + arr2[i];}
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
		
        function validateHoTen(id_HoVaTen) {
            var x = id_HoVaTen;
			var result = "";
			if(x.value == "")
				{
					result = "* Không được để trống";
				}
			else
				{
					if (x.value.length > 2) {
                		result = "* Tên bạn nhập dài hơn quy định";
					}
				}
			var id_error = "#error_" + id_HoVaTen.id;
			$(id_error).html(result);
			if(result == "")
				{
					RemoveClass(id_HoVaTen,"fild_error")
					return true;
				}
			AddClass(id_HoVaTen,"fild_error");
			return false;
        }

		function validateNgaySinh(id_NgaySinh)
		{
			var x = id_NgaySinh;
			var result = "";
			var id_error = "#error_" + id_NgaySinh.id;
			if(x.value == ""){
					result = "* Không được để trống";
			}
			else{
				var dateBirth = id_NgaySinh.value.split("/");
				var dateCur = new Date();
				
				if((dateCur.getFullYear() - dateBirth[2] < 20 && id_NgaySinh.id == "nam_ngaysinh" ) || (dateCur.getFullYear() - dateBirth[2] < 18 && id_NgaySinh.id == "nu_ngaysinh" ) ){
					result = "* Bạn chưa đủ tuổi";
				}
				else{
					if((dateCur.getFullYear() - dateBirth[2] == 20 && id_NgaySinh.id == "nam_ngaysinh" ) || (dateCur.getFullYear() - dateBirth[2] == 18 && id_NgaySinh.id == "nu_ngaysinh" )){
						var month = dateCur.getUTCMonth() + 1;
						if((dateCur.getMonth()+1) < dateBirth[1]){
							result = "* Bạn chưa đủ tuổi";
						}
						else{
							if((dateCur.getMonth()+1) == dateBirth[1]){
								if(dateCur.getDate() < dateBirth[0]){
									result = "* Bạn chưa đủ tuổi";
								}
							}
						}
					}
				}
			}
			if(result == ""){
				$(id_error).html(result);
				RemoveClass(id_NgaySinh,"fild_error")
				return true;
			}
			else{
				$(id_error).html(result);
				AddClass(id_NgaySinh,"fild_error");
				return false;
			}
		}

        $(document).ready(function () {
            var date_input = $('input[name="date"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
       