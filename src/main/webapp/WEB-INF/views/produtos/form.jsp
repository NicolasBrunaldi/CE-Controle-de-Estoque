<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<!DOCTYPE html>
<html>
<head>
<%@ page isELIgnored="false"%>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<title>Controle de Estoque</title>
</head>
<body class="container p-3 mb-2 bg-secondary text-white vh-100 wh-100">
	<header class="text-center">
		<div>
			<h1>${cliente.nome}</h1>
		</div>
	</header>
	<form class="form-group"
		action="/controle-de-estoque/produtos/${cliente.nome}" method="POST">
		<div>
			<label>Referência:</label>
			<form:errors path="produto.referencia" class="text-warning" />
			<input autofocus="autofocus" class="form-control" type="text" name="referencia"
				value="${produto.referencia}">

		</div>
		<div>
			<label>Descrição:</label>
			<form:errors path="produto.descricao" class="text-warning" />
			<input class="form-control" name="descricao"
				value="${produto.descricao}" />

		</div>
		<div>
			<label>Tamanho:</label>
			<form:errors path="produto.tamanho" class="text-warning" />
			<input class="form-control" type="text" name="tamanho"
				value="${produto.tamanho}">

		</div>
		<div>
			<label>cor:</label>
			<form:errors path="produto.cor" class="text-warning" />
			<input class="form-control" type="text" name="cor"
				value="${produto.cor}">

		</div>
		<div>
			<label>Estoque:</label>
			<form:errors path="produto.estoque" class="text-warning" />
			<input class="form-control" type="text" name="estoque"
				value="${produto.estoque}">

		</div>

		<button class="btn btn-success mr-1 mt-2" type="submit">Cadastrar</button>
		<a class="btn btn-primary ml-1 mt-2 mr-1"
			href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}">Voltar
			aos Produtos</a> <a
			href="http://localhost:8080/controle-de-estoque/clientes"
			class="btn btn-primary ml-1 mt-2 mr-1 ">Voltar para Clientes</a> <a
			href="http://localhost:8080/controle-de-estoque/"
			class="btn btn-primary ml-1 mt-2 ">Início</a>
	</form>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>