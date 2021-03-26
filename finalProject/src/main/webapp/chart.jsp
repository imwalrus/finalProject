<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!--Load the AJAX API-->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	// Load the Visualization API and the corechart package.
	google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});

	// Set a callback to run when the Google Visualization API is loaded.
	google.charts.setOnLoadCallback(drawChart);

	// Callback that creates and populates a data table,
	// instantiates the pie chart, passes in the data and
	// draws it.
	function drawChart() {

		// Create the data table.
		var data = new google.visualization.DataTable();
		data.addColumn('string', '날짜');
		data.addColumn('number', '판매량');

		var arr = [];
		// ajax 이용
		$.ajax({
			url : "getChartData",
			async : false,
			dataType : "JSON",
			success : function(results) {
				for(var result of results) {
					arr.push([result.SALE_DATE, result.SALES]);
				}
			}
		});
		data.addRows(arr);

		// Set chart options
		var options = {
			'title' : '일별 판매량',
			'width' : 700,
			'height' : 600,
			'colors' : ['#e0440e', '#e6693e', '#ec8f6e', '#f3b49f', '#f6c7b6'],
	        'vAxis' : { format : "￦ #,###", gridlines: { count: 10 } }
		};

		// Instantiate and draw our chart, passing in some options.
		var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
		chart.draw(data, options);
	}
</script>
</head>

<body>
	<!--Div that will hold the pie chart-->
	<div id="chart_div"></div>
</body>
</html>