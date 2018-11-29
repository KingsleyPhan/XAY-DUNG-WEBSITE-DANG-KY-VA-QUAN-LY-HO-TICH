$(document).ready(function() {
	
})
function submitKiemDuyet(){
	window.location="PhanHoi"
}
function getCheckKhaiSinh() {
	var cmndNgYeuCau = $("#NYC_CMND").val();
	var cmndMe = $("#ME_CMND").val();
	var cmndCha = $("#CHA_CMND").val();
	console.log("CMND NgYeuCau : " + cmndNgYeuCau);
	console.log("CMND mẹ : " + cmndMe);
	console.log("CMND cha : " + cmndCha);

	$.ajax({
		method : "POST",
		data : {
			cmndNgYeuCau : cmndNgYeuCau,
			cmndMe : cmndMe,
			cmndCha : cmndCha
		},
		url : "HoSoDangKy/getInfo",
		success : function(data) {
			console.log(data)
			var temp = JSON.parse(data);
			var ngYeuCau = temp.khaisinh[0];
			var me = temp.khaisinh[1];
			var cha = temp.khaisinh[2];
			console.log(ngYeuCau.hoVaTen);
			console.log(me.hoVaTen);
			console.log(cha.hoVaTen);
			return temp;
		}
	})
}
function checkNgYeuCau(){
	var cmndNgYeuCau = $("#NYC_CMND").val();
	console.log("CMND NgYeuCau : " + cmndNgYeuCau);
	$.ajax({
		method : "POST",
		data : {
			cmnd : cmndNgYeuCau,
		},
		url : "HoSoDangKy/getInfo1",
		success : function(data) {
			console.log(data);
			var ngYeuCau = JSON.parse(data);
			console.log(ngYeuCau)
			var error = "";
			error += checkValue(NYC_HOVATEN,gly_NYC_HOVATEN,feedback_NYC_HOVATEN,ngYeuCau.hoVaTen);
			error += checkValue(NYC_CMND,gly_NYC_CMND,feedback_NYC_CMND,ngYeuCau.cmndSo);
			error += checkValue(NYC_NOICAP,gly_NYC_NOICAP,feedback_NYC_NOICAP,ngYeuCau.cmndNoiCap);
			error += checkValue(NYC_NGAYCAP,gly_NYC_NGAYCAP,feedback_NYC_NGAYCAP,ngYeuCau.cmndNgayCap);
			error += checkValue(NYC_QUOCTICH,gly_NYC_QUOCTICH,feedback_NYC_QUOCTICH,ngYeuCau.quocTich);
			error += checkValue(NYC_THANHPHO,gly_NYC_THANHPHO,feedback_NYC_THANHPHO,ngYeuCau.thanhPho);
			error += checkValue(NYC_QUAN,gly_NYC_QUAN,feedback_NYC_QUAN,ngYeuCau.quan);
			error += checkValue(NYC_PHUONG,gly_NYC_PHUONG,feedback_NYC_PHUONG,ngYeuCau.phuong);
			error += checkValue(NYC_DIACHI,gly_NYC_DIACHI,feedback_NYC_DIACHI,ngYeuCau.diachi);
			if(error !== ""){
				var temp = "Những thông tin nhập sai phần người yêu cầu : \n" + error;
				$("#NYC_ERROR").val(temp);
				console.log(temp);
				alert(temp);
				return;
			}
			$("#NYC_ERROR").val("Hoàn thành");
			console.log("Hoàn thành");
			alert("Hoàn thành");
		}
	})
}
function checkValue(x,gly,feedback,value){
	var result = "";
	var isNull = false;
	var message =  "";
	if (x.value == "" || x.value == undefined) {
		isNull = true;
		result = "* Công dân đã để trống";
	} else {
		if (x.value !== value) {
			result = "* Nhập sai";
		}
	}
	var id_error = "#error_" + x.id;
	$(id_error).html(result);
	if (result == "" && result == "") {
		RemoveClass(x, " fild_error");
		RemoveClass(gly," glyphicon-remove");
		RemoveClass(feedback," has-error");
		
		AddClass(x, " fild_success");
		AddClass(gly," glyphicon-ok");
		AddClass(feedback," has-success")
		
		message = "";
		return message;
	}
	else{
		RemoveClass(x, " fild_success");
		RemoveClass(gly," glyphicon-ok");
		RemoveClass(feedback," has-success");
		
		AddClass(x, " fild_error");
		AddClass(gly," glyphicon-remove");
		AddClass(feedback," has-error");
		
		var name = x.id.split("_");
		switch(name[1]) {
	    case "HOVATEN":
	        return message = "- Họ và tên ; \n";
	    case "CMND":
	        return message = "- Số chứng minh nhân dân ; \n";
	    case "NOICAP":
	        return message = "- Nơi cấp chứng minh nhân dân ; \n";
	    case "NGAYCAP":
	        return message = "- Ngày cấp chứng minh nhân dân ; \n";
	    case "QUOCTICH":
	        return message = "- Quốc tịch ; \n";
	    case "DANTOC":
	        return message = "- Dân tộc ; \n";
	    case "QUEQUAN":
	        return message = "- Quê quán ; \n";
	    case "THANHPHO":
	        return message = "- Thành phố nơi đang sống ; \n";
	    case "QUAN":
	        return message = "- Quận nơi đang sống ; \n";
	    case "PHUONG":
	        return message = "- Phương nơi đang sống ; \n";
	    case "DIACHI":
	        return message = "- Địa chỉ nhà ; \n";
	    default:
	    	return message = "- Chưa xác định lỗi ; \n";
	}
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