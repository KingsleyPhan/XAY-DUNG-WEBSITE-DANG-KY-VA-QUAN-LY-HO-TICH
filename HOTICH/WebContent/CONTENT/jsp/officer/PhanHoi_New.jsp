<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:url var="home" value="/" scope="request" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>HOTICH.NET</title>
    <jsp:include page="./template/css.jsp"></jsp:include>
    <link rel="stylesheet" type="text/css" href="./CONTENT/styles/officer/PhanHoi.css">
</head>
<body>

	<div class="wrapper">
		<jsp:include page="./template/sidebar.jsp">
			<jsp:param value="1" name="mode" />
		</jsp:include>
		<div class="main-panel">
			<jsp:include page="./template/navbar.jsp"></jsp:include>
			<div class="content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-12">
							<div class="container">
								<c:if test='${message != null }'>
									<c:choose>
										<c:when test='${message == "Success" }'>
											<div class="alert alert-success alert-dismissible fade in">
											    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="right:0px;top:0px;">&times;</a>
											    <strong>Thành công!</strong> Thêm hộ tịch thành công.
											</div>
										</c:when>
										<c:otherwise>
										<div class="alert alert-danger alert-dismissible fade in">
										    <a href="#" class="close" data-dismiss="alert" aria-label="close" style="right:0px;top:0px;">&times;</a>
										    <strong>Thất bại!</strong> Thêm hộ tịch thất bại.
										</div>
										</c:otherwise>
									</c:choose>
								</c:if>	
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<h4 class="modal-title">XÁC NHẬN ĐĂNG KÝ HỘ TỊCH ONLINE</h4>
										</div>
										<div class="row">
											<div class="modal-body" style="height: auto">
												<div class="col-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="">EMAIL</label>
														<input type="text" class="form-control" id="NYC_EMAIL" name="NYC_EMAIL" style="border: 1px solid #004f7e" value="test@gmail.com" disabled>
													</div>
												</div>

												<div class="col-12 col-sm-6 col-md-6">
													<div class="form-group">
														<label for="">Số điện thoại</label>
														<input type="text" class="form-control" id="NYC_SDT" name="NYC_SDT" style="border: 1px solid #004f7e" value="0909780658" disabled>
													</div>
												</div>
												<div class="col-12 col-sm-12 col-md-12">
													<div class="form-group">
														<label for="">Phản hồi</label>
														<textarea class="form-control" rows="5" id="PHANHOI" style="border: 1px solid #004f7e"><c:out value='${content }'></c:out> </textarea>
													</div>
												</div>
											</div>
										</div>
										<div class="modal-footer">
											<button class="btn btn-primary">Trở lại</button>
											<button type="button" class="btn btn-primary" onClick="GuiPhanHoi()">Gửi phản hồi</button>
										</div>
										<!-- /.modal-content -->
										</div>
									<!-- /.modal-dialog -->
								</div>
							</div>
							<!--  -->
							<!-- Modal -->
					       	<div class="modal fade" id="myModal" role="dialog">
					        	<div class="modal-dialog">
					                <div class="modal-content">
					                    <div class="modal-header">
					                        <h4 class="modal-title">THÔNG BÁO</h4>
					                    </div>
					                    <div class="modal-body">
					                        <p>GỬI PHẢN HỒI THÀNH CÔNG</p>
											<button class="btn btn-primary" style="background-color: #004f7e" onclick="goQuanLyDangKy()">Xong</button>
					                    </div>
					                </div>
					            </div>
					        </div>
							
							<!--  -->
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="./template/footer.jsp"></jsp:include>
</body>
	<jsp:include page="./template/js.jsp"></jsp:include>
	<script src="./CONTENT/js/officer/PhanHoi.js"></script>
	<script type="text/javascript">
		$(document)
				.ready(
						function() {

							$
									.notify(
											{
												icon : 'ti-gift',
												message : "Welcome to <b>Paper Dashboard</b> - a beautiful Bootstrap freebie for your next project."

											}, {
												type : 'success',
												timer : 4000
											});

						});
	</script>
</html>