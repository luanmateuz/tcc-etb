<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
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
                    📙 <%=acao%> Livro
                </p>
                
		<input type="hidden" name="idLivro" value="${livro.idLivro}"/>
                <div class="form-group">
                    <label for="titulo">Titulo</label>
                    <input type="text" name="titulo" class="form-control" id="titulo" value="${livro.titulo}" required>
                </div>
                <div class="mb-3">
                    <label for="descricao">Descrição</label>
                    <textarea class="form-control" name="descricao" id="descricao" required>${livro.descricao}</textarea>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="autor">Autor</label>
                        <input type="text" name="autor" class="form-control" id="autor" value="${livro.autor}" required>
                    </div>
                    <div class="form-group col-md-6">
                        <label for="editora">Editora</label>
                        <input type="text" name="editora" class="form-control" id="editora" value="${livro.editora}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-5">
                        <label for="categoria">Categoria</label>
                        <select name="categoria" id="categoria" class="custom-select" required>
                            <option <c:if test="${livro.categoria=='Administração'}">selected</c:if> value="Administração">Administração</option>
                            <option <c:if test="${livro.categoria=='Agricultura'}">selected</c:if> value="Agricultura">Agricultura</option>
                            <option <c:if test="${livro.categoria=='Antropologia'}">selected</c:if> value="Antropologia">Antropologia</option>
                            <option <c:if test="${livro.categoria=='Arqueologia'}">selected</c:if> value="Arqueologia">Arqueologia</option>
                            <option <c:if test="${livro.categoria=='Arquitetura'}">selected</c:if> value="Arquitetura">Arquitetura</option>
                            <option <c:if test="${livro.categoria=='Artes'}">selected</c:if> value="Artes">Artes</option>
                            <option <c:if test="${livro.categoria=='Artesanato'}">selected</c:if> value="Artesanato">Artesanato</option>
                            <option <c:if test="${livro.categoria=='Auto ajuda'}">selected</c:if> value="Auto ajuda">Auto ajuda</option>
                            <option <c:if test="${livro.categoria=='Astronomia'}">selected</c:if> value="Astronomia">Astronomia</option>
                            <option <c:if test="${livro.categoria=='Biografias'}">selected</c:if> value="Biografias">Biografias</option>
                            <option <c:if test="${livro.categoria=='Biologia'}">selected</c:if> value="Biologia">Biologia</option>
                            <option <c:if test="${livro.categoria=='Botânica'}">selected</c:if> value="Botânica">Botânica</option>
                            <option <c:if test="${livro.categoria=='Brasil'}">selected</c:if> value="Brasil">Brasil</option>
                            <option <c:if test="${livro.categoria=='Ciência Política'}">selected</c:if> value="Ciência Política">Ciência Política</option>
                            <option <c:if test="${livro.categoria=='Ciências Exatas'}">selected</c:if> value="Ciências Exatas">Ciências Exatas</option>
                            <option <c:if test="${livro.categoria=='Coleções'}">selected</c:if> value="Coleções">Coleções</option>
                            <option <c:if test="${livro.categoria=='Comportamento'}">selected</c:if> value="Comportamento">Comportamento</option>
                            <option <c:if test="${livro.categoria=='Contos'}">selected</c:if> value="Contos">Contos</option>
                            <option <c:if test="${livro.categoria=='Crítica Literária'}">selected</c:if> value="Crítica Literária">Crítica Literária</option>
                            <option <c:if test="${livro.categoria=='Cinema'}">selected</c:if> value="Cinema">Cinema</option>
                            <option <c:if test="${livro.categoria=='Comunicação'}">selected</c:if> value="Comunicação">Comunicação</option>
                            <option <c:if test="${livro.categoria=='Contabilidade'}">selected</c:if> value="Contabilidade">Contabilidade</option>
                            <option <c:if test="${livro.categoria=='Culinária'}">selected</c:if> value="Culinária">Culinária</option>
                            <option <c:if test="${livro.categoria=='Decoração'}">selected</c:if> value="Decoração">Decoração</option>
                            <option <c:if test="${livro.categoria=='Dicionários'}">selected</c:if> value="Dicionários">Dicionários</option>
                            <option <c:if test="${livro.categoria=='Didáticos'}">selected</c:if> value="Didáticos">Didáticos</option>
                            <option <c:if test="${livro.categoria=='Direito'}">selected</c:if> value="Direito">Direito</option>
                            <option <c:if test="${livro.categoria=='Documentos'}">selected</c:if> value="Documentos">Documentos</option>
                            <option <c:if test="${livro.categoria=='Ecologia'}">selected</c:if> value="Ecologia">Ecologia</option>
                            <option <c:if test="${livro.categoria=='Economia'}">selected</c:if> value="Economia">Economia</option>
                            <option <c:if test="${livro.categoria=='Engenharia'}">selected</c:if> value="Engenharia">Engenharia</option>
                            <option <c:if test="${livro.categoria=='Enciclopédias'}">selected</c:if> value="Enciclopédias">Enciclopédias</option>
                            <option <c:if test="${livro.categoria=='Ensino de Idiomas'}">selected</c:if> value="Ensino de Idiomas">Ensino de Idiomas</option>
                            <option <c:if test="${livro.categoria=='Esoterismo'}">selected</c:if> value="Esoterismo">Esoterismo</option>
                            <option <c:if test="${livro.categoria=='Esportes'}">selected</c:if> value="Esportes">Esportes</option>
                            <option <c:if test="${livro.categoria=='Filosofia'}">selected</c:if> value="Filosofia">Filosofia</option>
                            <option <c:if test="${livro.categoria=='Ficção Científica'}">selected</c:if> value="Ficção Científica">Ficção Científica</option>
                            <option <c:if test="${livro.categoria=='Folclore'}">selected</c:if> value="Folclore">Folclore</option>
                            <option <c:if test="${livro.categoria=='Fotografia'}">selected</c:if> value="Fotografia">Fotografia</option>
                            <option <c:if test="${livro.categoria=='Genealogia'}">selected</c:if> value="Genealogia">Genealogia</option>
                            <option <c:if test="${livro.categoria=='Geografia'}">selected</c:if> value="Geografia">Geografia</option>
                            <option <c:if test="${livro.categoria=='Guerra'}">selected</c:if> value="Guerra">Guerra</option>
                            <option <c:if test="${livro.categoria=='História do Brasil'}">selected</c:if> value="História do Brasil">História do Brasil</option>
                            <option <c:if test="${livro.categoria=='História Geral'}">selected</c:if> value="História Geral">História Geral</option>
                            <option <c:if test="${livro.categoria=='Hobbies'}">selected</c:if> value="Hobbies">Hobbies</option>
                            <option <c:if test="${livro.categoria=='Humor'}">selected</c:if> value="Humor">Humor</option>
                            <option <c:if test="${livro.categoria=='Infantojuvenis'}">selected</c:if> value="Infantojuvenis">Infantojuvenis</option>
                            <option <c:if test="${livro.categoria=='Informática'}">selected</c:if> value="Informática">Informática</option>
                            <option <c:if test="${livro.categoria=='Jogos'}">selected</c:if> value="Jogos">Jogos</option>
                            <option <c:if test="${livro.categoria=='Jornais'}">selected</c:if> value="Jornais">Jornais</option>
                            <option <c:if test="${livro.categoria=='Linguística'}">selected</c:if> value="Linguística">Linguística</option>
                            <option <c:if test="${livro.categoria=='Literatura Brasileira'}">selected</c:if> value="Literatura Brasileira">Literatura Brasileira</option>
                            <option <c:if test="${livro.categoria=='Literatura Estrangeira'}">selected</c:if> value="Literatura Estrangeira">Literatura Estrangeira</option>
                            <option <c:if test="${livro.categoria=='Livros Raros'}">selected</c:if> value="Livros Raros">Livros Raros</option>
                            <option <c:if test="${livro.categoria=='Manuscritos'}">selected</c:if> value="Manuscritos">Manuscritos</option>
                            <option <c:if test="${livro.categoria=='Medicina'}">selected</c:if> value="Medicina">Medicina</option>
                            <option <c:if test="${livro.categoria=='Moda'}">selected</c:if> value="Moda">Moda</option>
                            <option <c:if test="${livro.categoria=='Música'}">selected</c:if> value="Música">Música</option>
                            <option <c:if test="${livro.categoria=='Pecuária'}">selected</c:if> value="Pecuária">Pecuária</option>
                            <option <c:if test="${livro.categoria=='Pedagogia'}">selected</c:if> value="Pedagogia">Pedagogia</option>
                            <option <c:if test="${livro.categoria=='Pintura'}">selected</c:if> value="Pintura">Pintura</option>
                            <option <c:if test="${livro.categoria=='Poesia'}">selected</c:if> value="Poesia">Poesia</option>
                            <option <c:if test="${livro.categoria=='Psicologia'}">selected</c:if> value="Psicologia">Psicologia</option>
                            <option <c:if test="${livro.categoria=='Religião'}">selected</c:if> value="Religião">Religião</option>
                            <option <c:if test="${livro.categoria=='Saúde'}">selected</c:if> value="Saúde">Saúde</option>
                            <option <c:if test="${livro.categoria=='Sexualidade'}">selected</c:if> value="Sexualidade">Sexualidade</option>
                            <option <c:if test="${livro.categoria=='Sociologia'}">selected</c:if> value="Sociologia">Sociologia</option>
                            <option <c:if test="${livro.categoria=='Teatro'}">selected</c:if> value="Teatro">Teatro</option>
                            <option <c:if test="${livro.categoria=='Turismo'}">selected</c:if> value="Turismo">Turismo</option>
                            <option <c:if test="${livro.categoria=='Outros Assuntos'}">selected</c:if> value="Outros Assuntos">Outros Assuntos</option>
                        </select>
                    </div>
                    <div class="form-group col-md-4">
                        <label for="paginas">Numero de Paginas</label>
                        <input type="text" name="paginas" class="form-control" id="paginas" value="${livro.paginas}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="ano">Ano de Lançamento</label>
                        <input type="text" name="ano" class="form-control" id="ano" value="${livro.ano}">
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="isbn">ISBN</label>
                        <input type="text" name="isbn" class="form-control" id="isbn" value="${livro.isbn}" required>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="idioma">Idioma</label>
                        <select name="idioma" id="idioma" class="custom-select" required>
                            <option <c:if test="${livro.idioma=='Portugues'}">selected</c:if> value="Portugues">Portugues</option>
                            <option <c:if test="${livro.idioma=='Ingles'}">selected</c:if> value="Ingles">Ingles</option>
                        </select>
                    </div>
                    <div class="form-group col-md-3">
                        <label for="disponivel">Disponivel</label>
                        <select name="disponivel" id="disponivel" class="custom-select" required>
                            <option value="1" <c:if test="${livro.disponivel==1}">selected</c:if>>Sim</option>
                            <option value="2" <c:if test="${livro.disponivel==2}">selected</c:if>>Não</option>
                        </select>
                    </div>
                </div>
                <div class="custom-file my-3 mb-4">
                    <input type="hidden" name="imagemExiste" value="${livro.imagem}">
                    <input type="file" name="imagem" accept=".png, .jpg, .jpeg" class="custom-file-input" id="imagem">
                    <label class="custom-file-label" for="imagem">Imagem</label>
                </div>
                    
                <input class="btn btn-outline-success float-right" type="submit" value="<%=acao%>" onclick="toast()">
                <input class="btn btn-outline-warning float-right mr-3" type="reset" value="Limpar">
            </form>
                    
<%@include file="templates/footer.jsp" %>
