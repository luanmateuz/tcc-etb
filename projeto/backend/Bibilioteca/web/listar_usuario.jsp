<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="form_usuario.jsp" class="btn btn-outline-primary">Cadastrar Funcionario</a>
                    </li>
                  </ul>
                  <form class="form-inline my-2 my-lg-0">
                    <input class="form-control mr-sm-2" type="search" placeholder="" aria-label="Search">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">
                        Pesquisar
                    </button>
                  </form>
                </div>
            </nav> 
    
            <h2 class="h2 mt-5 text-left font-weight-bold custom-md-container">💻 Lista de Usuarios</h2>

            <div class="row py-5">
                <table class="table table-hover custom-md-container">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Email</th>
                            <th scope="col">Usuario</th>
                            <th scope="col">Perfil</th>
                            <th scope="col">Status</th>
                            <th scope="col">Opções</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="dao.UsuarioDAO" id="dao">
                    <tbody>
                        <c:forEach var="usuario" items="${dao.lista}">
                        <tr>
                            <td>${usuario.idUsuario}</td>
                            <td>${usuario.nome}</td>
                            <td>${usuario.email}</td>
                            <td>${usuario.login}</td>
                            <td>${usuario.perfil.nome}</td>
                            <td>
                                <c:if test="${usuario.status==1}">
                                    Ativo
                                </c:if>
                                <c:if test="${usuario.status==2}">
                                    Inativo
                                </c:if>
                            </td>
                            <td>
                                <a href="gerenciar_usuario.do?acao=alterar&idUsuario=${usuario.idUsuario}" class="btn btn-primary">
                                    <i class="bi-pencil" style="font-size: 16px; color: white;"></i>
                                </a>
                                <button class="btn btn-warning"  onclick="swalWithBootstrap('${usuario.nome}', 'gerenciar_usuario.do?acao=deletar&idUsuario=${usuario.idUsuario}')">
                                    <i class="bi-trash" style="font-size: 16px; color: white;"></i>
                                </button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                    </jsp:useBean>
                </table>               
           </div>

<%@include file="templates/footer.jsp" %>