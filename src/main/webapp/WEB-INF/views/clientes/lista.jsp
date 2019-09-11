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
	<header class="text-center ">
		<div>
			<h1>Clientes</h1>
		</div>
	</header>
	<ul class="list-group m-auto p-auto">
		<c:forEach items="${clientes}" var="cliente">
			<li
				class="list-group-item border border-primary text-primary font-weight-bold">${cliente.nome}<a
				href="http://localhost:8080/controle-de-estoque/clientes/${cliente.nome}/confirm "
				class="font-weight-normal btn btn-danger float-right ml-1">remover</a><a
				href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}"
				class="font-weight-normal btn btn-info float-right mr-1">Produtos</a></li>

		</c:forEach>
	</ul>
	<a href="http://localhost:8080/controle-de-estoque/clientes/form"
		class="btn btn-primary mt-2 mb-5 mr-1">Novo Cliente</a>
	<a href="http://localhost:8080/controle-de-estoque/"
		class="btn btn-primary mt-2 mb-5 ml-1">Início</a>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>