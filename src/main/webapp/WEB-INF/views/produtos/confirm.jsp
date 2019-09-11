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
	<div class="text-center">
		<h1>${cliente.nome}</h1>
		<br>
		<h2>Tem certeza que quer excluir o produto abaixo?</h2>
		<br>
		<table class="table table-striped table-bordered table-light">
			<tr>
				<td>${produto.referencia}</td>
				<td>${produto.descricao}</td>
				<td>${produto.tamanho}</td>
				<td>${produto.cor}</td>
			</tr>
		</table>
		<p class="alert alert-warning font-weight-bolder">AVISO: Esta ação
			não pode ser desfeita</p>
		<a class="btn btn-success mr-1 "
			href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}/remove/${produto.id}">SIM</a>
		<a class="btn btn-danger ml-1 "
			href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}">NÃO</a>
	</div>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>