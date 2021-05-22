<%@page import="dao.PerfilDAO"%>
<%@page import="model.Perfil"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="templates/header.jsp" %>

            <h2 class="h2 mt-5 text-left font-weight-bold custom-md-container">📋 Lista de Emprestimos</h2>

            <div class="row py-5">
                <table class="table table-hover custom-md-container" id="listarPerfil">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Cliente</th>
                            <th scope="col">Livro</th>
                            <th scope="col">Funcionario</th>
                            <th scope="col">Status</th>
                            <th scope="col">Devolução</th>
                            <th scope="col">Opções</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="dao.EmprestimoDAO" id="dao">
                    <tbody>
                    <c:forEach var="emprestimo" items="${dao.lista}">

                        <tr>
                            <td>${emprestimo.idEmprestimo}</td>
                            <td>${emprestimo.cliente.nome}</td>
                            <td><a href="gerenciar_livro.do?acao=exibir&idLivro=${emprestimo.livro.idLivro}">${emprestimo.livro.titulo}</a></td>
                            <td>${emprestimo.usuario.nome}</td>
                            <td>
                                <c:if test="${emprestimo.status==1}">
                                    <span class="badge badge-primary p-3">Emprestado</span>
                                </c:if>
                                <c:if test="${emprestimo.status==2}">
                                    <span class="badge badge-danger p-3">Atrasado</span>
                                </c:if>
                                <c:if test="${emprestimo.status==3}">
                                    <span class="badge badge-success p-3">Finalizado</span>
                                </c:if>
                            </td>
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${emprestimo.dataDevolucao.time}" /></td>
                            <td>
                                <a href="gerenciar_emprestimo.do?acao=alterar&idEmprestimo=${emprestimo.idEmprestimo}" class="btn btn-primary">
                                    <i class="bi-pencil" style="font-size: 16px; color: white;"></i>
                                </a>
                                <button class="btn btn-warning" onclick="swalWithBootstrap('${emprestimo}', 'gerenciar_emprestimo.do?acao=deletar&idEmprestimo=' + ${emprestimo.idEmprestimo})">
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