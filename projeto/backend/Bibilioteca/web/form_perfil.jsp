<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_perfil.jsp" class="btn btn-outline-secondary">Voltar</a>
                    </li>
                </ul>
            </nav>
            
            <% String acao = ""; %>
            <c:if test="${empty param.acao}">
                <% acao = "Cadastrar"; %>
            </c:if>
            <c:if test="${not empty param.acao}">
                <% acao = "Alterar"; %>
            </c:if> 
                    
            <form action="gerenciar_perfil.do" method="post" class="custom-container mt-3 mb-5">
                
                <p class="h2 mb-4 text-left font-weight-bold">
                    👤 <%=acao%> Perfil
                </p>
                
                <input type="hidden" name="idPerfil" value="${perfil.idPerfil}"/>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="perfil">Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" value="${perfil.nome}" required>
                    </div>
                </div>
                    
                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>" onclick="toast()">
                <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
            </form>
                    
<%@include file="templates/footer.jsp" %>