<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
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
	<table
		class="table table-striped table-bordered table-light text-center">
		<thead class="thead-light">
			<tr>
				<th scope="col">Referência</th>
				<th scope="col">Descrição</th>
				<th scope="col">Tamanho</th>
				<th scope="col">Cor</th>
				<th scope="col">Estoque</th>
				<th colspan="4">Ações</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${produtos}" var="produto">
				<tr>
					<td>${produto.referencia}</td>
					<td>${produto.descricao}</td>
					<td>${produto.tamanho}</td>
					<td>${produto.cor}</td>
					<td>${produto.estoque}</td>
					<td><a class="btn btn-info"
						href="http://localhost:8080/controle-de-estoque/movimentacao/${cliente.nome}/historico/${produto.id}">Histórico</a></td>
					<td><a class="btn btn-success"
						href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}/formEntrada/${produto.id}">Entrada</a></td>
					<td><a class="btn btn-warning"
						href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}/formSaida/${produto.id}">Saída</a></td>
					<td><a class="btn btn-danger"
						href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}/confirm/${produto.id}">Remover</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-primary mr-1 mb-5"
		href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}/form">Novo
		Produto</a>
	<a class="btn btn-primary ml-1 mr-1 mb-5"
		href="http://localhost:8080/controle-de-estoque/clientes">Voltar
		para Clientes</a>
	<a href="http://localhost:8080/controle-de-estoque/"
		class="btn btn-primary ml-1 mb-5 ">Início</a>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">©Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>