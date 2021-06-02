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
public class GerenciarPerfil extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";
        String icon = "";
        String titulo = "";

        String acao = request.getParameter("acao");
        String idPerfil = request.getParameter("idPerfil");

        try {
            Perfil perfil = new Perfil();
            PerfilDAO dao = new PerfilDAO();

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    perfil = dao.getCarregaPorId(Integer.parseInt(idPerfil));
                    if (perfil.getIdPerfil() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_perfil.jsp");
                        request.setAttribute("perfil", perfil);
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Perfil não encontrado!";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idPerfil);
                    if (dao.deletar(id)) {
                        icon = "success";
                        titulo = "Sucesso!";
                        mensagem = "Perfil deletado!";
                    } else {
                        icon = "error";
                        titulo = "Erro ao deletar Perfil";
                        mensagem = "Este perfil contem menus vinculados!";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(icon, titulo, mensagem, response, request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idPerfil = request.getParameter("idPerfil");
        String nome = request.getParameter("nome");
        String mensagem = "";
        String icon = "";
        String titulo = "";

        try {
            Perfil perfil = new Perfil();
            PerfilDAO dao = new PerfilDAO();

            if (!idPerfil.isEmpty()) {
                perfil.setIdPerfil(Integer.parseInt(idPerfil));
            }

            if (nome.equals("") || nome.isEmpty()) {
                icon = "error";
                titulo = "Erro";
                mensagem = "Campos obrigatorios deveram ser preenchidos!";
            } else {
                perfil.setNome(nome);
                if (dao.gravar(perfil)) {
                    icon = "success";
                    titulo = "Sucesso!";
                    mensagem = "Gravado com sucesso!";
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Erro ao gravar no banco de dados!";
                }
            }

        } catch (Exception e) {
            out.print(e);
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(icon, titulo, mensagem, response, request);
    }

    private static void exibirMensagem(String icon, String title, String mensagem, HttpServletResponse response, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
            dispatcher.include(request, response);
            String redirect = request.getContextPath() + "/listar_perfil.jsp";

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
