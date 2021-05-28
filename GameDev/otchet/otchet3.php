 <?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";
include "../scroll.php";
$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `должности`.`Название должности` AS `должность`, Sum(`команда проекта`.`Оклад за этап`) AS `зарплата`
FROM (`должности` INNER JOIN `исполнители` ON `должности`.`ID должности` = `исполнители`.`ID должности`) INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`
GROUP BY `должность` ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC ");

if (count($result)==0){
		print "Нет записей";
	}
	//$dataY=array(array());
	$data1=array();
	$data2=array();
$num=0;
//$dataY[0]=array("Должности","Зарплаты");
	while ($row=$result->fetch_assoc()) {
		 
		// $dataY[]=array($row["должность"], (int)$row["зарплата"]);
		// 	$num++;
		$data1[]=$row["должность"];
		$data2[]=(int)$row["зарплата"];
			}

	
	// echo "<script> table=".json_encode($dataY).";</script>";

$conn->close();
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script type="text/javascript" src="package/dist/chart.js"></script>

	<style>
		body{
			background-color: #fff;
			min-height: 100vh;
			min-width: 800px;
			margin: 0;
			padding: 0;
			
		}
		/*.form{
			width: 100%;
			flex-direction: column;
			display: flex;
			align-items: center;
		}*/
		.form-header{
			width: 100%;
			background-color: rgba(0,0,200,.4);
			height: 60px;
			display: flex;
			align-items: center;
			justify-content: space-around;
		}
		.form-header h1{
			//margin: auto 0 auto 20px;
			color: black;
			font-family: sans-serif;
			font-weight: 300;
		}
		.form-header p{
			font-size: 22px;
		}
		th{
			border:none;
		}
		th{
			margin: 15px auto;
		}
	</style>
	<!-- <script type="text/javascript">
		console.log(table);
      google.charts.load('current', {'packages':['bar']});
      google.charts.setOnLoadCallback(drawStuff);

      function drawStuff() {
        var data = new google.visualization.arrayToDataTable( table);

        var options = {
          width: 900,
          legend: { position: 'none' },
          bars: 'vertical', // Required for Material Bar Charts.
          axes: {
            x: {
              0: { side: 'bottom', label: 'Самые оплачиваемые должности'} // Top x-axis.
            }
          },
          bar: { groupWidth: "90%" }
        };

        var chart = new google.charts.Bar(document.getElementById('top_x_div'));
        chart.draw(data, options);
      };
    </script> -->

    

</head>
<body>
	<div class="form">
		<div class="form-header">
			<h1>Отчет о самых оплачиваемых должностях</h1>
			<p> <?php print date("d F Y г.")."<br>".date("h:m:s"); ?> </p>
		</div>
		<canvas id="myChart" width="400" height="180"></canvas>
	</div>

	<script>
var ctx = document.getElementById('myChart').getContext('2d');
var myChart = new Chart(ctx, {
    type: 'bar',
    data: {
        labels: <?php echo json_encode($data1) ?>,
        datasets: [{
            label: 'Руб',
            data: <?php echo json_encode($data2) ?>,
            backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
        }]
    },
    options: {
        scales: {
            yAxes: [{
                ticks: {
                    beginAtZero: true
                }
            }]
        }
    }
});
</script>
</body>
</html>