<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="templates/header.jsp" %>

<div class="container">

    <nav class="navbar-expand-lg navbar-light bg-light pt-3">
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a href="form_livro.jsp" class="btn btn-outline-primary">Cadastrar Livro</a>
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

    <jsp:useBean class="dao.LivroDAO" id="dao">
        <div class="row py-5">
            <c:forEach var="livro" items="${dao.lista}">
                <div class="col-lg-2 col-md-4 col-xs-6">
                    <c:if test="${empty livro.imagem}">
                        <img  src="assets/img/livros/book-template.png" class="zoom img-fluid "  alt="">
                    </c:if>
                    <c:if test="${not empty livro.imagem}">
                        <img  src="assets/img/livros/${livro.imagem}" class="zoom img-fluid "  alt="">
                    </c:if>
                    <a href="gerenciar_livro.do?acao=exibir&idLivro=${livro.idLivro}" class="text-reset">
                        <p class="font-weight-bold text-center">${livro.titulo}</p>
                    </a>
                </div>
            </c:forEach>              
        </div>
    </jsp:useBean>

    <%@include file="templates/footer.jsp" %>