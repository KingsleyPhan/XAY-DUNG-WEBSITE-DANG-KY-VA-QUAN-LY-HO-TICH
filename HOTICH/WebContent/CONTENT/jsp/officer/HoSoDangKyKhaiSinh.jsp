<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<div class="row">
        <div class="paper">
			<div class="title">
				<p>TỜ KHAI ĐĂNG KÝ GIẤY KHAI SINH</p>
            </div>
            <div class="row" style="">
				<div class="container container-paper">
					<div class="part-content">
						<div class="title-part">
							<div class="col-12 col-sm-6 col-md-6">
								<p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI YÊU CẦU</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
								<button class="btn btn-success check" onClick="checkNgYeuCau()"><i class="glyphicon glyphicon-pencil"></i> Kiểm duyệt</button>
	                        </div>
	                        <input type="hidden" name="NYC_ERROR" id="NYC_ERROR" value="">
                        </div>
                        <div class="content">
							<div class="row">
								<div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for=>Họ và Tên</label>
										<div id="feedback_NYC_HOVATEN" class="form-group has-feedback">
											<input type="text" disabled name="NYC_HOVATEN" class="form-control" id="NYC_HOVATEN" value='<c:out value='${khaisinh.getNgYeuCau().getHoVaTen()}'></c:out>'>
											<span id="gly_NYC_HOVATEN" class="glyphicon form-control-feedback"></span>
										</div>
                                        <p class="error" id="error_NYC_HOVATEN"></p>
                                    </div>
                                </div>
							</div>
                            <div class="row">
								<div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
									<label for="NYC_CMND">Số CMND</label>
										<div id="feedback_NYC_CMND" class="form-group has-feedback">
											<input type="text" disabled name="NYC_CMND" class="form-control" id="NYC_CMND" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getSo()}'></c:out>'>
											<span id="gly_NYC_CMND" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_CMND"></p>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for="NYC_NOICAP">Nơi cấp</label>
										<div id="feedback_NYC_NOICAP" class="form-group has-feedback">
											<input type="text" disabled name="NYC_NOICAP" class="form-control" id="NYC_NOICAP" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getNoiCap()}'></c:out>'>
											<span id="gly_NYC_NOICAP" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_NOICAP"></p>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for="NYC_NGAYCAP">Ngày cấp</label>
                                        <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
                                        <div class="bootstrap-iso">
											<div class="container-fluid">
												<div class="row">
													<div class="input-group">
														<div class="input-group-addon">
															<i class="fa fa-calendar"></i>
                                                        </div>
														<div id="feedback_NYC_NGAYCAP" class="form-group has-feedback">
															<input type="text" disabled name="NYC_NGAYCAP" class="form-control" id="NYC_NGAYCAP" value='<c:out value='${khaisinh.getNgYeuCau().getCmnd().getNgayCapString()}'></c:out>'>
															<span id="gly_NYC_NGAYCAP" class="glyphicon form-control-feedback feedback-datetime"></span>
														</div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <p class="error" id="error_NYC_NGAYCAP"></p>
									</div>
								</div>
                            </div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-4">
                                    <div class="form-group">
                                        <label for="NYC_QUANHE">Quan hệ với người được khai sinh</label>
										<c:choose>
											<c:when test="${khaisinh.getQuanHe() == 'Cha' || khaisinh.getQuanHe() == 'Me'}">
											<div id="feedback_NYC_QUANHE" class="form-group has-feedback">
												<select name="NYC_QUANHE" disabled class="form-control" id="NYC_QUANHE">
													<option>${khaisinh.getQuanHe()}</option>
		                                        </select>
		                                        <span id="gly_NYC_QUANHE" class="glyphicon form-control-feedback"></span>
		                                    </div>
											</c:when>
											<c:otherwise>
											<div id="feedback_NYC_QUANHE" class="form-group has-feedback">
												<select name="NYC_QUANHE" disabled class="form-control" id="NYC_QUANHE">
		                                        </select>
		                                    	<span id="gly_NYC_QUANHE" class="glyphicon form-control-feedback"></span>
		                                    </div>
											</c:otherwise>
										</c:choose>
                                        <p class="error" id="error_NYC_QUANHE"></p>
									</div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4">
                                    <div class="form-group">
                                        <label for="NYC_QUANHEKHAC">Quan hệ khác </label>
										<c:choose>
											<c:when test="${khaisinh.getQuanHe() != 'Cha' && khaisinh.getQuanHe() != 'Mẹ'}">
											<div id="feedback_NYC_QUANHEKHAC" class="form-group has-feedback">
												<input name="NYC_QUANHEKHAC" type="text" disabled class="form-control" id="NYC_QUANHEKHAC" value='${khaisinh.getQuanHe()}'>
												<span id="gly_NYC_QUANHEKHAC" class="glyphicon form-control-feedback"></span>
		                                    </div>
											</c:when>
											<c:otherwise>
											<div id="feedback_NYC_QUANHEKHAC" class="form-group has-feedback">
												<input name="NYC_QUANHEKHAC" type="text" disabled class="form-control" id="NYC_QUANHEKHAC" value="">
												<span id="gly_NYC_QUANHEKHAC" class="glyphicon form-control-feedback"></span>
			                                </div>
											</c:otherwise>
										</c:choose>
                                        <p class="error" id="error_NYC_QUANHEKHAC"></p>
                                    </div>
                                </div>
								<div class="col-12 col-sm-6 col-md-4">
                                    <div class="form-group">
                                        <label for="NYC_QUOCTICH">Quốc tịch </label>
										<div id="feedback_NYC_QUOCTICH" class="form-group has-feedback">
											<select name="NYC_QUOCTICH" disabled class="form-control" id="NYC_QUOCTICH">
												<option>${khaisinh.getNgYeuCau().getQuocTich()}</option>
											</select>
											<span id="gly_NYC_QUOCTICH" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_QUOCTICH"></p>
                                    </div>
                                </div>
							</div>
                            <div class="row">
                                <div class="col-12 col-sm-6 col-md-4">
                                  	<div class="form-group">
										<label for="NYC_THANHPHO">Tỉnh/TP</label>
										<div id="feedback_NYC_THANHPHO" class="form-group has-feedback">
                                        	<select name="NYC_THANHPHO" disabled class="form-control" id="NYC_THANHPHO">
                                            	<option>${khaisinh.getNgYeuCau().getDiaChi().getThanhPho() }</option>
                                            </select>
                                    		<span id="gly_NYC_THANHPHO" class="glyphicon form-control-feedback"></span>
										</div>
                                        <p class="error" id="error_NYC_THANHPHO"></p>
                                    </div>
                                </div>
                                <div class="col-12 col-sm-6 col-md-4">
                                	<div class="form-group">
                                    	<label for="NYC_QUAN">Quận/Huyện</label>
                                    	<div id="feedback_NYC_QUAN" class="form-group has-feedback">
                                        	<select name="NYC_QUAN" disabled class="form-control" id="NYC_QUAN">
		                                    	<option>${khaisinh.getNgYeuCau().getDiaChi().getQuan() }</option>
		                                    </select>
		                                    <span id="gly_NYC_QUAN" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_QUAN"></p>
									</div>
								</div>
								<div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for="">Xã/Phường</label>
										<div id="feedback_NYC_PHUONG" class="form-group has-feedback">
                                        	<select name="NYC_PHUONG" disabled class="form-control" id="NYC_PHUONG">
		                                    	<option>${khaisinh.getNgYeuCau().getDiaChi().getPhuong() }</option>
		                                    </select>
		                                    <span id="gly_NYC_PHUONG" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_PHUONG"></p>
									</div>
								</div>
                                <div class="col-12 col-sm-12 col-md-12">
                                	<div class="form-group">
                                    	<label for="NYC_DIACHI">Địa chỉ chi tiết</label>
                                    	<div id="feedback_NYC_DIACHI" class="form-group has-feedback">
                                        	<input name="NYC_DIACHI" type="text" disabled class="form-control" id="NYC_DIACHI" value='${khaisinh.getNgYeuCau().getDiaChi().getSoDuong() }'>
                                            <span id="gly_NYC_DIACHI" class="glyphicon form-control-feedback"></span>
										</div>
										<p class="error" id="error_NYC_DIACHI"></p>
                                    </div>
                                </div>
                            </div>
                      	</div>
                    </div>
                </div>
            </div>
			<div class="row">
				<div class="container container-paper">
					<div class="part-content">
						<div class="title-part">
							<div class="col-12 col-sm-6 col-md-6">
								<p style="font-size: 18px;font-weight: bold">THÔNG TIN NGƯỜI ĐƯỢC KHAI SINH</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
								<button class="btn btn-success check" onClick="acceptKhaiSinh()"><i class="glyphicon glyphicon-ok"></i> Xác nhận</button>
								<button class="btn btn-success check" onClick="ignoreKhaiSinh()"><i class="glyphicon glyphicon-remove"></i> Từ chối</button>
	                        </div>
							<input type="hidden" name="KS_ERROR" id="KS_ERROR"  value="">
						</div>
						<div class="content ">
							<div class="row">
								<div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for="KS_HOVATEN">Họ và Tên</label>
										<div class="row">
											<div id="feedback_KS_HOVATEN" class="form-group has-feedback "> <!-- div-check -->
												<input type="text" disabled name="KS_HOVATEN" class="form-control " id="KS_HOVATEN" value="<c:out value='${khaisinh.getDoiTuongKhaiSinh().getHoVaTen()}'></c:out>"> <!-- input-md-check -->
												<span id="gly_KS_HOVATEN" class="glyphicon form-control-feedback"></span>
											</div>
											<!-- <div class="example">
										    	<div id="tooltip_KS_HOVATEN" class="box" data-tooltip="Xác thực thông tin?">
										    		<input type="hidden" name="KS_HOVATEN_ERROR" id="KS_HOVATEN_ERROR" value="">
													<i class="glyphicon glyphicon-pencil"></i>
										    	</div>
									    	</div> -->
								    	</div>
										<p class="error" id="error_KS_HOVATEN"></p>
									</div>
								</div>
								<div class="col-12 col-sm-6 col-md-4">
									<div class="form-group">
										<label for="">Giới tính</label><br>
											<c:choose>
												<c:when test='${khaisinh.getDoiTuongKhaiSinh().getGioiTinh()}'>
													<div class="control-sex">
														<input type="radio" name="gender" value="1" id="male" checked disabled>Nam 
														<input style="margin-left: 20px" type="radio" name="gender" id="female" value="0" disabled>Nữ
													</div>
												</c:when>
												<c:otherwise>
												<div class="control-sex">
													<input type="radio" name="gender" value="1" id="male" disabled>Nam
				                                    <input style="margin-left: 20px" type="radio" name="gender" id="female" value="0" checked disabled>Nữ
												</div>                                               
                                                </c:otherwise>
											</c:choose>
											<p class="error" id="error_male"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_NGAYSINH">Ngày sinh</label>
											<div class="row">
											<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
												<div class="bootstrap-iso">
													<div class="container-fluid">
														<div class="row">
															<div class="input-group">
																<div class="input-group-addon">
																	<i class="fa fa-calendar"> </i>
																</div>
																<div id="feedback_KS_NGAYSINH" class="form-group has-feedback "> <!-- div-check -->
																	<input class="form-control " id="KS_NGAYSINH" disabled name="KS_NGAYSINH" type="text" value='<c:out value='${khaisinh.getDoiTuongKhaiSinh().getNgaySinhString()}'></c:out>' /> <!-- input-date-check -->
																	<span id="gly_KS_NGAYSINH" class="glyphicon form-control-feedback"></span>
																</div>
																<!-- <div class="example">
															    	<div id="tooltip_KS_NGAYSINH" class="box" data-tooltip="Xác thực thông tin?">
															    		<input type="hidden" name="KS_NGAYSINH_ERROR" id="KS_NGAYSINH_ERROR" value="">
																		<i class="glyphicon glyphicon-pencil"></i>
															    	</div>
									    						</div> -->
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="error" id="error_KS_NGAYSINH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_DANTOC">Dân tộc</label>
											<select name="KS_DANTOC" class="form-control" id="KS_DANTOC" disabled>
												<option>${khaisinh.getDoiTuongKhaiSinh().getDanToc()}</option>
											</select>
											<p class="error" id="error_KS_DANTOC"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-8">
										<div class="form-group">
											<label for="">Quốc tịch </label>
											<select name="KS_QUOCTICH" class="form-control" id="KS_QUOCTICH" disabled>
												<option>${khaisinh.getDoiTuongKhaiSinh().getQuocTich()}</option>
											</select>
											<p class="error" id="error_KS_QUOCTICH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_THANHPHO">Tỉnh/TP</label>
											<select name="KS_THANHPHO" disabled class="form-control" id="KS_THANHPHO">
												<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getThanhPho() }</option>
											</select>
											<p class="error" id="error_KS_THANHPHO"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_QUAN">Quận/Huyện</label>
											<select name="KS_QUAN" disabled class="form-control" id="KS_QUAN">
												<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getQuan() }</option>
											</select>
											<p class="error" id="error_KS_QUAN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="">Xã/Phường</label>
											<select name="KS_PHUONG" disabled class="form-control" id="KS_PHUONG">
												<option>${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getPhuong() }</option>
											</select>
											<p class="error" id="error_KS_PHUONG"></p>
										</div>
									</div>
									<div class="col-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="KS_DIACHI">Địa chỉ chi tiết</label>
											<input name="KS_DIACHI" type="text" disabled class="form-control" id="KS_DIACHI" value='${khaisinh.getDoiTuongKhaiSinh().getQueQuanKhaiSinh().getSoDuong() }'>
											<p class="error" id="error_KS_DIACHI"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-12 col-md-6">
										<div class="form-group">
											<label for="KS_CSSS">Cơ sở y tế sinh sản</label>
											<input name="KS_CSSS" type="text" class="form-control" id="KS_CSSS" value='${khaisinh.getNoiSinh().getTenCoSoYTe() }' disabled>
											<p class="error" id="error_KS_CSSS"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-6">
										<div class="form-group">
											<label for="KS_CSSS_QUOCGIA">Quốc gia </label>
											<select name="KS_CSSS_QUOCGIA" class="form-control" id="KS_CSSS_QUOCGIA" disabled>
												<option>${khaisinh.getNoiSinh().getDiaChi().getQuocGia() }</option>
											</select>
											<p class="error" id="error_KS_CSSS_QUOCGIA"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_CSSS_THANHPHO">Tỉnh/TP</label>
											<select name="KS_CSSS_THANHPHO" disabled class="form-control" id="KS_CSSS_THANHPHO">
												<option>${khaisinh.getNoiSinh().getDiaChi().getThanhPho() }</option>
											</select>
											<p class="error" id="error_KS_CSSS_THANHPHO"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="KS_CSSS_QUAN">Quận/Huyện</label>
											<select name="KS_CSSS_QUAN" disabled class="form-control" id="KS_CSSS_QUAN">
												<option>${khaisinh.getNoiSinh().getDiaChi().getQuan() }</option>
											</select>
											<p class="error" id="error_KS_CSSS_QUAN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="">Xã/Phường</label>
											<select name="KS_CSSS_PHUONG" disabled class="form-control" id="KS_CSSS_PHUONG">
												<option>${khaisinh.getNoiSinh().getDiaChi().getPhuong() }</option>
											</select>
											<p class="error" id="error_KS_CSSS_PHUONG"></p>
										</div>
									</div>
									<div class="col-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="KS_CSSS_DIACHI">Địa chỉ chi tiết</label>
											<input name="KS_CSSS_DIACHI" type="text" disabled class="form-control" id="KS_CSSS_DIACHI" value='${khaisinh.getNoiSinh().getDiaChi().getSoDuong() }'>
											<p class="error" id="error_KS_CSSS_DIACHI"></p>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

			<div class="row">
				<div class="container container-paper">
					<div class="part-content">
						<div class="title-part">
							<div class="col-12 col-sm-6 col-md-6">
								<p style="font-size: 18px; font-weight: bold">THÔNG TIN CỦA MẸ</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6"
								style="text-align: right; height: 100%">
								<c:choose>
									<c:when test='${khaisinh.getMe() == null }'>
										<input type="checkbox" data-toggle="collapse" data-target="#ME" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" checked disabled>
										<label style="margin: auto">Không có</label>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success check" onClick="checkMe()"><i class="glyphicon glyphicon-pencil"></i> Kiểm duyệt</button>
										<input type="hidden" name="ME_ERROR" id="ME_ERROR"  value="">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<c:if test='${khaisinh.getMe() != null }'>
							<div class="content collapse in" id="ME">
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for=>Họ và Tên</label>
											<div id="feedback_ME_HOVATEN" class="form-group has-feedback">
												<input name="ME_HOVATEN" type="text" class="form-control" id="ME_HOVATEN" value='${khaisinh.getMe().getHoVaTen() }' disabled>
												<span id="gly_ME_HOVATEN" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_HOVATEN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_NGAYSINH">Ngày sinh</label>
											<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
											<div class="bootstrap-iso">
												<div class="container-fluid">
													<div class="row">
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"> </i>
															</div>
															<div id="feedback_ME_NGAYSINH" class="form-group has-feedback">
																<input name="ME_NGAYSINH" class="form-control" id="ME_NGAYSINH" type="text" value='${khaisinh.getMe().getNgaySinhString() }' disabled />
																<span id="gly_ME_NGAYSINH" class="glyphicon form-control-feedback feedback-datetime"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="error" id="error_ME_NGAYSINH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_CMND">Số CMND</label>
											<div id="feedback_ME_CMND" class="form-group has-feedback">
												<input name="ME_CMND" type="text" class="form-control" id="ME_CMND" value='${khaisinh.getMe().getCmnd().getSo() }' disabled>
												<span id="gly_ME_CMND" class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<p class="error" id="error_ME_CMND"></p>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_NOICAP">Nơi cấp</label>
											<div id="feedback_ME_NOICAP" class="form-group has-feedback">
												<input name="ME_NOICAP" type="text" class="form-control" id="ME_NOICAP" value='${khaisinh.getMe().getCmnd().getNoiCap() }' disabled>
												<span id="gly_ME_NOICAP" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_NOICAP"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_NGAYCAP">Ngày cấp</label>
											<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
											<div class="bootstrap-iso">
												<div class="container-fluid">
													<div class="row">
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"> </i>
															</div>
															<div id="feedback_ME_NGAYCAP" class="form-group has-feedback">
																<input name="ME_NGAYCAP" class="form-control" id="ME_NGAYCAP" type="text" value='${khaisinh.getMe().getCmnd().getNgayCapString() }' disabled />
																<span id="gly_ME_NGAYCAP" class="glyphicon form-control-feedback feedback-datetime"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="error" id="error_ME_NGAYCAP"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_DANTOC">Dân tộc</label>
											<div id="feedback_ME_DANTOC" class="form-group has-feedback">
												<select name="ME_DANTOC" class="form-control" id="ME_DANTOC" disabled>
													<option>${khaisinh.getMe().getDanToc() }</option>
												</select>
												<span id="gly_ME_DANTOC" class="glyphicon form-control-feedback"></span>
											</div>
											
											<p class="error" id="error_ME_DANTOC"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_QUOCTICH">Quốc tịch </label>
											<div id="feedback_ME_QUOCTICH" class="form-group has-feedback">
												<select name="ME_QUOCTICH" class="form-control" id="ME_QUOCTICH" disabled>
													<option>${khaisinh.getMe().getQuocTich() }</option>
												</select>
												<span id="gly_ME_QUOCTICH" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_QUOCTICH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_THANHPHO">Tỉnh/TP</label>
											<div id="feedback_ME_THANHPHO" class="form-group has-feedback">
												<select name="ME_THANHPHO" disabled class="form-control" id="ME_THANHPHO" disabled>
													<option>${khaisinh.getMe().getDiaChi().getThanhPho() }</option>
												</select>
												<span id="gly_ME_THANHPHO" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_THANHPHO"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_QUAN">Quận/Huyện</label>
											<div id="feedback_ME_QUAN" class="form-group has-feedback">
												<select name="ME_QUAN" disabled class="form-control" id="ME_QUAN" disabled>
													<option>${khaisinh.getMe().getDiaChi().getQuan() }</option>
												</select>
												<span id="gly_ME_QUAN" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_QUAN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="ME_PHUONG">Xã/Phường</label>
											<div id="feedback_ME_PHUONG" class="form-group has-feedback">
												<select name="ME_PHUONG" disabled class="form-control" id="ME_PHUONG">
													<option>${khaisinh.getMe().getDiaChi().getPhuong() }</option>
												</select>
												<span id="gly_ME_PHUONG" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_PHUONG"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="">Địa chỉ chi tiết</label>
											<div id="feedback_ME_DIACHI" class="form-group has-feedback">
												<input name="ME_DIACHI" type="text" disabled class="form-control" id="ME_DIACHI" value='${khaisinh.getMe().getDiaChi().getSoDuong() }'>
												<span id="gly_ME_DIACHI" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_ME_DIACHI"></p>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<!-- ------------------------------- -->
					</div>
				</div>
			</div>

			<div class="row">
				<div class="container container-paper">
					<div class="part-content">
						<div class="title-part">
							<div class="col-12 col-sm-6 col-md-6">
								<p style="font-size: 18px; font-weight: bold">THÔNG TIN CỦA CHA</p>
							</div>
							<div class="col-12 col-sm-6 col-md-6"
								style="text-align: right; height: 100%">
								<c:choose>
									<c:when test='${khaisinh.getCha() == null }'>
										<input type="checkbox" data-toggle="collapse" data-target="#CHA" class="form-check-input" id="nam_check_yeucau" style="bottom: 0px;" checked disabled>
										<label style="margin: auto">Không có</label>
									</c:when>
									<c:otherwise>
										<button class="btn btn-success check" onClick="checkCha()"><i class="glyphicon glyphicon-pencil"></i> Kiểm duyệt</button>
										<input type="hidden" name="CHA_ERROR" id="CHA_ERROR"  value="">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<c:if test='${khaisinh.getCha() != null }'>
							<div class="content collapse in" id="CHA">
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for=>Họ và Tên</label>
											<div id="feedback_CHA_HOVATEN" class="form-group has-feedback">
												<input name="CHA_HOVATEN" type="text" class="form-control" id="CHA_HOVATEN" value='${khaisinh.getCha().getHoVaTen() }' disabled>
												<span id="gly_CHA_HOVATEN" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_HOVATEN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_NGAYSINH">Ngày sinh</label>
											<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
											<div class="bootstrap-iso">
												<div class="container-fluid">
													<div class="row">
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"> </i>
															</div>
															<div id="feedback_CHA_NGAYSINH" class="form-group has-feedback">
																<input name="CHA_NGAYSINH" class="form-control" id="CHA_NGAYSINH" type="text" value='${khaisinh.getCha().getNgaySinhString() }' disabled />
																<span id="gly_CHA_NGAYSINH" class="glyphicon form-control-feedback  feedback-datetime"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="error" id="error_CHA_NGAYSINH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_CMND">Số CMND</label>
											<div id="feedback_CHA_CMND" class="form-group has-feedback">
												<input name="CHA_CMND" type="text" class="form-control" id="CHA_CMND" value='${khaisinh.getCha().getCmnd().getSo() }' disabled>
												<span id="gly_CHA_CMND" class="glyphicon form-control-feedback"></span>
											</div>
										</div>
										<p class="error" id="error_CHA_CMND"></p>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_NOICAP">Nơi cấp</label>
											<div id="feedback_CHA_NOICAP" class="form-group has-feedback">
												<input name="CHA_NOICAP" type="text" class="form-control" id="CHA_NOICAP" value='${khaisinh.getCha().getCmnd().getNoiCap() }' disabled>
												<span id="gly_CHA_NOICAP" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_NOICAP"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_NGAYCAP">Ngày cấp</label>
											<!-- HTML Form (wrapped in a .bootstrap-iso div) -->
											<div class="bootstrap-iso">
												<div class="container-fluid">
													<div class="row">
														<div class="input-group">
															<div class="input-group-addon">
																<i class="fa fa-calendar"> </i>
															</div>
															<div id="feedback_CHA_NGAYCAP" class="form-group has-feedback">
																<input name="CHA_NGAYCAP" class="form-control" id="CHA_NGAYCAP" type="text" value='${khaisinh.getCha().getCmnd().getNgayCapString() }' disabled />
																<span id="gly_CHA_NGAYCAP" class="glyphicon form-control-feedback  feedback-datetime"></span>
															</div>
														</div>
													</div>
												</div>
											</div>
											<p class="error" id="error_CHA_NGAYCAP"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_DANTOC">Dân tộc</label>
											<div id="feedback_CHA_DANTOC" class="form-group has-feedback">
												<select name="CHA_DANTOC" class="form-control" id="CHA_DANTOC" disabled>
													<option>${khaisinh.getCha().getDanToc() }</option>
												</select>
												<span id="gly_CHA_DANTOC" class="glyphicon form-control-feedback"></span>
											</div>
											
											<p class="error" id="error_CHA_DANTOC"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_QUOCTICH">Quốc tịch </label>
											<div id="feedback_CHA_QUOCTICH" class="form-group has-feedback">
												<select name="CHA_QUOCTICH" class="form-control" id="CHA_QUOCTICH" disabled>
													<option>${khaisinh.getCha().getQuocTich() }</option>
												</select>
												<span id="gly_CHA_QUOCTICH" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_QUOCTICH"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_THANHPHO">Tỉnh/TP</label>
											<div id="feedback_CHA_THANHPHO" class="form-group has-feedback">
												<select name="CHA_THANHPHO" disabled class="form-control" id="CHA_THANHPHO" disabled>
													<option>${khaisinh.getCha().getDiaChi().getThanhPho() }</option>
												</select>
												<span id="gly_CHA_THANHPHO" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_THANHPHO"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_QUAN">Quận/Huyện</label>
											<div id="feedback_CHA_QUAN" class="form-group has-feedback">
												<select name="CHA_QUAN" disabled class="form-control" id="CHA_QUAN" disabled>
													<option>${khaisinh.getCha().getDiaChi().getQuan() }</option>
												</select>
												<span id="gly_CHA_QUAN" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_QUAN"></p>
										</div>
									</div>
									<div class="col-12 col-sm-6 col-md-4">
										<div class="form-group">
											<label for="CHA_PHUONG">Xã/Phường</label>
											<div id="feedback_CHA_PHUONG" class="form-group has-feedback">
												<select name="CHA_PHUONG" disabled class="form-control" id="CHA_PHUONG">
													<option>${khaisinh.getCha().getDiaChi().getPhuong() }</option>
												</select>
												<span id="gly_CHA_PHUONG" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_PHUONG"></p>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-12 col-sm-12 col-md-12">
										<div class="form-group">
											<label for="">Địa chỉ chi tiết</label>
											<div id="feedback_CHA_DIACHI" class="form-group has-feedback">
												<input name="CHA_DIACHI" type="text" disabled class="form-control" id="CHA_DIACHI" value='${khaisinh.getCha().getDiaChi().getSoDuong() }'>
												<span id="gly_CHA_DIACHI" class="glyphicon form-control-feedback"></span>
											</div>
											<p class="error" id="error_CHA_DIACHI"></p>
										</div>
									</div>
								</div>
							</div>
						</c:if>
						<!-- ------------------------------- -->
					</div>
				</div>
			</div>
			<c:choose>
				<c:when test="${khaisinh.getFileGiayChungSinh() != null }">
					<div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                            	<div class="title-part">
                                	<div class="col-12 col-sm-6 col-md-6">
										<p style="font-size: 18px;font-weight: bold">HỒ SƠ ĐÍNH KÈM</p>
									</div>
									
									<div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
										<!-- <button class="btn btn-success check" onClick="acceptDinhKem()"><i class="glyphicon glyphicon-ok"></i> Xác nhận</button>
										<button class="btn btn-success check" onClick="ignoreDinhKem()"><i class="glyphicon glyphicon-remove"></i> Từ chối</button> -->
				                    </div>
                                    <input type="hidden" name="DINHKEM_ERROR" id="DINHKEM_ERROR" value="">
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-upload">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Thành phần hồ sơ</th>
                                                                <th scope="col">Tập tin</th>
                                                                <th scope="col">Tải lên</th>
                                                                <th scope="col">Ghi chú</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            <tr>
                                                                <td>Giấy chứng sinh</td>
                                                                <td>GiayChungSinh.png</td>
                                                                <td><button class="btn" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-upload"></i>Xem</button></td>
                                                                <td><textarea style="width: 100%"></textarea></td>
                                                            </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>		
                    <!-- Modal -->
