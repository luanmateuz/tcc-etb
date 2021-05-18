<%@page import="dao.ClienteDAO"%>
<%@page import="model.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                  <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="form_cliente.jsp" class="btn btn-outline-primary">Cadastrar Cliente</a>
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
    
            <h2 class="h2 mt-5 text-left font-weight-bold custom-md-container">💁🏻‍♂️ Lista de Clientes</h2>

            <div class="row py-5">
                <table class="table table-hover custom-md-container">
                    <thead>
                        <tr>
                            <th scope="col">ID</th>
                            <th scope="col">Nome</th>
                            <th scope="col">Email</th>
                            <th scope="col">Telefone</th>
                            <th scope="col">Status</th>
                            <th scope="col">Opções</th>
                        </tr>
                    </thead>
                    <jsp:useBean class="dao.ClienteDAO" id="dao">
                    <tbody>
                        <c:forEach var="cliente" items="${dao.lista}">
                        <tr>
                            <td>${cliente.idCliente}</td>
                            <td>${cliente.nome}</td>
                            <td>${cliente.email}</td>
                            <td>${cliente.telefone}</td>
                            <td>
                                <c:if test="${cliente.status==1}">
                                    Ativo
                                </c:if>
                                <c:if test="${cliente.status==2}">
                                    Inativo
                                </c:if>
                                <c:if test="${cliente.status==3}">
                                    Multado
                                </c:if>
                            </td>
                            <td>
                                <a href="gerenciar_cliente.do?acao=alterar&idCliente=${cliente.idCliente}" class="btn btn-primary">
                                    <i class="bi-pencil" style="font-size: 16px; color: white;"></i>
                                </a>
                                <button class="btn btn-warning"  onclick="confirmarExclusao(${cliente.idCliente}, '${cliente.nome}')">
                                    <i class="bi-trash" style="font-size: 16px; color: white;"></i>
                                </button>
                            </td>
                        </tr>
                        </c:forEach>
                    </tbody>
                    </jsp:useBean>
                </table>               
           </div>

        <script type="text/javascript">
            function confirmarExclusao(id, nome) {
                if(confirm("Deseja realmente excluir o cliente " + nome + "?")) {
                    location.href = "gerenciar_cliente.do?acao=deletar&idCliente=" + id;
                }
            } 
        </script>

<%@include file="templates/footer.jsp" %>