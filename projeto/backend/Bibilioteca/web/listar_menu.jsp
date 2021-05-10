<%@page import="dao.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="templates/header.jsp" %>

        <div class="container">
            
            <nav class="navbar-expand-lg navbar-light bg-light pt-3">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="form_menu.jsp" class="btn btn-outline-primary">Cadastrar Menu</a>
                    </li>
                  </ul>
                </div>
            </nav>
            
            <h2 class="h2 mt-5 text-left font-weight-bold custom-md-container">📋 Lista de Menus</h2>

            <div class="row py-5">
                <table class="table table-hover custom-md-container" id="listarPerfil">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Menu</th>
                            <th scope="col">Link</th>
                            <th scope="col">Exibir</th>
                            <th scope="col">Opções</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="dao.MenuDAO" id="dao">
                    <tbody>
                    <c:forEach var="menu" items="${dao.lista}">

                        <tr>
                            <td>${menu.idMenu}</td>
                            <td>${menu.nome}</td>
                            <td>${menu.link}</td>
                            <td>
                                <c:if test="${menu.exibir==1}">
                                    Sim
                                </c:if>
                                <c:if test="${menu.exibir==2}">
                                    Não
                                </c:if>
                            </td>
                            <td>
                                <a href="gerenciar_menu.do?acao=alterar&idMenu=${menu.idMenu}" class="btn btn-primary">
                                    <i class="bi-pencil" style="font-size: 16px; color: white;"></i>
                                </a>
                                <button class="btn btn-warning" onclick="swalWithBootstrap('${menu.nome}', 'gerenciar_menu.do?acao=deletar&idMenu=' + ${menu.idMenu})">
                                    <i class="bi-trash" style="font-size: 16px; color: white;"></i>
                                </button>
                            </td>
                        </tr>
                        
                    </c:forEach>
                    </tbody>
                    </jsp:useBean>
                </table>
            </div>
            
        </div>
            
<%@include file="templates/footer.jsp" %>