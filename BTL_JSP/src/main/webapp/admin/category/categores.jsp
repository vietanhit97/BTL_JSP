<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Quản Lý Danh Mục</h3>
			<form action="${pageContext.request.contextPath}/SearchCategores"
				method="post" class="form-inline" role="form">
				<div class="form-group">
					<input type="text" name="key" class="form-control" id=""
						placeholder="Tìm kiếm">
				</div>
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
				<a
					href="${pageContext.request.contextPath}/admin/category/insertCategory.jsp"
					class="btn btn-success btn-sm">Thêm Mới Danh Mục </a>
			</form>
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
						<th>Tên Danh Mục</th>
						<th>Số lượng</th>
						<th></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${list}" var="c">
						<tr>
							<td>${c.catId }</td>
							<td>${c.catname }</td>
							<td>${c.counts }</td>
							<td><a
								href="${pageContext.request.contextPath}/DeleteCategory?id=${c.catId}"
								class="btn btn-danger btn-sm"
								onclick="return confirm('Bạn có muốn xóa không ?')">Xóa</a> <a
								href="${pageContext.request.contextPath}/PreUpdateCategory?id=${c.catId}"
								class="btn btn-success btn-sm">Cập Nhật</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- /.box-body -->
		<div class="box-footer text-center">
			<nav aria-label="Page navigation ">
				<ul class="pagination">
					<c:forEach begin="1" end="${endPage}" var="i">
						<li class="page-item"><a class="page-link" id="${i}"
							href="${pageContext.request.contextPath}/ListCategory?index=${i}">${i}</a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>