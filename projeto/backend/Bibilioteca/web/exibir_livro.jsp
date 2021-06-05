<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@include file="templates/header.jsp" %>

    <nav class="navbar-expand-lg navbar-light pt-3">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a href="index.jsp" class="btn btn-outline-secondary">Voltar</a>
            </li>
        </ul>
    </nav>

    <div class="custom-md-container mt-4 mb-5">
        <div class="row">
            <div class="col-lg-5">
                <c:if test="${empty livro.imagem}">
                    <img  src="assets/img/livros/book-template.png" class="zoom img-fluid "  alt="">
                </c:if>
                <c:if test="${not empty livro.imagem}">
                    <img  src="assets/img/livros/${livro.imagem}" class="zoom img-fluid "  alt="">
                </c:if>
            </div>
            <div class="col">
                <p class="h2 text-left font-weight-bold">📚 ${livro.titulo}</p>
                <p class="autor ml-5 text-muted"><span class="mr-2 badge badge-dark">${livro.categoria}</span><span class="badge badge-light">${livro.autor}</span></p>
                <p class="descricao ml-5 mb-5 text-justify">${livro.descricao}</p>
                <div class="row">
                    <div class="col ml-5">
                        <p class="editora"><span class="font-weight-bold">Editora:</span> ${livro.editora}</p>
                    </div>
                    <div class="col">
                        <p class="paginas"><span class="font-weight-bold">Paginas:</span> ${livro.paginas}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col ml-5">
                        <p class="ano"><span class="font-weight-bold">Ano:</span> ${livro.ano}</p>
                    </div>
                    <div class="col">
                        <p class="isbn"><span class="font-weight-bold">ISBN:</span> ${livro.isbn}</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col ml-5">
                        <p class="idioma"><span class="font-weight-bold">Idioma:</span> ${livro.idioma}</p>
                    </div>
                    <div class="col">
                        <p class="status"><span class="font-weight-bold">Disponivel:</span> 
                            <c:if test="${livro.disponivel==1}">Sim</c:if>
                            <c:if test="${livro.disponivel==2}">Não</c:if></p>
                    </div>
                </div>

                <div class="opcoes mt-3">
                    <a href="gerenciar_livro.do?acao=alterar&idLivro=${livro.idLivro}" class="btn btn-outline-primary float-right">Alterar</a>
                    <button class="btn btn-outline-danger float-right mr-3" onclick="swalWithBootstrap('Livro ${livro.titulo}', 'gerenciar_livro.do?acao=deletar&idLivro=' + ${livro.idLivro})">Excluir</button>
                </div>
            </div>
        </div>
    </div>

<%@include file="templates/footer.jsp" %>