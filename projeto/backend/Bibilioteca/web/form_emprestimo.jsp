<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>

<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_emprestimo.jsp" class="btn btn-outline-secondary">Voltar</a>
                    </li>
                </ul>
            </nav>
    
            <% String acao = ""; %>
            <c:if test="${empty param.acao}">
                <% acao = "Registrar"; %>
            </c:if>
            <c:if test="${not empty param.acao}">
                <% acao = "Alterar"; %>
            </c:if> 
            
            <form action="gerenciar_emprestimo.do" method="post" class="custom-container mt-3 mb-5">
                <p class="h2 mb-4 text-left font-weight-bold">📝 <%=acao%> Emprestimo</p>
                <div class="form-row">
                    <input type="hidden" name="idEmprestimo" value="${emprestimo.idEmprestimo}"/>
                    <input type="hidden" name="idUsuario" value="${ulogado.idUsuario}"/>
                    <div class="form-group col-md-6">
                        <label for="idCliente">Cliente</label>
                        <select class="form-control" name="idCliente" id="idCliente" required>
                            <jsp:useBean class="dao.ClienteDAO" id="cliente">
                                <c:forEach var="c" items="${cliente.lista}">
                                    <c:if test="${c.idCliente==param.idCliente}">
                                        <option value="${c.idCliente}">
                                            ${c.nome} ${c.sobrenome}
                                        </option>
                                    </c:if>
                                    <c:if test="${not empty emprestimo.cliente}">
                                        <option value="${emprestimo.cliente.idCliente}">
                                            ${emprestimo.cliente.nome} ${emprestimo.cliente.sobrenome}
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </jsp:useBean>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="idLivro">Livro</label>
                        <select class="form-control" name="idLivro" id="idLivro" required>
                            <jsp:useBean class="dao.LivroDAO" id="livro">
                                <c:if test="${not empty emprestimo.livro}">
                                    <option selected value="${emprestimo.livro.idLivro}">
                                        ${emprestimo.livro.titulo}
                                    </option>
                                </c:if>
                                <c:forEach var="l" items="${livro.lista}">
                                    <c:if test="${l.disponivel=='1'}">
                                        <option value="${l.idLivro}">
                                            ${l.titulo}
                                        </option>
                                    </c:if>
                                </c:forEach>
                            </jsp:useBean>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="dataEntrega">Data Entrega</label>
                        <customTag:inputDate id="dataEntrega" value="${dataEntrega}" classStyle="form-control"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="dataDevolucao">Data Devolução</label>
                        <customTag:inputDate id="dataDevolucao" value="${dataDevolucao}" classStyle="form-control"/>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="status">Status</label>
                        <select name="status" id="status" class="custom-select" required>
                            <option value="1" selected>Emprestado</option>
                            <option value="2">Atrasado</option>
                            <option value="3">Finalizado</option>
                        </select>
                    </div>
                </div>
                
                <c:if test="${not empty param.acao}">
                <div class="form-group">
                    <h5 class="text-right">Emprestimo feito por <span class="font-weight-bold">${emprestimo.usuario.nome}</span></h5>
                </div>
                </c:if>
                
                <p class="h2 mt-5 mb-4 text-left font-weight-bold">👮🏻 Multar</p>
                <div class="form-group">
                    <label for="multaMotivo">Motivo</label>
                    <input type="text" class="form-control" name="multaMotivo" id="multaMotivo">
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="multaValor">Valor R$</label>
                        <input type="text" class="form-control" name="multaValor" id="multaValor">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="multaPaga">Multa Paga</label>
                        <select name="multaPaga" id="multaPaga" class="custom-select">
                            <option value="" selected></option>
                            <option value="1">Sim</option>
                            <option value="2">Não</option>
                        </select>
                    </div>
                </div>

                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>">
                <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
            </form>

<%@include file="templates/footer.jsp" %>