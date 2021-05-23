<%@page import="model.Usuario"%>
<%@page import="controller.GerenciarLogin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    Usuario ulogado = GerenciarLogin.verificarAcesso(request, response);
    request.setAttribute("ulogdao", ulogado);
%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="shortcut icon" href="assets/img/books.svg" type="image/x-icon">

    <link rel="stylesheet" href="assets/lib/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="assets/lib/bootstrap/icons/bootstrap-icons.css">
    <link rel="stylesheet" href="assets/lib/sweetalert2/sweetalert2.min.css">  

    <link rel="stylesheet" href="assets/css/container.css">
    <link rel="stylesheet" href="assets/css/livro.css">

    <title>Biblioteca</title>
</head>

<body>
    <header class="bg-light sticky-top">
        <nav class="navbar navbar-expand-lg navbar-light container">
            <a class="navbar-brand" href="index.jsp">
                <img src="assets/img/books.svg" width="30" height="30" class="d-inline-block align-top" alt="">
                Biblioteca
            </a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <c:if test="${ulogado!=null && ulogado.perfil!=null}">
                        <c:forEach var="menu" items="${ulogado.perfil.menus}">
                            <c:if test="${menu.exibir==1}">
                                <li class="nav-item"><a href="${menu.link}" class="nav-link">${menu.nome}</a></li>
                            </c:if>
                        </c:forEach>
                    </c:if>
                </ul>
                
                <div>
                    <span class="nav-item text-muted">Bem-vindo <c:if test="${ulogado!=null}">${ulogado.nome}</c:if> <a href="gerenciar_login.do" class="ml-3 btn btn-sm btn-outline-danger" role="button">Sair</a></span>
                </div>
                
            </div>
        </nav>
    </header>
        
    <main class="container">           