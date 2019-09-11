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
		<h1>${cliente.nome}</h1>
		<h2>${produto.referencia}</h2>
	</header>
	<div class="alert alert-warning font-weight-bolder">
		<p >AVISO: Você está
			tentando retirar uma quantidade maior que a quantidade do seu
			estoque!</p>
		<p>Para prosseguir retire um numero menor que a quantidade do
			estoque ou, dê uma nova entrada em seu estoque.</p>
	</div>
	<a class="btn btn-primary"
		href="http://localhost:8080/controle-de-estoque/produtos/${cliente.nome}">Voltar
		aos Produtos</a>
	<footer class="fixed-bottom text-light bg-dark">
		<div class="text-left  float-left">© Nicolas Brunaldi de
			Oliveira, 2019</div>
		<div class="text-right">Versão 1.0.0</div>
	</footer>
</body>
</html>