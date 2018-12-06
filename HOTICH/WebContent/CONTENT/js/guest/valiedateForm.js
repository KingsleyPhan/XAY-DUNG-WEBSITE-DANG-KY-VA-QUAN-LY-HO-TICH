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
			if(x.value == "" || x.value == undefined)
				{
					result = "* Không được để trống";
				}
			else
				{
					if (x.value.length > 50) {
                		result = "* Nhập dài hơn quy định";
					}
				}
			var id_error = "#error_" + id_HoVaTen.id;
			$(id_error).html(result);
			if(result == "" && result == "")
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
			if(x.value == "" || x.value == undefined){
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
			if(x.value == "" || x.value == undefined)
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
			if(x.value == "" || x.value == undefined){
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
		
		function validateCheckBox(id) {
            var x = id;
			var result = "";
			if(x.checked==false){
					result = "* Không được bỏ qua";
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
			if(x.value == "" || x.value == undefined){
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
		
		function validateNumber(id ){
			var x = id;
			var result = "";
			if(x.value == "" || x.value == undefined){
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
					result = "* Chưa chọn giới tính";
			}
			var id_error = "#error_" + id_male.id;
			$(id_error).html(result);
			if(result == "")
				{
				
					return true;
				}
		
			return false;
		}
		
		function quanHeKhac(){
			var val =   document.getElementById("NguoiYeuCau_QuanHe").value;
		    if(val !=2)
		    {
		    	document.getElementById("NguoiYeuCau_QuanHeKhac").disabled = true;
		    }
		    else
		    	{
		    	document.getElementById("NguoiYeuCau_QuanHeKhac").disabled = false;
		    	}
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
			result =validateCheckBox(checkCamKet) && result;
			 
			if(result){
				return true;
			}
			return false;
		}
		
		 function validateXacNhan(id_code, id_des) {
	            var x = id_code;
	            var des = id_des;
				var result = "";
				if(x.value == "" || x.value == undefined)
					{
						result = "* Không được để trống";
					}
				else
					{
						if(des.innerHTML != x.value)
						{
							result = "* Mã code không đúng";
						}	
					}
				var id_error = "#error_" + id_code.id;
				$(id_error).html(result);
				if(result == "")
					{
						RemoveClass(id_code,"fild_error")
						return true;
					}
				AddClass(id_code,"fild_error");
				return false;
	        }
	        
		
		function validateTraCuu()
		{
			var result = validateRequired(MaHoSo);
			 result = validateXacNhan(code2, code1) && result;
			
			if(result){
				return true;
			}
			return false;
		}
		
		

		function validateSubmitKhaiSinh(){
			
			var val =   document.getElementById("NguoiYeuCau_QuanHe").value;
			
			var CheckBoxValue;
		
			var result = validateHoTen(NYC_HOVATEN);
			 result = validateCMND(CMNDYeuCau) && result;
			 result = validateRequired(NoiCapCMNDYeuCau) && result;
			 result = validateNgayCap(NgayCapCMNDYeuCau) && result;
			 result = validateRequired(NguoiYeuCau_QuanHe) && result;
			 if(val==2)
			{
				 result = validateRequired(NguoiYeuCau_QuanHeKhac) && result;
			}
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
			 
			 CheckBoxValue = document.getElementById("nu_check_yeucau").checked;
		
			 if(CheckBoxValue == false)
			 {
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
			 }
			 CheckBoxValue = document.getElementById("nam_check_yeucau").checked;

			 if(CheckBoxValue == false)
			 {
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
			 }
			 
			 result =validateCheckBox(checkCamKet) && result;
			if(result){
				return true;
			}
			return false;
		}
		

		function validateSubmitChungTu(){
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
			

			 result = validateHoTen(QuaDoi_HoVaTen) && result;
			 result = validateRadio(male, female) && result;
			 result = validateNgayCap(QuaDoi_ngaySinh) && result;
			 result = validateRequired(QuaDoi_danToc) && result;
			 result = validateRequired(QuaDoi_quocTich) && result;
			 result = validateRequired(QuaDoi_ThanhPho) && result;
			 result = validateRequired(QuaDoi_Quan) && result;
			 result = validateRequired(QuaDoi_Phuong) && result;
			 result = validateRequired(QuaDoi_DiaChi) && result;
			 result = validateRequired(QuaDoi_NguyenNhan) && result;
			 result = validateRequired(QuaDoi_QuocGiaQuaDoi) && result;
			 result = validateRequired(QuaDoi_TPQuaDoi) && result;
			 result = validateRequired(QuaDoi_QuanQuaDoi) && result;
			 result = validateRequired(QuaDoi_PhuongQuaDoi) && result;
			 result = validateRequired(QuaDoi_DiaChiQuaDoi) && result;
			 result = validateNgayCap(QuaDoi_NgayQuaDoi) && result;
			 result = validateRequired(QuaDoi_LoaiBaoTu) && result;
			 result = validateRequired(QuaDoi_SoBaoTu) && result;
			if(result){
				return true;
			}
			return false;
		}
		
		function checkEmailNhanCien(id ){
			var x = id;
			var result = "";
			
			  var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
			    if (!filter.test(x.value)) {
			             x.focus; 
			             result = "* Sai Fortmat Email";
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
		
		function validateSubmitThemNhanVien(){
			var result = validateHoTen(user_HoVaten);
			 result = validateNgaySinh(user_NgaySinh) && result;
			 result =validateRequired(user_MACANBO) && result;
			 result = validateRequired(user_ChucVu) && result;
			 result = validateRequired(user_Email) && result;
			 result = checkEmailNhanCien(user_Email) && result;
			 result = validateRequired(user_SDT) && result;
			if(result){
				return true;
			}
			return false;
		}
		
		function checkEmail(id_ele) { 
		    var email = id_ele; 
		    var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/; 
		    if (!filter.test(email.value)) {
		             email.focus; 
		             return false; 
		    }
		    else{ 
		            return true;
		    } 
		} 
		
		function validateCode(id_scr, id_des){
			var sc = id_scr;
			var ds = id_des;
			
			if(sc.innerHTML == ds.value)
			{
				return true;
			}
			else
				{
				 $(id_error).html('Sai Mã xác nhận. Mời nhập lại');
				 SearchCoQuans();
				 return false;
				}
			
		}
		
		function validateletDt(id_des){
			var ds = id_des;
			
			if(ds.value.length==10)
			{
				return true;
			}
			else
				{
				 $(id_error).html('Sai Số điện thoại');
				 SearchCoQuans();
				 return false;
				}
			
		}
		
	
		
		function validateSubmitXacNhanNopHoSo(){
			var result = validateHoTen(xacNhanEmail);
			 result = validateHoTen(xacNhanDienThoai) && result;
			 result = validateCode(textXacNhan,id_typeXacNhan);
			
			 if(result==false)
				{
					 return false;
				} 
			 if(validateletDt(xacNhanDienThoai)==false)
				 {
					 $(id_error).html('Sai Số điện thoại');
					 SearchCoQuans();
				 
					 	return false;
				 }
			 
			 if(checkEmail(xacNhanEmail) == false)
		     {
				 $(id_error).html('Sai format email');
				 SearchCoQuans();
				 
				 return false;
		     }
			 
			 checkEmail(xacNhanEmail);
			 validateletDt(xacNhanDienThoai);
			if(result){
				$(id_error).html('Nộp hồ sơ thành công');
				
				SearchCoQuans();
				return true;
			}
			$(id_error).html('Không thể nộp đơn yêu cầu. Xin kiểm tra lại !!!');
			SearchCoQuans();
			return false;
		}

		function SearchCoQuans()
		{
			
			$("#myModals").modal();
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
        
         $(document).ready(function () {
            var date_input = $('input[name="NYC_NGAYCAP"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
        
             $(document).ready(function () {
            var date_input = $('input[name="KS_NGAYSINH"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="ME_NGAYSINH"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="ME_NGAYCAP"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="CHA_NGAYCAP"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="CHA_NGAYSINH"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="VO_NGAYSINH"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="CHONG_NGAYSINH"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="VO_NGAYCAP"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
             $(document).ready(function () {
            var date_input = $('input[name="CHONG_NGAYCAP"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
           $(document).ready(function () {
            var date_input = $('input[name="user_NgaySinh"]'); //our date input has the name "date"
            var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
            date_input.datepicker({
                format: 'dd/mm/yyyy',
                container: container,
                todayHighlight: true,
                autoclose: true,
            })
        })
        
       