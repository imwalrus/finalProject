google.charts.load('current', {
		'packages' : [ 'corechart' ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = new google.visualization.DataTable();
		var data2 = new google.visualization.DataTable();
		var data3 = new google.visualization.DataTable();
		data.addColumn('string', '날짜');
		data.addColumn('number', '판매량');
		data2.addColumn('string', '날짜');
		data2.addColumn('number', '매출액');
		data3.addColumn('string', '날짜');
		data3.addColumn('number', '판매량');
	
		var arr = [];
		$.ajax({
			url : "weekChart",
			async : false,
			dataType : "JSON",
			success : function(results) {
				for(var result of results) {
					arr.push([result.ORDER_DATE, result.ORDER_COUNT]);
				}
			}
		});
		data.addRows(arr);	
		
		var arr = [];
		$.ajax({
			url : "weekChart",
			async : false,
			dataType : "JSON",
			success : function(results) {
				for(var result of results) {
					arr.push([result.ORDER_DATE, result.ORDER_TOTALPRICE]);
				}
			}
		});
		data2.addRows(arr);	

		var options = {
			'legend' : 'none',
			'width'  : 796.5,
			'height' : 350,
			'colors' : ['#58ACFA'],
			'vAxis'  : {gridlines: { count: 1 } }
		};
		
		var options2 = {
			'legend' : 'none',
			'width'  : 796.5,
			'height' : 350,
			'colors' : ['#58ACFA'],
			'vAxis'  : {gridlines: { count: 1 } }
		};
		
		var chart = new google.visualization.ColumnChart(document.getElementById('weekChart'));
		var chart2 = new google.visualization.LineChart(document.getElementById('weekSumChart'));
		chart.draw(data, options);
		chart2.draw(data2, options2);
}