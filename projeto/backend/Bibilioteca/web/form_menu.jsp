<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_menu.jsp" class="btn btn-outline-secondary">Voltar</a>
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
            
            <form action="gerenciar_menu.do" method="post" class="custom-container mt-3 mb-5">
                
                <p class="h2 mb-4 text-left font-weight-bold">
                    ✏️ <%=acao%> Menu
                </p>
                
                <input type="hidden" name="idMenu" value="${menu.idMenu}"/>
                <div class="form-row">
                    <div class="form-group col-md-10">
                        <label for="perfil" class="control-label">Menu</label>
                        <input type="text" class="form-control" id="nome" name="nome" value="${menu.nome}" required/>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="perfil" class="control-label">Exibir</label>
                        <select class="form-control" name="exibir">
                            <option value="1" <c:if test="${menu.exibir==1}">selected</c:if>>Sim</option>
                            <option value="2" <c:if test="${menu.exibir==2}">selected</c:if>>Não</option>
                        </select>
                    </div>
                </div> 
                <div class="form-group">
                    <label for="perfil" class="control-label">Link</label>
                    <input type="text" class="form-control" id="link" name="link" value="${menu.link}" required/>
                </div>
                
                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>" onclick="toast()">
                <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
            </form>
            <br>
                    
<%@include file="templates/footer.jsp" %>