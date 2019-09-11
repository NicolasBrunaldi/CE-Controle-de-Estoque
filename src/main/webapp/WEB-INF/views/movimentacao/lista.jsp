<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

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
			<h2>${produto.referencia}</h2>
		</div>
	</header>

	<table
		class="table table-striped table-bordered table-light text-center">
		<thead class="thead-light">
			<tr>
				<td scope="col">Tipo De Movimentação</td>
				<td scope="col">Data</td>
				<td scope="col">Quantidade</td>
				<td scope="col">Observação</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${movimentacoes}" var="movimentacao">
				<tr>
					<td>${movimentacao.tipo}</td>
					<td><fmt:formatDate value="${movimentacao.data}"/></td>
					<td>${movimentacao.quantidade}</td>
					<td>${movimentacao.observacao}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<a class="btn btn-primary mr-1 mb-5"
		href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}">Voltar
		aos Produtos</a>
	<a class="btn btn-primary ml-1 mr-1 mb-5"
		href="http://localhost:8080/controle-de-estoque/clientes">Voltar
		para Clientes</a>
	<a href="http://localhost:8080/controle-de-estoque/"
		class="btn btn-primary ml-1 mb-5">Início</a>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>