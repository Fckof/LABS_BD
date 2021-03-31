 <?php 
	$userRoot = "root";
	$passRoot = "root";
	$servername="localhost";
	$database="gamedev";

$conn = new mysqli($servername, $userRoot, $passRoot, $database) or die("Не подрубилось...");

$result=$conn->query("SELECT `должности`.`Название должности` AS `должность`, Sum(`команда проекта`.`Оклад за этап`) AS `зарплата`
FROM (`должности` INNER JOIN `исполнители` ON `должности`.`ID должности` = `исполнители`.`ID должности`) INNER JOIN `команда проекта` ON `исполнители`.`ID исполнителя` = `команда проекта`.`ID исполнителя`
GROUP BY `должность` ORDER BY Sum(`команда проекта`.`Оклад за этап`) DESC ");

if (count($result)==0){
		print "Нет записей";
	}
	$dataY=array(array());
	$dataX=array();

	//print "<table border='1'bordercolor='grey' style='color:black;font-size:25px;margin:15px auto;border:0 solid grey;'><th>Компания разработчик</th><th>Затраты</th>";
$num=0;
$dataY[0]=array("Должности","Зарплаты");
	while ($row=$result->fetch_assoc()) {
		 //print "<tr><td>".$row["должность"]."</td><td>".$row["зарплата"]."</td></tr>";
		$dataY[]=array($row["должность"], (int)$row["зарплата"]);
		//$dataX[]=$row["должность"];
			$num++;
			}

	//  print "</table>";
	// for($i=0;$i<$num;$i++){
	// 	echo var_dump($dataY[$i]);
	// }
	echo "<script> table=".json_encode($dataY).";</script>";
			//echo $num;
$conn->close();
 ?>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<script type="text/javascript" src="loader.js"></script>

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
	<script type="text/javascript">
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
    </script>
</head>
<body>
	<div class="form">
		<div class="form-header">
			<h1>Отчет о самых оплачиваемых должностях</h1>
			<p> <?php print date("d F Y г.")."<br>".date("h:m:s"); ?> </p>
		</div>
		<div id="top_x_div" style="width: 900px; height: 450px;margin: 20px auto;"></div>
	</div>
</body>
</html>