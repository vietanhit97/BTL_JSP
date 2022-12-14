<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<%@ include file="../layout/header.jsp"%>
<section class="content">
	<!-- Default box -->
	<div class="box">
		<div class="box-header with-border">
			<h3 class="box-title"><fmt:message bundle="${bun}" key="manageTravel"/></h3>
						<form action="${pageContext.request.contextPath}/SearchTravels" method="post" class="form-inline" role="form">
				<div class="form-group">
					<input type="text" name="key" class="form-control" 
						placeholder="<fmt:message bundle="${bun}" key="Search"/>">
				</div>
				<button type="submit" class="btn btn-primary">
					<i class="fa fa-search" aria-hidden="true"></i>
				</button>
				<a href="${pageContext.request.contextPath}/ListCategoryId" class="btn btn-success btn-sm"><fmt:message bundle="${bun}" key="theadAddNewTravel"/></a>
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
						<th><fmt:message bundle="${bun}" key="theadId"/></th>
						<th><fmt:message bundle="${bun}" key="theadNameTravel"/></th>
						<th><fmt:message bundle="${bun}" key="theadPrice"/> </th>
						<th><fmt:message bundle="${bun}" key="theadDays"/> </th>
						<th><fmt:message bundle="${bun}" key="theadCategory"/> </th>
						<th><fmt:message bundle="${bun}" key="theadDate"/></th>
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
						<td><a href="${pageContext.request.contextPath}/DeleteTravel?id=${tr.trId }" class="btn btn-danger btn-sm" onclick="return confirm('B???n c?? mu???n x??a kh??ng ?')"><fmt:message bundle="${bun}" key="theadDelete"/></a>
						<a href="${pageContext.request.contextPath}/PreUpdateTravel?id=${tr.trId }" class="btn btn-success btn-sm" ><fmt:message bundle="${bun}" key="theadUpdate"/></a>
						</td>
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
							href="${pageContext.request.contextPath}/ListTravels?index=${i}">${i}</a></li>
					</c:forEach>
				</ul>
			</nav>
		</div>
		<!-- /.box-footer-->
	</div>
	<!-- /.box -->
</section>
<%@ include file="../layout/footer.jsp"%>