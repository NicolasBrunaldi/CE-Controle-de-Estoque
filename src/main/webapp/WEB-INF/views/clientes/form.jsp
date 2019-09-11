<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<html>
<head>
<%@ page isELIgnored="false"%>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Controle de Estoque</title>
</head>
<body class="container p-3 mb-2 bg-secondary text-white vh-100 wh-100">
	<form action="/controle-de-estoque/clientes" method="POST"
		class="form-group">
		<div>
			<label for="nome">Nome:</label>
			<form:errors path="cliente.nome" class="text-warning" />
			<input autofocus="autofocus" id="nome" class="form-control" type="text" name="nome">
		</div>
		<button type="submit" class="btn btn-success mr-1 mt-2">Cadastrar</button>
		<a class="btn btn-primary ml-1 mt-2 mr-1"
			href="http://localhost:8080/controle-de-estoque/clientes">Voltar
			para Clientes</a> <a href="http://localhost:8080/controle-de-estoque/"
			class="btn btn-primary ml-1 mt-2 ">Início</a>
	</form>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>