<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
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
    
</head>
<body>
<br>
<div class="container">
<div class="header clearfix">
  <nav>
    <ul class="nav nav-pills pull-right">
      <li role="presentation" class="active"><a href="#">Home</a></li>
      <!-- <li role="presentation"><a href="#">About</a></li>
      <li role="presentation"><a href="#">Contact</a></li> -->
    </ul>
  </nav>
  <h3 class="text-muted">PUT DATA INTO DATABASE</h3>
</div>

<form id="myForm" method = "GET" action = "/putDummyIntoDB/getFields" >
<div class="jumbotron">
  <h3>Search Table</h3>
  <p>
  <div class="input-group">
    <span class="input-group-addon">Table</span>
    <input id="tableName" type="text" class="form-control" name="tableName" placeholder="TableName">
  </div>
  </p>
  <p>
  	<button id ="myButton" class="btn btn-sm btn-success" type="button" >Search</button>
  </p>
</div>
</form>
</div>

<spring:url value="/resources/core/js/bootstrap.min.js" var="bootstrapJs" />
<spring:url value="/resources/core/js/jquery.min.js" var="jqueryJs" />
<script src="${jqueryJs}"></script>
<script src="${bootstrapJs}"></script>
<script type="text/javascript">
	$(document).ready(function(){
	 	$("#myButton").click(function() {
	 	    $("#myForm").submit();
       	});
	 	
	 	$("#tableName").keyup(function() {
	 	   $(this).val( $(this).val().toUpperCase());
       	});
	 	
	});
</script>
</body>
</html>