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
      <li role="presentation"><a href="/putDummyIntoDB">Home</a></li>
      <li role="presentation" class="active"><a href="#">AddData</a></li>
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
	
		<form:form id="insertForm" method = "POST" action = "/putDummyIntoDB/addData" modelAttribute="rowData" acceptCharset="UTF-8">
			<h3>TABLE:<c:out value="${rowData.tableName}"/></h3>
			<input type="hidden" id="tableName" name="tableName" value="${rowData.tableName}"/>
			<p>
			<button id ="manualButton" class="btn btn-sm btn-success" data-toggle="modal" data-target="#manual" type="button" >Manual</button>
			<button id ="showData" class="btn btn-sm btn-success" type="button" >Show Data</button> 
			</p>
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
				<tr class="bg-white" data-toggle="tooltip" title="${field.comments}">
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
						value="Y"/>
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
			<button id ="insertButton" class="btn btn-sm btn-success" type="button" >Insert Data</button>
			
		</form:form>
	</c:if>
	</div>
</div>

	
</div>


<!-- Modal -->
<div class="modal fade" id="manual" role="dialog">
    <div class="modal-dialog">    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Manual</h4>
        </div>
        <div class="modal-body">
        <ul>
        	<li>
        		<p>AutoGenId ติ๊กเลือกเพื่อให้ระบบสร้าง KeyId ให้ </p>
          		<p>โดยข้อมูล ตัวอย่างที่ได้คือ 000068d1-f2e4-4953-b1c9-953e929aa777</p>
        	</li>
        	<li>
        		<p>MultiRow ติ๊กเลือกเพื่อให้ระบบแยกสร้างข้อมูลหลายแถว </p>
          		<p>โดยข้อมูลตัวอย่างที่ต้องกรอกคือ xxx1,xxxx2</p>
          		<p>ระบบจะแบ่งจำนวนแถวข้อมูลตามเครื่องหมาย  ","</p>
        	</li>
        </ul>
          
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
</div>

<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/resources/core/js/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script type="text/javascript">

function display(data) {
	alert(JSON.stringify(data));
	var json = JSON.stringify(data, null, 4) ;
	alert(json);
}

function getData(){
	
	var tableName = $('#tableName').val();
	var data = {"tableName":"Test"}
	$.ajax({
		type : "GET",
		contentType : "application/json",
		url : "/putDummyIntoDB/getData",
		data : {"tableName":tableName},
		dataType : 'json',
		timeout : 100000,
		success : function(data) {
			console.log("SUCCESS: ", data);
			
			display(data);
		},
		error : function(e) {
			console.log("ERROR: ", e);
			display(e);
			
		},
		done : function(e) {
			console.log("DONE");
			//enableSearchButton(true);
		}
	});
}

	$(document).ready(function(){
		$('[data-toggle="tooltip"]').tooltip();   
		 
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
		
		$("#insertButton").click(function() {
           $("#insertForm").submit();
       	});
		
		
		$("#showData").click(function() {
			getData();
			
		});
		

	});
	
	
</script>
</body>
</html>