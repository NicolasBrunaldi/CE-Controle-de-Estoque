<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>


<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<%@ page isELIgnored="false"%>
<meta charset="ISO-8859-1">
<title>Controle de Estoque</title>
</head>
<body class="container p-3 mb-2 bg-secondary text-white vh-100 wh-100">
	<header class="text-center">
		<div>
			<h1>CE-Controle de Estoque</h1>
		</div>
	</header>
	<div class="text-center">
		<div class="text-justify">
			<p>Esta aplicação foi desenvolvida com o objetivo de obter um
				controle melhor de seu estoque. Leia alguns avisos e instruções de
				uso abaixo:</p>
			<p>1. Esta aplicação funciona sem Internet</p>
			<p>2. Esta versão utilizada está em estado Beta, podendo assim
				sofrer algumas mudanças até sua versão final</p>
			<p>3. Para melhor experiência é aconselhável utilizar somente os
				botões de navegação, evite usar as setas de retorno do navegador</p>
			<p>4. Esta aplicação ainda não possui opções de Backup, então
				tome cuidado ao excluir informações</p>
			<p>5. Para maiores informações entrar em contato com uma das
				opções abaixo:</p>
		</div>
		<div class="text-justify ">
			<p class="text-info ">G-mail: <b class="text-info">nicolas.brunaldi@gmail.com</b></p>
			<p class="text-success">WhatsApp: <b class="text-success">(11) 97710-7586</b></p>
			<a class="btn btn-primary mr-1" href="https://www.linkedin.com/in/nicolas-de-oliveira-93945b164/">LinkedIn</a>
			<a class="btn btn-primary ml-1" href="https://github.com/NicolasBrunaldi">GitHub</a>
		</div>
		<a href="http://localhost:8080/controle-de-estoque/clientes"
			class="btn btn-primary">Ver Clientes</a>
	</div>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>
