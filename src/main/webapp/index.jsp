<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Insert title here</title>
	<script>
		var XHTTP  = new XMLHttpRequest();
		let agentsData = {};
		const DONE   = 4;
		const STATUS = 200;
		const APIPrestamo = "http://localhost:9090";
		const consultarPrestamo = (ruta, agentsData, callback) => {
			XHTTP.onreadystatechange = () => {
				if (XHTTP.readyState === DONE) {
					if (XHTTP.status === STATUS) {
						callback(null, JSON.parse(XHTTP.responseText));
					}
					else {
						return callback(`Error al consultar => ${ruta}`);
					}
				}
			};
			XHTTP.open("POST", ruta);
			XHTTP.setRequestHeader("Content-type", "application/json");
			XHTTP.send(agentsData);
		}
		window.addEventListener('load', function (argument) {
			document.getElementById("cotizar").addEventListener('click', function () {
				agentsData.name = document.getElementById("name").value;
				agentsData.amount = document.getElementById("amount").value;
				consultarPrestamo(`${APIPrestamo}/RestApp/services/prestamo/validar`, JSON.stringify(agentsData),function (err, rs) {
					if (rs!=undefined) {
						document.getElementById("cell1").innerHTML = rs.socio;
						document.getElementById("cell2").innerHTML = rs.cuota;
						document.getElementById("cell3").innerHTML = rs.pago;
						document.getElementById("cell4").innerHTML = rs.tasa;
					} else {
						alert('No hay socio disponible');
					}
					
				})
			});
			document.getElementById("name").value = 'sam';
			document.getElementById("amount").value = '4000000';
		});
	</script>
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Cagliostro" rel="stylesheet">
	<!-- Compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/css/materialize.min.css">

    <!-- Compiled and minified JavaScript -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0-beta/js/materialize.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
	<style>
		section div.container div.agente, section div.container div.monto {
		    margin: 0 50px;
		}
		section div.container {
			display: flex;
		    justify-content: center;
		    align-items: center;
		}
		section.table .container {
			flex-direction: column;
		}
		section.table .container > div {
			display: flex;
		    justify-content: center;
		    align-items: center;
		}
		section.table .container > div > div {
		    width: 300px;
		    height: 40px;
		    font-size: 20px;
		    padding: 6px 0px;
		}
		.t-title {
			font-family: 'Cagliostro';
		}
	</style>
</head>
<body>
	<header>
		<h1>Financiamiento S.A.S</h1>
	</header>
	<section>
		<div class="container">
			<div class="agente">
				<p>Nombre Agente:</p>
				<input type="text" id="name">
			</div>
			<div class="monto">
				<p>Monto del prestamo:</p>
				<input type="text" id="amount">
			</div>
			<a id="cotizar" class="waves-effect waves-light btn">Enviar</a>
		</div>
	</section>
	<section class="table">
		<div class="container">
			<div class="t-row">
				<div class="t-title red lighten-1">Socio que realiza el préstamo</div>
				<div class="t-title red lighten-1">Cuota mensual</div>
				<div class="t-title red lighten-1">Pago total del crédito</div>
				<div class="t-title red lighten-1">Tasa de interés mensual</div>
			</div>
			<div class="t-row">
				<div class="t-cell" id="cell1"></div>
				<div class="t-cell" id="cell2"></div>
				<div class="t-cell" id="cell3"></div>
				<div class="t-cell" id="cell4"></div>
			</div>
		</div>
	</section>
</body>
</html>