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
	<h1>${cliente.nome}</h1>
	<h2>${produto.referencia}</h2>
	<h2>Valor atual do estoque: ${produto.estoque}</h2>
	<form class="form-group"
		action="/controle-de-estoque/produtos/${cliente.nome}/saida/${produto.id}"
		method="POST">
		<div>
			<label>Saída:</label>
			<form:errors path="movimentacao.quantidade" class="text-warning" />
			<input autofocus="autofocus" class="form-control" type="text" name="quantidade"
				value="${movimentacao.quantidade}">
		</div>
		<div>
			<label>Data:</label>
			<form:errors path="movimentacao.data" class="text-warning" />
			<input class="form-control" type="date" name="data">
		</div>
		<div>
			<label>Observação:</label>
			<form:errors path="movimentacao.observacao" class="text-warning" />
			<input class="form-control" name="observacao"
				value="${movimentacao.observacao}" />
		</div>
		<button class="btn btn-success mr-1 mt-2" type="submit">Cadastrar</button>
		<a class="btn btn-primary ml-1 mt-2 mr-1"
			href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}">Voltar
			Para Produtos</a> <a
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