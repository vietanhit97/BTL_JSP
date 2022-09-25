<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title">Thêm Mới Tour</h3>
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
			<form action="InsertTravel" method="POST" role="form">
				<div class="row">
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadId"/>:</label> <input type="text" class="form-control"
								name="trId" placeholder="Nhập ID Tour" required="required">
						</div>
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadNameTravel"/>:</label> <input type="text"
								class="form-control" name="name" placeholder="Nhập Tên Tour"
								required="required">
						</div>
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadPrice"/>:</label> <input type="text"
								class="form-control" name="price" placeholder="Nhập Giá Tour"
								required="required">
						</div>
						<button type="submit" class="btn btn-primary"><fmt:message bundle="${bun}" key="addNew"/></button>
					</div>
					<div class="col-xs-6 col-sm-6 col-md-6 col-lg-6">
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadDays"/>:</label> <input type="text"
								required="required" class="form-control" name="days"
								placeholder="Nhập Số Ngày Tour">
						</div>
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadCategory"/> :</label> <select name="catId"
								id="input" class="form-control" required="required">
								<option value=""><fmt:message bundle="${bun}" key="selectCategory"/></option>
								<c:forEach items="${list}" var="c">
									<option value="${c.catId}">${c.catname }</option>
								</c:forEach>
							</select>
						</div>
						<div class="form-group">
							<label for=""><fmt:message bundle="${bun}" key="theadDate"/>:</label> <input type="date"
								class="form-control" name="startDate">
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>