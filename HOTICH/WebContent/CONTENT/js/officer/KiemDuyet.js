$(document).ready(function() {
	/*$('#tooltip_KS_HOVATEN').darkTooltip({
		trigger:'click',
		animation:'flipIn',
		gravity:'north',
		confirm:true,
		yes:'Sure',
		no:'No Way',
	});
	$('#tooltip_KS_NGAYSINH').darkTooltip({
		trigger:'click',
		animation:'flipIn',
		gravity:'north',
		confirm:true,
		yes:'Sure',
		no:'No Way',
	});*/
})


function goBack(){
	window.location = "QuanLyDangKy";
}

function submitKiemDuyetKhaiSinh(){
	var chaError = $("#CHA_ERROR").val();
	var nycError = $("#NYC_ERROR").val();
	var meError = $("#ME_ERROR").val();
	var dinhKemError = $("#DINHKEM_ERROR").val();
	var ksError = $("#KS_ERROR").val();
	var haveError = false;
	
	var message = "";
	if (nycError === "Error") {
		message += "Công dân đã nhập lỗi thông tin người yêu cầu \n Vui lòng phản hồi !!!\n";
		haveError = true;
	} else {
		if (nycError === "") {
			message += "Chưa kiểm duyệt người yêu cầu !!!\n";
			checkNgYeuCau();
		}
	}
	if (meError !== undefined) {
		if (meError === "Error") {
			message += "Công dân đã nhập lỗi thông tin người mẹ \n Vui lòng phản hồi !!!\n";
			haveError = true;
		} else {
			if (meError === "") {
				message += "Chưa kiểm duyệt mẹ !!!\n";
				checkMe();
			}
		}
	}
	if (chaError !== undefined) {
		if (chaError === "Error") {
			message += "Công dân đã nhập lỗi thông tin người cha \n Vui lòng phản hồi !!!\n";
			haveError = true;
		} else {
			if (chaError === "") {
				message += "Chưa kiểm duyệt cha !!!\n";
				checkCha();
			}
		}
	}
	if (ksError !== undefined) {
		if (ksError === "Error") {
			message += "Công dân đã nhập lỗi thông tin người được khai sinh \n Vui lòng phản hồi !!!\n";
			haveError = true;
			haveCheckKS = true;
		} else {
			if (ksError === "") {
				message += "Chưa kiểm duyệt đối tượng khai sinh !!!\n";
				/*checkKS();*/
			}
		}
	}
	else{
		message += "Chưa kiểm duyệt đối tượng khai sinh !!!\n";
	}
	if(dinhKemError !== undefined){
		if(dinhKemError === "Error"){
			message += "Công dân chưa thêm file đính kèm \n Vui lòng phản hồi !!!\n";
			haveError = true;
			haveCheckDK = true;
		}else{
			if(dinhKemError === ""){
				message += "Chưa kiểm duyệt file đính kèm\n";
				/*checkDinhKem();*/
			}
		}
	}
	else{
		message += "Chưa kiểm duyệt file đính kèm\n";
	}
	if(message === ""){
		var error = "";
		if(nycError !== "Completed"){
			error += nycError;
		}
		if(chaError !== "Completed" && chaError !== undefined){
			error += chaError;
		}
		if(meError !== "Completed" && meError !== undefined){
			error += meError;
		}
		if(dinhKemError !== "Completed" && dinhKemError !== undefined){
			error += dinhKemError;
		}
		if(ksError !== "Completed" && ksError !== undefined){
			error += ksError;
		}
		if(error === "" || error == undefined){
			error = "NoError"
		}
		$("#ERROR").val(error);
		return true;
	}
	else{
		console.log(message)
		alert(message);
		if (ksError !== undefined && dinhKemError !== undefined){
			/*Trường hợp : Xảy ra lỗi khi kiểm duyệt*/
			if(haveError){
				var temp = "Error";
				$("#ERROR").val(temp);
				return true;
			}
			/*Trường hợp : chưa kiểm duyệt*/
			return false;
		}
		return false;
	}
}
/*function getCheckKhaiSinh() {
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
}*/

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
			error += checkQuanHe();
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
			$("#NYC_ERROR").val("Completed");
			console.log("Hoàn thành");
			alert("Hoàn thành");
		},
		error: function (err) {
			$("#NYC_ERROR").val("Error");
            alert("Error: Không tìm thấy công dân");
        }
	})
}

