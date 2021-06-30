<%@page import="dao.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="templates/header.jsp" %>
            
            <nav class="navbar-expand-lg navbar-light pt-3">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="form_perfil.jsp" class="btn btn-outline-primary">Cadastrar Perfil</a>
                    </li>
                  </ul>
                </div>
            </nav>
            
            <h2 class="h2 mt-5 text-left font-weight-bold custom-md-container">👥 Lista de Perfis</h2>

            <div class="row py-5">
                <table class="table table-hover custom-md-container" id="listarPerfil">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Opções</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="dao.PerfilDAO" id="dao">
                    <tbody>
                        <c:forEach var="perfil" items="${dao.lista}">

                            <tr>
                                <td>${perfil.idPerfil}</td>
                                <td>${perfil.nome}</td>
                                <td>
                                    <a href="gerenciar_perfil.do?acao=alterar&idPerfil=${perfil.idPerfil}" class="btn btn-primary">
                                        <i class="bi-pencil" style="font-size: 16px; color: white;"></i>
                                    </a>
                                    <button class="btn btn-warning" onclick="swalWithBootstrap('Perfil ${perfil.nome}', 'gerenciar_perfil.do?acao=deletar&idPerfil=' + ${perfil.idPerfil})">
                                        <i class="bi-trash" style="font-size: 16px; color: white;"></i>
                                    </button>
                                    <a href="gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=${perfil.idPerfil}" class="btn btn-secondary">
                                        <i class="glyphicon">Acessos</i>
                                    </a>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                    </jsp:useBean>
                </table>
            </div>
            
<%@include file="templates/footer.jsp" %>