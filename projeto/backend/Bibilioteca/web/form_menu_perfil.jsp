<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="templates/header.jsp" %>

            <nav class="navbar-expand-lg navbar-light pt-3">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a href="listar_perfil.jsp" class="btn btn-outline-secondary">Voltar</a>
                    </li>
                </ul>
            </nav>
            
            <div class="custom-md-container">
                <form action="gerenciar_menu_perfil.do" method="post">
                    <input type="hidden" name="idPerfil" value="${perfilv.idPerfil}"/>
                    <div class="row">
                        <div class="form-group col-sm-6">
                            <label for="perfil" class="h2 mb-1 text-left font-weight-bold">👤 ${perfilv.nome}</label>
                        </div>
                    </div>

                    <label for="menu" class="control-label h5 font-weight-bold">📋 Menus</label>
                    <div class="input-group mb-3">
                        <select class="custom-select"  name="idMenu" required id="idMenu">
                            <option value="">Selecione o menu</option>
                            <c:forEach var="menu" items="${perfilv.naoMenus}">
                                <option value="${menu.idMenu}">${menu.nome}</option>
                            </c:forEach>
                        </select>
                        <div class="input-group-append">
                          <button class="btn btn-outline-success" >Vincular</button>
                        </div>
                     </div>
                </form>
                    
                    

                <table class="table table-hover custom-md-container" id="listarMenu">
                    <tr>
                        <th scope="col">ID</th>
                        <th scope="col">Menu</th>
                        <th scope="col">Link</th>
                        <th scope="col">Exibir</th>
                        <th scope="col">Desvincular</th>
                    </tr>
                    <tbody>
                        <c:forEach var="menu" items="${perfilv.menus}">

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
                                    <button class="btn btn-warning" onclick="swalWithBootstrap('Menu ${menu.nome}','gerenciar_menu_perfil.do?acao=desvincular&idMenu=' + ${menu.idMenu} + '&idPerfil=' + ${perfilv.idPerfil})">
                                        <i class="bi-trash" style="font-size: 16px; color: white;"></i>
                                    </button>
                                </td>
                            </tr>

                        </c:forEach>
                    </tbody>
                </table>
            </div>   
                    
<%@include file="templates/footer.jsp" %>