function checkMe(){
	var cmndMe = $("#ME_CMND").val();
	console.log("CMND Mẹ : " + cmndMe);
	$.ajax({
		method : "POST",
		data : {
			cmnd : cmndMe,
		},
		url : "HoSoDangKy/getInfo1",
		success : function(data) {
			console.log(data);
			var me = JSON.parse(data);
			console.log(me)
			var error = "";
			error += checkValue(ME_HOVATEN,gly_ME_HOVATEN,feedback_ME_HOVATEN,me.hoVaTen);
			error += checkValue(ME_NGAYSINH,gly_ME_NGAYSINH,feedback_ME_NGAYSINH,me.ngaySinh);
			error += checkValue(ME_CMND,gly_ME_CMND,feedback_ME_CMND,me.cmndSo);
			error += checkValue(ME_NOICAP,gly_ME_NOICAP,feedback_ME_NOICAP,me.cmndNoiCap);
			error += checkValue(ME_NGAYCAP,gly_ME_NGAYCAP,feedback_ME_NGAYCAP,me.cmndNgayCap);
			error += checkValue(ME_DANTOC,gly_ME_DANTOC,feedback_ME_DANTOC,me.danToc);
			error += checkValue(ME_QUOCTICH,gly_ME_QUOCTICH,feedback_ME_QUOCTICH,me.quocTich);
			error += checkValue(ME_THANHPHO,gly_ME_THANHPHO,feedback_ME_THANHPHO,me.thanhPho);
			error += checkValue(ME_QUAN,gly_ME_QUAN,feedback_ME_QUAN,me.quan);
			error += checkValue(ME_PHUONG,gly_ME_PHUONG,feedback_ME_PHUONG,me.phuong);
			error += checkValue(ME_DIACHI,gly_ME_DIACHI,feedback_ME_DIACHI,me.diachi);
			if(error !== ""){
				var temp = "Những thông tin nhập sai phần người mẹ : \n" + error;
				$("#ME_ERROR").val(temp);
				console.log(temp);
				alert(temp);
				return;
			}
			$("#ME_ERROR").val("Completed");
			console.log("Hoàn thành");
			alert("Hoàn thành");
		},
		error: function (err) {
			$("#ME_ERROR").val("Error");
            alert("Error: Không tìm thấy công dân");
        }
	})
}

function checkCha(){
	var cmndCha = $("#CHA_CMND").val();
	console.log("CMND Cha : " + cmndCha);
	$.ajax({
		method : "POST",
		data : {
			cmnd : cmndCha,
		},
		url : "HoSoDangKy/getInfo1",
		success : function(data) {
			console.log(data);
			var cha = JSON.parse(data);
			console.log(cha)
			var error = "";
			error += checkValue(CHA_HOVATEN,gly_CHA_HOVATEN,feedback_CHA_HOVATEN,cha.hoVaTen);
			error += checkValue(CHA_NGAYSINH,gly_CHA_NGAYSINH,feedback_CHA_NGAYSINH,cha.ngaySinh);
			error += checkValue(CHA_CMND,gly_CHA_CMND,feedback_CHA_CMND,cha.cmndSo);
			error += checkValue(CHA_NOICAP,gly_CHA_NOICAP,feedback_CHA_NOICAP,cha.cmndNoiCap);
			error += checkValue(CHA_NGAYCAP,gly_CHA_NGAYCAP,feedback_CHA_NGAYCAP,cha.cmndNgayCap);
			error += checkValue(CHA_DANTOC,gly_CHA_DANTOC,feedback_CHA_DANTOC,cha.danToc);
			error += checkValue(CHA_QUOCTICH,gly_CHA_QUOCTICH,feedback_CHA_QUOCTICH,cha.quocTich);
			error += checkValue(CHA_THANHPHO,gly_CHA_THANHPHO,feedback_CHA_THANHPHO,cha.thanhPho);
			error += checkValue(CHA_QUAN,gly_CHA_QUAN,feedback_CHA_QUAN,cha.quan);
			error += checkValue(CHA_PHUONG,gly_CHA_PHUONG,feedback_CHA_PHUONG,cha.phuong);
			error += checkValue(CHA_DIACHI,gly_CHA_DIACHI,feedback_CHA_DIACHI,cha.diachi);
			if(error !== ""){
				var temp = "Những thông tin nhập sai phần người cha : \n" + error;
				$("#CHA_ERROR").val(temp);
				console.log(temp);
				alert(temp);
				return;
			}
			$("#CHA_ERROR").val("Completed");
			console.log("Hoàn thành");
			alert("Hoàn thành");
		},
		error: function (err) {
			$("#CHA_ERROR").val("Error");
            alert("Error: Không tìm thấy công dân");
        }
	})
}

