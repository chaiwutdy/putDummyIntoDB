<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>   
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>PUT DATA INTO DATABASE</title>
<!-- Bootstrap core CSS -->
<spring:url value="/resources/core/css/bootstrap.min.css" var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" /> 

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<spring:url value="/resources/core/css/ie10-viewport-bug-workaround.css" var="ie10-viewport-bug-workaround" />
<link href="${ie10-viewport-bug-workaround}" rel="stylesheet">

<!-- Custom styles for this template -->
<spring:url value="/resources/core/css/jumbotron-narrow.css" var="jumbotron-narrow" />
<link href="${jumbotron-narrow}" rel="stylesheet">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->
<style type="text/css">
.bg-white {
    background-color: white;
}
</style>
</head>
<body>
<br>
<div class="container">
<div class="header clearfix">
  <nav>
    <ul class="nav nav-pills pull-right">
      <li role="presentation" class="active"><a href="/putDummyIntoDB">Home</a></li>
      <li role="presentation"><a href="#">About</a></li>
      <li role="presentation"><a href="#">Contact</a></li>
    </ul>
  </nav>
  <h3 class="text-muted">PUT DATA INTO DATABASE</h3>
</div>

<div class="jumbotron">
  <div class="container">
  <c:if test="${not empty successMsg}">

  	<div class="alert alert-success" role="alert">
	  <h4 class="alert-heading">Well done!</h4>
	  <p>Aww yeah, you successfully insert data into database</p>
	  <p class="mb-0"><c:out value="${successMsg}"></c:out></p>
	</div>
  </c:if>
  
  <c:if test="${not empty errorMsg}">
	<div class="alert alert-danger" role="alert">
	  <h4 class="alert-heading">Error!</h4>
	  <p>Oh nooo, There is Something wrong</p>
	  <p class="mb-0"><c:out value="${errorMsg}"></c:out></p>
	</div>
	
  </c:if>
	<c:if test="${not empty rowData}">
	
		<form:form id="myForm" method = "POST" action = "/putDummyIntoDB/addData" modelAttribute="rowData">
			<h3>TABLE:<c:out value="${rowData.tableName}"/></h3>
			<input type="hidden" name="tableName" value="${rowData.tableName}"/>
			<table class="table table-bordered table-hover">
				<thead class="bg-primary">
				<tr >
					<th><label>AutoGenId</label></th>
					<th><label>MultiRow</label></th>
					<th><label>ColumnName</label></th>
					<th><label>DataType</label></th>
					<th><label>DataLength</label></th>
					<th><label>Nullable</label></th>
					<th><label>DataValue</label></th>
				</tr>
				</thead>
				
				<tbody>
				<c:forEach items="${rowData.fields}" var="field" varStatus="status">
				<tr class="bg-white">
					<td align="center">
					<c:choose>
					<c:when test="${field.autoGenId == 'Y'}">
				 		<input type="checkbox" index ="${status.index}" 
						id="autoGenId_${status.index}" 
						name="fields[${status.index}].autoGenId" 
						value="Y" checked="checked"/>
				 	</c:when>
					<c:otherwise>
						<input type="checkbox" index ="${status.index}" 
						id="autoGenId_${status.index}" 
						name="fields[${status.index}].autoGenId" 
						value="Y" />
					</c:otherwise>
					</c:choose>
					</td>
					
					<td align="center">
					<c:choose>
					<c:when test="${field.multiRow == 'Y'}">
				 		<input type="checkbox" index ="${status.index}" 
						id="multiRow_${status.index}" 
						name="fields[${status.index}].multiRow" 
						value="Y" checked="checked"/>
				 	</c:when>
					<c:otherwise>
						<input type="checkbox" index ="${status.index}" 
						id="multiRow_${status.index}" 
						name="fields[${status.index}].multiRow" 
						value="Y" />
					</c:otherwise>
					</c:choose>
					</td>
					<td>
						<c:out value="${field.columnName}"/>
						<input type="hidden" name="fields[${status.index}].columnName" value="${field.columnName}"/></td>
					<td>
						<c:out value="${field.dataType}"/>
						<input type="hidden" name="fields[${status.index}].dataType" value="${field.dataType}"/></td>
					<td align="center">
						<c:out value="${field.dataLength}"/> 
						<input type="hidden" id="dataLength_${status.index}" name="fields[${status.index}].dataLength" value="${field.dataLength}"/></td>
					<td align="center">
						<c:out value="${field.nullable}"/>
						<input type="hidden" index ="${status.index}"  id="nullable_${status.index}" name="fields[${status.index}].nullable" value="${field.nullable}"/>
					</td>
					<td align="right">
					<c:choose>
					 	<c:when test="${field.multiRow == 'Y'}">
					 		<input class="form-control input-sm" 
							type="text" 
							id="dataValue_${status.index}" 
							name="fields[${status.index}].dataValue" 
							value="${field.dataDefault}"/>
					 	</c:when>
						<c:otherwise>
							<input class="form-control input-sm" 
							type="text" 
							id="dataValue_${status.index}" 
							name="fields[${status.index}].dataValue" 
							maxlength="${field.dataLength}"
							value="${field.dataDefault}"/>
						</c:otherwise>
					</c:choose>
					
				</tr>
				</c:forEach>
				</tbody>
				
			</table>
			<p>
				<button id ="myButton" class="btn btn-sm btn-success" type="button" >Insert Data</button>
			</p>
		</form:form>
	</c:if>
	</div>
</div>

</div>

<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/resources/core/js/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('[id^="nullable_"]').each(function() {
			var index = $(this).attr("index");
			if($(this).val() =='N'){
				$('#autoGenId_'+index).prop('checked',true);
				$('#dataValue_'+index).prop('disabled',true);
			}
		});
		
		
		$('[id^="autoGenId_"]').change(function() {
			var index = $(this).attr("index");
			if(this.checked) {
				$('#multiRow_'+index).prop('checked',false);
				$('#dataValue_'+index).prop('disabled',true);
		    }else{
		    	$('#dataValue_'+index).prop('disabled',false);
		    	$("#dataValue_"+index).prop('maxLength', $('#dataLength_'+index).val());
		    }
		});
		
		$('[id^="multiRow_"]').change(function() {
			var index = $(this).attr("index");
			if(this.checked) {
				$('#autoGenId_'+index).prop('checked',false);
				$('#dataValue_'+index).prop('disabled',false);
				$('#dataValue_'+index).removeAttr('maxlength');
				$('[id^="multiRow_"]').each(function(){
					if($(this).attr("index")!=index){
						$(this).prop('checked',false);
					}
				});
				
		    }else{
		    	$("#dataValue_"+index).prop('maxLength', $('#dataLength_'+index).val());
		    }
		});
		
		$("#myButton").click(function() {
           $("#myForm").submit();
       	});
		
	});
</script>
</body>
</html>