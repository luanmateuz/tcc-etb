package controller;

import dao.PerfilDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;

/**
 *
 * @author luan
 */
public class GerenciarMenuPerfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");
        String mensagem = "";
        String icon = "";
        String titulo = "";
        String link = "";

        try {
            Perfil perfil = new Perfil();
            PerfilDAO dao = new PerfilDAO();

            if (acao.equals("gerenciar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    perfil = dao.getCarregaPorId(Integer.parseInt(idPerfil));
                    if (perfil.getIdPerfil() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_menu_perfil.jsp");
                        request.setAttribute("perfilv", perfil);
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Perfil nao encontrado!";
                        link = "/listar_perfil.jsp";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("desvincular")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    String idMenu = request.getParameter("idMenu");
                    if (idMenu.equals("")) {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "O campo idMenu deve ser selecionado!";
                    } else {
                        if (dao.desvincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))) {
                            icon = "success";
                            titulo = "Sucesso!";
                            mensagem = "Desvinculado com sucesso!";
                        } else {
                            icon = "error";
                            titulo = "Erro";
                            mensagem = "Erro ao desvincular!";
                        }
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print("Erro: " + e);
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro ao executar!";
        }

        exibirMensagem(idPerfil, icon, titulo, mensagem, link, response, request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idPerfil = request.getParameter("idPerfil");
        String idMenu = request.getParameter("idMenu");
        String mensagem = "";
        String icon = "";
        String titulo = "";
        String link = "";

        try {

            if (idPerfil.equals("") || idMenu.equals("")) {
                icon = "error";
                titulo = "Erro";
                mensagem = "Campos obrigatorios devem ser selecionados";
            } else {
                PerfilDAO dao = new PerfilDAO();
                if (dao.vincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))) {
                    icon = "success";
                    titulo = "Sucesso!";
                    mensagem = "Vinculado com sucesso";
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Erro ao vincular o menu ao perfil";
                }
            }
        } catch (ClassNotFoundException | NumberFormatException e) {
            out.print("Error: " + e);
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(idPerfil, icon, titulo, mensagem, link, response, request);
    }

    private static void exibirMensagem(String idPerfil, String icon, String title, String mensagem, String link, HttpServletResponse response, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
            dispatcher.include(request, response);
            String redirect = request.getContextPath() + "/gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=" + idPerfil;

            if (!link.isEmpty()) {
                redirect = request.getContextPath() + link;
            }
            out.println("<script>showAlertBase('" + icon + "', '" + title + "', '" + mensagem + "', '" + redirect + "');</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
