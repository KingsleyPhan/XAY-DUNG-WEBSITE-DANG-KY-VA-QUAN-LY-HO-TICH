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
                		result = "* Nhập dài hơn quy định";
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

		function validateNgaySinh(id_NgaySinh){
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
				var input = "#input_" + id_NgaySinh.id;
				var date = id_NgaySinh.value;
				$(input).val(date);
				return true;
			}
			else{
				$(id_error).html(result);
				AddClass(id_NgaySinh,"fild_error");
				return false;
			}
		}

		function validateCMND(id_CMND) {
            var x = id_CMND;
			var result = "";
			if(x.value == "")
				{
					result = "* Không được để trống";
				}
			else
				{
					if (x.value.length !== 9 && x.value.length !== 12) {
                		result = "* Nhập sai định đạng";
					}
				}
			var id_error = "#error_" + id_CMND.id;
			$(id_error).html(result);
			if(result == "")
				{
					RemoveClass(id_CMND,"fild_error")
					return true;
				}
			AddClass(id_CMND,"fild_error");
			return false;
        }
		
		function validateRequired(id) {
            var x = id;
			var result = "";
			if(x.value == ""){
					result = "* Không được để trống";
			}
			else{
					if (x.value.length > 255) {
                		result = "* Nơi nhập dài hơn quy định";
					}
			}
			var id_error = "#error_" + id.id;
			$(id_error).html(result);
			if(result == "")
				{
					RemoveClass(id,"fild_error")
					return true;
				}
			AddClass(id,"fild_error");
			return false;
        }
	
		function validateNgayCap(id_NgayCap){
			var x = id_NgayCap;
			var result = "";
			var id_error = "#error_" + id_NgayCap.id;
			if(x.value == ""){
					result = "* Không được để trống";
			}
			else{
				var dateInput = id_NgayCap.value.split("/");
				var dateCur = new Date();
				
				if(dateCur.getFullYear() - dateInput[2] < 0 ){
					result = "* Nhập sai";
				}
				else{
					if(dateCur.getFullYear() - dateInput[2] == 0 ){
						var month = dateCur.getMonth()+1;
						if(month < dateInput[1]){
							result = "* Nhập sai";
						}
						else{
							if(month == dateInput[1]){
								if(dateCur.getDate() < dateInput[0]){
									result = "* Nhập sai";
								}
							}
						}
					}
				}
			}
			if(result == ""){
				$(id_error).html(result);
				RemoveClass(id_NgayCap,"fild_error")
				var input = "#input_" + id_NgayCap.id;
				var date = id_NgayCap.value;
				$(input).val(date);
				return true;
			}
			else{
				$(id_error).html(result);
				AddClass(id_NgayCap,"fild_error");
				return false;
			}
		}
		
		function validateNumber(id){
			var x = id;
			var result = "";
			if(x.value == ""){
					result = "* Phải nhập số";
			}
			var id_error = "#error_" + id.id;
			$(id_error).html(result);
			if(result == "")
				{
					RemoveClass(id,"fild_error")
					return true;
				}
			AddClass(id,"fild_error");
			return false;
		}

		function validateRadio(id_male, id_female){
			var mal = id_male;
			var fe = id_female;
			var result = "";
			if(mal.checked == false && fe.checked==false){
					result = "* Chưa chọn giới tính cho trẻ";
			}
			var id_error = "#error_" + id_male.id;
			$(id_error).html(result);
			if(result == "")
				{
				
					return true;
				}
		
			return false;
		}
		
		function validateSubmitKetHon(){
			var result = validateHoTen(nam_hovaten);
			result = validateNgaySinh(nam_ngaysinh) && result;
			result = validateCMND(nam_CMND) && result;
			result = validateRequired(nam_CMND_noicap)  && result;
			result = validateNgayCap(nam_CMND_ngaycap) && result;
			result = validateRequired(nam_id_dantoc) && result;
			result = validateRequired(nam_id_quoctich) && result;
			result = validateNumber(nam_solan) && result;
			result = validateRequired(nam_id_thanhpho) && result;
			result = validateRequired(nam_id_quan) && result;
			result = validateRequired(nam_id_phuong) && result;
			result = validateRequired(nam_diachi) && result;
			result = validateHoTen(nu_hovaten);
			result = validateNgaySinh(nu_ngaysinh) && result;
			result = validateCMND(nu_CMND) && result;
			result = validateRequired(nu_CMND_noicap)  && result;
			result = validateNgayCap(nu_CMND_ngaycap) && result;
			result = validateRequired(nu_id_dantoc) && result;
			result = validateRequired(nu_id_quoctich) && result;
			result = validateNumber(nu_solan) && result;
			result = validateRequired(nu_id_thanhpho) && result;
			result = validateRequired(nu_id_quan) && result;
			result = validateRequired(nu_id_phuong) && result;
			result = validateRequired(nu_diachi) && result;
			
			if(result){
				return true;
			}
			return false;
		}

		function validateSubmitKhaiSinh(){
			var result = validateHoTen(HoTenYeuCau);
			 result = validateCMND(CMNDYeuCau) && result;
			 result = validateRequired(NoiCapCMNDYeuCau) && result;
			 result = validateNgayCap(NgayCapCMNDYeuCau) && result;
			 result = validateRequired(NguoiYeuCau_QuanHe) && result;
			 result = validateRequired(NguoiYeuCau_QuanHeKhac) && result;
			 result = validateRequired(NguoiYeuCau_QuocTich) && result;
			 result = validateRequired(NguoiYeuCau_Tinh) && result;
			 result = validateRequired(NguoiYeuCau_Huyen) && result;
			 result = validateRequired(NguoiYeuCau_Phuong) && result;
			 result = validateRequired(NguoiYeuCau_DiaChi) && result;
			

			 result = validateHoTen(KhaiSinh_HoVaTen) && result;
			 result = validateRadio(male, female) && result;
			 result = validateNgayCap(KhaiSinh_ngaySinh) && result;
			 result = validateRequired(KhaiSinh_danToc) && result;
			 result = validateRequired(KhaiSinh_quocTich) && result;
			 result = validateRequired(KhaiSinh_ThanhPho) && result;
			 result = validateRequired(KhaiSinh_Quan) && result;
			 result = validateRequired(KhaiSinh_Phuong) && result;
			 result = validateRequired(KhaiSinh_DiaChi) && result;
			 result = validateRequired(KhaiSinh_CSSinh) && result;
			 result = validateRequired(KhaiSinh_QuocGiaSinh) && result;
			 result = validateRequired(KhaiSinh_TPSinh) && result;
			 result = validateRequired(KhaiSinh_QuanSinh) && result;
			 result = validateRequired(KhaiSinh_PhuongSinh) && result;
			 result = validateRequired(KhaiSinh_DiaChiSinh) && result;
			 
			 result = validateHoTen(Me_HoVaTen) && result;
			 result = validateRequired(Me_ngaySinh) && result;
			 result = validateCMND(Me_CMND) && result;
			 result = validateRequired(Me_NoiCap) && result;
			 result = validateNgayCap(Me_NgayCap) && result;
			 result = validateRequired(Me_DanToc) && result;
			 result = validateRequired(Me_QuocTich) && result;
			 result = validateRequired(Me_Tinh) && result;
			 result = validateRequired(Me_Quan) && result;
			 result = validateRequired(Me_Phuong) && result;
			 result = validateRequired(Me_DiaChi) && result;

			 result = validateHoTen(Cha_HoVaTen) && result;
			 result = validateRequired(Cha_ngaySinh) && result;
			 result = validateCMND(Cha_CMND) && result;
			 result = validateRequired(Cha_NoiCap) && result;
			 result = validateNgayCap(Cha_NgayCap) && result;
			 result = validateRequired(Cha_DanToc) && result;
			 result = validateRequired(Cha_QuocTich) && result;
			 result = validateRequired(Cha_Tinh) && result;
			 result = validateRequired(Cha_Quan) && result;
			 result = validateRequired(Cha_Phuong) && result;
			 result = validateRequired(Cha_DiaChi) && result;
			 
			 
			if(result){
				return true;
			}
			return false;
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
       