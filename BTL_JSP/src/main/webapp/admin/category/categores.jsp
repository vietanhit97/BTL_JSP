<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Quản Lý Danh Mục</h3>
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
						<th>Name</th>
						<th>Counts</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach   items="${list}" var="c">
					<tr>
						<td>${c.catId }</td>
						<td>${c.catname }</td>
						<td>${c.counts }</td>
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