<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="resources/main/css/style.css">
<style>
.table th{
background-color: #c3e6cb;
font-weight: bold;
}
</style>
</head>


<body>

	<!-- 모달바디 시작 -->
	<div class="modal-body">
			<div class="card-body" align="center">
				<button type="button" class="btn  btn-success"
				value="Print" onclick="javascript:printIt(document.getElementById('printme').innerHTML)">출력</button>
				<br>
					<div id="printme">
						<img src="resources/img/bongsaFile.jpg">
					</div>
			</div>
	</div>
	<!-- 모달바디 끝 -->
	
	<!-- Required Js -->
	<script src="resources/admin/js/vendor-all.min.js"></script>
	<script src="resources/admin/js/plugins/bootstrap.min.js"></script>
	<script src="resources/admin/js/ripple.js"></script>
	<script src="resources/admin/js/pcoded.min.js"></script>
	<script type="text/javascript">
	function printIt(printThis)
	{
	    var win = null;
	    win = window.open();
	    self.focus();
	    win.document.open();
	    win.document.write(printThis);
	    win.document.close();
	    win.print();
	    win.close();
	}
	</script>
</body>
</html>