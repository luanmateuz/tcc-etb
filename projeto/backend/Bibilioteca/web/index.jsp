<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="templates/header.jsp" %>

<div class="container">

    <nav class="navbar-expand-lg navbar-light bg-light pt-3">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="formulario-livro.html" class="btn btn-outline-primary">Cadastrar Livro</a>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0">
                <input class="form-control mr-sm-2" id="search" name="search" type="search" placeholder="" aria-label="Search">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                    Pesquisar
                </button>
            </form>
        </div>
    </nav>

    <h1 class="text-center">Conteudo Aqui!</h1>
    
</div>

<%@include file="templates/footer.jsp" %>