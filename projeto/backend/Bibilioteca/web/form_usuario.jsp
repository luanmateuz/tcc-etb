<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>

<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_usuario.jsp" class="btn btn-outline-secondary">Voltar</a>
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
            
            <form action="gerenciar_usuario.do" method="post" class="custom-container mt-3 mb-5">
                <p class="h2 mb-4 text-left font-weight-bold">👨🏻‍💻 <%=acao%> Usuario</p>
                <input type="hidden" name="idUsuario" value="${usuario.idUsuario}"/>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nome">Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" value="${usuario.nome}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sobrenome">Sobrenome</label>
                        <input type="text" class="form-control" name="sobrenome" id="sobrenome" value="${usuario.sobrenome}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="dataNascimento">Data Nascimento</label>
                        <customTag:inputDate id="dataNascimento" value="${dataNascimento}" classStyle="form-control"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sexo">Sexo</label>
                        <select name="sexo" id="sexo" class="custom-select" required>
                            <option value="m" 
                                    <c:if test="${usuario.sexo=="m"}"> 
                                        selected
                                    </c:if>
                                    >Masculino</option>
                            <option value="f"
                                    <c:if test="${usuario.sexo=="f"}"> 
                                        selected
                                    </c:if>
                                    >Feminino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cpf">CPF</label>
                        <input type="text" class="form-control" name="cpf" id="cpf" maxlength="14" onkeydown="javascript: fMasc( this, mCPF );" value="${usuario.cpf}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="rg">RG</label>
                        <input type="text" class="form-control" name="rg" id="rg" maxlength="7" value="${usuario.rg}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="idPerfil">Perfil</label>
                        <select name="idPerfil" id="idPerfil" class="custom-select" required>
                            <c:if test="${empty param.acao}">
                                    <option value="">Selecione o Perfil</option>
                            </c:if>
                            <jsp:useBean class="dao.PerfilDAO" id="perfil">
                                <c:forEach var="p" items="${perfil.lista}">
                                    <option value="${p.idPerfil}" 
                                            <c:if test="${p.idPerfil==usuario.perfil.idPerfil}">selected</c:if>>
                                        ${p.nome}
                                    </option>
                                </c:forEach>
                            </jsp:useBean>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-9">
                        <label for="login">Usuario</label>
                        <input type="text" class="form-control" name="login" id="login" value="${usuario.login}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="status" class="control-label">Status</label>
                        <select class="form-control custom-select" name="status" id="status">
                            <option value="1" 
                                    <c:if test="${usuario.status==1}"> 
                                        selected=""
                                    </c:if>
                            >Ativo</option>
                            <option value="2"
                                    <c:if test="${usuario.status==2}"> 
                                        selected=""
                                    </c:if>
                            >Inativo</option>
                        </select>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="senha">Senha</label>
                        <input type="password" class="form-control" name="senha" id="senha" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="confirmarSenha">Confirmar Senha</label>
                        <input type="password" class="form-control" name="confirmarSenha" id="confirmarSenha" required>
                    </div>
                </div>
                <div class="form-group">
                    <label for="email">Email</label>
                    <input type="email" class="form-control" name="email" id="email" value="${usuario.email}" required>
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone</label>
                    <input type="text" class="form-control" name="telefone" id="telefone" maxlength="9" size="9" onblur="mascaraDeTelefone(this)" onfocus="tiraHifen(this)" value="${usuario.telefone}" required>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="isbn">CEP</label>
                        <input type="text" class="form-control" name="cep" id="cep" maxlength="8"
        onblur="pesquisacep(this.value)" value="${usuario.cep}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="rua">Rua</label>
                        <input type="text" class="form-control" name="rua" id="rua" size="60" value="${usuario.rua}" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="numero">Numero</label>
                        <input type="number" class="form-control" name="numero" id="numero" value="${usuario.numero}" required>
                    </div><div class="form-group col-md-1">
                        <label for="numero">UF</label>
                        <input type="text" class="form-control" name="uf" id="uf" size="2" value="${usuario.uf}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="bairro">Bairro</label>
                        <input type="text" class="form-control" name="bairro" id="bairro" value="${usuario.bairro}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cidade">Cidade</label>
                        <input type="text" class="form-control" name="cidade" id="cidade" value="${usuario.cidade}" required>
                    </div>
                    <div class="form-group col">
                        <label for="complemento">Complemento</label>
                        <input type="text" class="form-control" name="complemento" id="complemento" value="${usuario.complemento}">
                    </div>
                </div>

                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>">
                <c:if test="${empty param.acao}">
                    <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
                </c:if>
            </form>

<%@include file="templates/footer.jsp" %>