function checkQuanHe(){
	setDefault(NYC_QUANHE,gly_NYC_QUANHE,feedback_NYC_QUANHE);
	setDefault(NYC_QUANHEKHAC,gly_NYC_QUANHEKHAC,feedback_NYC_QUANHEKHAC);
	var result = "";
	var message =  "";
	if(NYC_QUANHE.value == "" && NYC_QUANHEKHAC == ""){
		result = "* Công dân đã để trống";
	}
	$("#error_NYC_QUANHE").html(result);
	$("#error_NYC_QUANHEKHAC").html(result);
	if (result == "") {
		if(NYC_QUANHE.value == ""){
			AddClass(NYC_QUANHEKHAC, " fild_success");
			AddClass(gly_NYC_QUANHEKHAC," glyphicon-ok");
			AddClass(feedback_NYC_QUANHEKHAC," has-success");
		}
		else{
			AddClass(NYC_QUANHE, " fild_success");
			AddClass(gly_NYC_QUANHE," glyphicon-ok");
			AddClass(feedback_NYC_QUANHE," has-success");
		}
		
		message = "";
		return message;
	}
	else{
		AddClass(NYC_QUANHE, " fild_error");
		AddClass(gly_NYC_QUANHE," glyphicon-remove");
		AddClass(feedback_NYC_QUANHE," has-error");
		
		AddClass(NYC_QUANHEKHAC, " fild_error");
		AddClass(gly_NYC_QUANHEKHAC," glyphicon-remove");
		AddClass(feedback_NYC_QUANHEKHAC," has-error");
		
		message = "- Để trống quan hệ ; \n";
		return message;
	}
}

function setDefault(x,gly,feedback){
	RemoveClass(x,"fild_success");
	RemoveClass(x,"fild_error");
	RemoveClass(gly,"glyphicon-remove");
	RemoveClass(gly,"glyphicon-ok");
	RemoveClass(feedback,"has-error");
	RemoveClass(feedback,"has-success");
}

function checkValue(x,gly,feedback,value){
	setDefault(x,gly,feedback);
	var result = "";
	var message =  "";
	if (x.value == "" || x.value == undefined) {
		result = "* Công dân đã để trống";
	} else {
		if (x.value !== value) {
			result = "* Nhập sai";
		}
	}
	var id_error = "#error_" + x.id;
	$(id_error).html(result);
	if (result == "") {
		AddClass(x, " fild_success");
		AddClass(gly," glyphicon-ok");
		AddClass(feedback," has-success")
		
		message = "";
		return message;
	}
	else{
		AddClass(x, " fild_error");
		AddClass(gly," glyphicon-remove");
		AddClass(feedback," has-error");
		
		var name = x.id.split("_");
		switch(name[1]) {
	    case "HOVATEN":
	        return message = "- Họ và tên ; \n";
	    case "NGAYSINH":
	        return message = "- Ngày sinh ; \n";
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

function acceptDinhKem(){
	$("#DINHKEM_ERROR").val("Completed");
	alert("Kiểm duyệt xong Đính kèm");
}

function acceptKhaiSinh(){
	$("#KS_ERROR").val("Completed");
	alert("Kiểm duyệt xong Đối tượng khai sinh");
}

function ignoreKhaiSinh(){
	$("#KS_ERROR").val("Error");
	alert("Từ chối đối tượng khai sinh");
}

function ignoreDinhKem(){
	$("#DINHKEM_ERROR").val("Error");
	alert("Từ chối dính kèm");
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