<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Quản Lý Tour</h3>
			<a href="../../ListCategoryId" class="btn btn-success btn-sm" ">Thêm Mới Tour </a>
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
			<table class="table table-hover">
				<thead>
					<tr>
						<th>Id</th>
						<th>Tên Tour</th>
						<th>Giá </th>
						<th>Số Ngày Tour </th>
						<th>Danh Mục </th>
						<th>Ngày Khời Hành </th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach  items="${list}" var="tr">
					<tr>
						<td>${tr.trId }</td>
						<td>${tr.name }</td>
						<td><fmt:formatNumber value="${tr.price}" /></td>
						<td>${tr.days }</td>
						<td>${tr.catId }</td>
							<td><fmt:formatDate value="${tr.startDate}"
							pattern="dd/MM/yyyy" /></td>
						<td><a href="../../DeleteTravel?id=${tr.trId }" class="btn btn-danger btn-sm" onclick="return confirm('Bạn có muốn xóa không ?')">Xóa</a>
						<a href="../../PreUpdateTravel?id=${tr.trId }" class="btn btn-success btn-sm" ">Cập Nhật</a>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- /.box-body -->
		<div class="box-footer">Footer</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>