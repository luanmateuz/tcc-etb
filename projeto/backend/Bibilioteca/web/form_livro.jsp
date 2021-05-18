<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light bg-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="index.jsp" class="btn btn-outline-secondary">Voltar</a>
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
                    
            <form action="gerenciar_livro.do" method="post" enctype="multipart/form-data" class="custom-container mt-3 mb-5">
                
                <p class="h2 mb-4 text-left font-weight-bold">
                    👤 <%=acao%> Livro
                </p>
                
		<input type="hidden" name="idLivro" value="${livro.idLivro}"/>
                <div class="form-group">
                    <label for="titulo">Titulo</label>
                    <input type="text" name="titulo" class="form-control" id="titulo" required>
                </div>
                <div class="mb-3">
                    <label for="descricao">Descrição</label>
                    <textarea class="form-control" name="descricao" id="descricao" required></textarea>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="autor">Autor</label>
                        <input type="text" name="autor" class="form-control" id="autor" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="editora">Editora</label>
                        <input type="text" name="editora" class="form-control" id="editora">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="categoria">Categoria</label>
                        <select name="categoria" id="categoria" class="custom-select" required>
                            <option value="Administração">Administração</option>
                            <option value="Agricultura">Agricultura</option>
                            <option value="Antropologia">Antropologia</option>
                            <option value="Arqueologia">Arqueologia</option>
                            <option value="Arquitetura">Arquitetura</option>
                            <option value="Artes">Artes</option>
                            <option value="Artesanato">Artesanato</option>
                            <option value="Auto ajuda">Auto ajuda</option>
                            <option value="Astronomia">Astronomia</option>
                            <option value="Biografias">Biografias</option>
                            <option value="Biologia">Biologia</option>
                            <option value="Botânica">Botânica</option>
                            <option value="Brasil">Brasil</option>
                            <option value="Ciência Política">Ciência Política</option>
                            <option value="Ciências Exatas">Ciências Exatas</option>
                            <option value="Coleções">Coleções</option>
                            <option value="Comportamento">Comportamento</option>
                            <option value="Contos">Contos</option>
                            <option value="Crítica Literária">Crítica Literária</option>
                            <option value="Cinema">Cinema</option>
                            <option value="Comunicação">Comunicação</option>
                            <option value="Contabilidade">Contabilidade</option>
                            <option value="Culinária">Culinária</option>
                            <option value="Decoração">Decoração</option>
                            <option value="Dicionários">Dicionários</option>
                            <option value="Didáticos">Didáticos</option>
                            <option value="Direito">Direito</option>
                            <option value="Documentos">Documentos</option>
                            <option value="Ecologia">Ecologia</option>
                            <option value="Economia">Economia</option>
                            <option value="Engenharia">Engenharia</option>
                            <option value="Enciclopédias">Enciclopédias</option>
                            <option value="Ensino de Idiomas">Ensino de Idiomas</option>
                            <option value="Esoterismo">Esoterismo</option>
                            <option value="Esportes">Esportes</option>
                            <option value="Filosofia">Filosofia</option>
                            <option value="Ficção Científica">Ficção Científica</option>
                            <option value="Folclore">Folclore</option>
                            <option value="Fotografia">Fotografia</option>
                            <option value="Genealogia">Genealogia</option>
                            <option value="Geografia">Geografia</option>
                            <option value="Guerra">Guerra</option>
                            <option value="História do Brasil">História do Brasil</option>
                            <option value="História Geral">História Geral</option>
                            <option value="Hobbies">Hobbies</option>
                            <option value="Humor">Humor</option>
                            <option value="Infantojuvenis">Infantojuvenis</option>
                            <option value="Informática">Informática</option>
                            <option value="Jogos">Jogos</option>
                            <option value="Jornais">Jornais</option>
                            <option value="Linguística">Linguística</option>
                            <option value="Literatura Brasileira">Literatura Brasileira</option>
                            <option value="Literatura Estrangeira">Literatura Estrangeira</option>
                            <option value="Livros Raros">Livros Raros</option>
                            <option value="Manuscritos">Manuscritos</option>
                            <option value="Medicina">Medicina</option>
                            <option value="Moda">Moda</option>
                            <option value="Música">Música</option>
                            <option value="Pecuária">Pecuária</option>
                            <option value="Pedagogia">Pedagogia</option>
                            <option value="Pintura">Pintura</option>
                            <option value="Poesia">Poesia</option>
                            <option value="Psicologia">Psicologia</option>
                            <option value="Religião">Religião</option>
                            <option value="Saúde">Saúde</option>
                            <option value="Sexualidade">Sexualidade</option>
                            <option value="Sociologia">Sociologia</option>
                            <option value="Teatro">Teatro</option>
                            <option value="Turismo">Turismo</option>
                            <option value="Outros Assuntos">Outros Assuntos</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="paginas">Numero de Paginas</label>
                        <input type="text" name="paginas" class="form-control" id="paginas" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="ano">Ano de Lançamento</label>
                        <input type="text" name="ano" class="form-control" id="ano">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="isbn">ISBN</label>
                        <input type="text" name="isbn" class="form-control" id="isbn" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="idioma">Idioma</label>
                        <select name="idioma" id="idioma" class="custom-select" required>
                            <option value="portugues" selected>Portugues</option>
                            <option value="ingles">Ingles</option>
                            <option value="frances">Frances</option>
                            <option value="japones">Japones</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="disponivel">Disponivel</label>
                        <select name="disponivel" id="disponivel" class="custom-select" required>
                            <option value="1" selected>Sim</option>
                            <option value="2">Não</option>
                        </select>
                    </div>
                </div>
                <div class="custom-file my-3 mb-4">
                    <input type="file" name="imagem" accept=".png, .jpg, .jpeg" class="custom-file-input" id="imagem">
                    <label class="custom-file-label" for="imagem">Imagem</label>
                </div>
                    
                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>" onclick="toast()">
                <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
            </form>
                    
<%@include file="templates/footer.jsp" %>
