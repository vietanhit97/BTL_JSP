<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Cập Nhật Danh Mục</h3>
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
			<form action="UpdateCategory" method="POST" role="form">
				<div class="form-group">
					<label for="">Id:</label> <input type="text" class="form-control"
						name="catId" placeholder="Nhập ID Danh Mục" value="${c.catId}" required="required" readonly="readonly">
				</div>
				<div class="form-group">
					<label for="">Tên Danh Mục:</label> <input type="text" value="${c.catname }"
						class="form-control" name="catname"
						placeholder="Nhập Tên Danh Mục" required="required">
				</div>
				<div class="form-group">
					<label for="">Số Lượng:</label> <input type="text"
						class="form-control" name="counts" placeholder="Nhập Số Lượng" value="${c.counts }">
				</div>
				<button type="submit" class="btn btn-primary">Cập Nhật Mới</button>
			</form>
		</div>
		<!-- /.box-body -->
		<div class="box-footer">Footer</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>