<div class="modal fade bd-example-modal-lg" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
      	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
        <h5 class="modal-title" id="exampleModalLabel">File đính kèm</h5>
      </div>
      <div class="modal-body" style="text-align: center;">
      <img id="giayHoTich" alt="Lỗi" height="990px" width="700px" src="${home }HoSoDangKy/getImage">
      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button> -->
        <button class="btn btn-success check" onClick="acceptDinhKem()" data-dismiss="modal"><i class="glyphicon glyphicon-ok"></i> Xác nhận</button>
		<button class="btn btn-success check" onClick="ignoreDinhKem()" data-dismiss="modal"><i class="glyphicon glyphicon-remove"></i> Từ chối</button>
      </div>
    </div>
  </div>
</div>
<!-- modal -->		
				</c:when>
				<c:otherwise>
				
					<div class="row">
                        <div class="container container-paper">
                            <div class="part-content">
                            	<div class="title-part">
                                	<div class="col-12 col-sm-6 col-md-6">
										<p style="font-size: 18px;font-weight: bold">HỒ SƠ ĐÍNH KÈM</p>
									</div>
									
									<!-- <div class="col-12 col-sm-6 col-md-6" style="text-align: right; height: 100%">
										<button class="btn btn-success check" onClick="acceptDinhKem()"><i class="glyphicon glyphicon-ok"></i> Xác nhận</button>
										<button class="btn btn-success check" onClick="ignoreDinhKem()"><i class="glyphicon glyphicon-remove"></i> Từ chối</button>
				                    </div> -->
                                    <input type="hidden" name="DINHKEM_ERROR" id="DINHKEM_ERROR" value="Error">
                                </div>
                                <div class="content">
                                    <div class="row">
                                        <div class="col-12 col-sm-12 col-md-12">
                                            <div class="form-group">
                                                <div class="table-responsive">
                                                    <table class="table table-bordered table-upload">
                                                        <thead>
                                                            <tr>
                                                                <th scope="col">Thành phần hồ sơ</th>
                                                                <th scope="col">Tập tin</th>
                                                                <th scope="col">Tải lên</th>
                                                                <th scope="col">Ghi chú</th>
                                                            </tr>
                                                        </thead>
                                                        <!-- <tbody>
                                                            <tr>
                                                                <td>Giấy chứng sinh</td>
                                                                <td>GiayChungSinh.png</td>
                                                                <td><button class="btn" data-toggle="modal" data-target="#exampleModal"><i class="fa fa-upload" ></i>Xem</button></td>
                                                                <td><textarea style="width: 100%"></textarea></td>
                                                            </tr>
                                                        </tbody> -->
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>	
				</c:otherwise>
			</c:choose>
			
                </div>
                <!---End paper-->
                
            </div>
        </div>