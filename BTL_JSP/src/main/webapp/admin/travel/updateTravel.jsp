<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Cập Nhật Tour</h3>
			<div class="box-tools pull-right">
				<button type="button" class="btn btn-box-tool"
					data-widget="collapse" data-toggle="tooltip" title="Collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button type="button" class="btn btn-box-tool" data-widget="remove"
					data-toggle="tooltip" title="Remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>
		<div class="box-body">
			<form action="UpdateTravel" method="POST" role="form">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">Id:</label> <input type="text" class="form-control"
								name="trId" value=${tr.trId } readonly="readonly">
						</div>
						<div class="form-group">
							<label for="">Tên Tour:</label> <input type="text"
								class="form-control" name="name" placeholder="Nhập Tên Tour" value=${tr.name }>
						</div>
						<div class="form-group">
							<label for="">Giá:</label> <input type="text"
								class="form-control" name="price" placeholder="Nhập Giá Tour"
								value=${tr.price }>
						</div>
						<button type="submit" class="btn btn-primary">Cập Nhật</button>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for="">Số Ngày Tour:</label> <input type="text"
								value=${tr.days } class="form-control" name="days">
						</div>
						<div class="form-group">
							<label for="">Danh Mục Tour:</label> <select name="catId"
								id="input" class="form-control" required="required">
								<option value="">Chọn Danh Mục</option>
								<c:forEach items="${list}" var="c">
									<option value="${c.catId}">${c.catname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for="">Ngày:</label> <input type="date"
								class="form-control" name="startDate" value=${tr.startDate }>
						</div>
					</div>
				</div>
			</form>
		</div>
		<!-- /.box-body -->
		<div class="box-footer">Footer</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>