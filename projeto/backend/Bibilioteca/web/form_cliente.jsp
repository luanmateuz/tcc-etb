<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="customTag" tagdir="/WEB-INF/tags" %>

<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_cliente.jsp" class="btn btn-outline-secondary">Voltar</a>
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
            
            <form action="gerenciar_cliente.do" method="post" class="custom-container mt-3 mb-5">
                <p class="h2 mb-4 text-left font-weight-bold">🙋🏻‍♂️ <%=acao%> Cliente</p>
                <input type="hidden" name="idCliente" value="${cliente.idCliente}"/>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="nome">Nome</label>
                        <input type="text" class="form-control" name="nome" id="nome" value="${cliente.nome}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="sobrenome">Sobrenome</label>
                        <input type="text" class="form-control" name="sobrenome" id="sobrenome" value="${cliente.sobrenome}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="dataNascimento">Data Nascimento</label>
                        <customTag:inputDate id="dataNascimento" value="${dataNascimento}" classStyle="form-control"/>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="sexo">Sexo</label>
                        <select name="sexo" id="sexo" class="custom-select" required>
                            <option value="m" 
                                    <c:if test="${cliente.sexo=="m"}"> 
                                        selected
                                    </c:if>
                                    >Masculino</option>
                            <option value="f"
                                    <c:if test="${cliente.sexo=="f"}"> 
                                        selected
                                    </c:if>
                                    >Feminino</option>
                        </select>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cpf">CPF</label>
                        <input type="text" class="form-control" name="cpf" id="cpf" maxlength="14" onkeydown="javascript: fMasc( this, mCPF );" value="${cliente.cpf}" required>
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-9">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" name="email" id="email" value="${cliente.email}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="status" class="control-label">Status</label>
                        <select class="form-control custom-select" name="status" id="status"
                                <c:if test="${cliente.nome==ulogado.nome}">
                                    disabled
                                </c:if>>
                            <option value="1" 
                                    <c:if test="${cliente.status==1}"> 
                                        selected=""
                                    </c:if>
                            >Ativo</option>
                            <option value="2"
                                    <c:if test="${cliente.status==2}"> 
                                        selected=""
                                    </c:if>
                            >Inativo</option>
                            <option value="3"
                                    <c:if test="${cliente.status==3}"> 
                                        selected=""
                                    </c:if>
                            >Multado</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label for="telefone">Telefone</label>
                    <input type="text" class="form-control" name="telefone" id="telefone" maxlength="9" size="9" onblur="mascaraDeTelefone(this)" onfocus="tiraHifen(this)" value="${cliente.telefone}" required>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-3">
                        <label for="isbn">CEP</label>
                        <input type="text" class="form-control" name="cep" id="cep" maxlength="8"
        onblur="pesquisacep(this.value)" value="${cliente.cep}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="rua">Rua</label>
                        <input type="text" class="form-control" name="rua" id="rua" size="60" value="${cliente.rua}" required>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="numero">Numero</label>
                        <input type="number" class="form-control" name="numero" id="numero" value="${cliente.numero}" required>
                    </div><div class="form-group col-md-1">
                        <label for="numero">UF</label>
                        <input type="text" class="form-control" name="uf" id="uf" size="2" value="${cliente.uf}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="bairro">Bairro</label>
                        <input type="text" class="form-control" name="bairro" id="bairro" value="${cliente.bairro}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="cidade">Cidade</label>
                        <input type="text" class="form-control" name="cidade" id="cidade" value="${cliente.cidade}" required>
                    </div>
                    <div class="form-group col">
                        <label for="complemento">Complemento</label>
                        <input type="text" class="form-control" name="complemento" id="complemento" value="${cliente.complemento}">
                    </div>
                </div>

                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>">
                <c:if test="${empty param.acao}">
                    <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
                </c:if>
            </form>

<%@include file="templates/footer.jsp" %>