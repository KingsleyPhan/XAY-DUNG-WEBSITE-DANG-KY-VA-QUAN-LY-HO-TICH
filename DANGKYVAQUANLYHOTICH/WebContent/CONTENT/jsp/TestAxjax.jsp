<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.DriverManager"
	import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="Models.CapThanhPhoService"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="Controllers.Consts"%>
<!DOCTYPE html>
<html>
<head>


</head>
<body>
	<div class="row">
		<div class="col-sm-9">
			<%
				CapThanhPhoService ThanhPho = new CapThanhPhoService();
				ResultSet Result = ThanhPho.ShowThanhPho();
			%>
			
			<select class="form-control" onload="chgQuan()"
				onmousedown="chgQuan()" onchange="chgQuan()" id="comboCoQuan"
				name="ComboTHANHPHO">

				<%
					if (!Result.wasNull()) {
						while (Result.next()) {
				%>
				<option value="<%=Result.getString(1)%>"><%=Result.getString(3)%></option>
				<%
					}
					}
				%>
			</select>
			
			
		</div>
		<div class="col-sm-3" style="padding: 0%">

			<button class="btn-default btn-search-location"
				onmouseover="chgQuan()" onclick="return SearchCoQuan()">Tìm kiếm</button>
		</div>
	</div>
	<div id="myModal" class="modal fade" tabindex="-1" role="dialog">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h4 class="modal-title">CHỌN CƠ QUAN ĐĂNG KÝ HỘ TỊCH</h4>
						</div>
						<div class="modal-body">
							<div class="row">
								<div class="col-12 col-sm-6 col-md-6">
									<div class="form-group">
										<label for="">QUẬN/HUYỆN</label>
										
											<select class="form-control" onload="chgPhuong()" onmousedown="chgPhuong()"  onchange="chgPhuong()" id="modal-quan">
																					
											</select>
										

									</div>
								</div>

								<div class="col-12 col-sm-6 col-md-6">
									<div class="form-group">
										<label for="">XÃ/PHƯỜNG</label> <select class="form-control"
											id="modal-xaPhuong">
											
										</select>
									</div>
								</div>

							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default"
								style="background-color: #004f7e" data-dismiss="modal">Đóng</button>
							<button type="button" class="btn btn-primary"
								style="background-color: #004f7e" onclick="ChangeLocation()">Tiếp tục</button>
						</div>
					</div>
					<!-- /.modal-content -->
				</div>
				<!-- /.modal-dialog -->
			</div>
			<script>
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
			</script>
			
</body>
</html>