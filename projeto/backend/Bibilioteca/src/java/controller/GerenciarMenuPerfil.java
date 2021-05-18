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
                        mensagem = "Perfil nao encontrado!";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("desvincular")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    String idMenu = request.getParameter("idMenu");
                    if (idMenu.equals("")) {
                        mensagem = "O campo idMenu deve ser selecionado!";
                    } else {
                        if (dao.desvincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))) {
                            mensagem = "Desvinculado com sucesso!";
                        } else {
                            mensagem = "Erro ao desvincular!";
                        }
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print("Erro: " + e);
            mensagem = "Erro ao executar!";
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=" + idPerfil + "'");
        out.println("</script>");
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

        try {

            if (idPerfil.equals("") || idMenu.equals("")) {
                mensagem = "Campos obrigatorios devem ser selecionados";
            } else {
                PerfilDAO dao = new PerfilDAO();
                if (dao.vincular(Integer.parseInt(idMenu), Integer.parseInt(idPerfil))) {
                    mensagem = "Vinculado com sucesso";
                } else {
                    mensagem = "Erro ao vincular o menu ao perfil";
                }
            }
        } catch (ClassNotFoundException | NumberFormatException e) {
            out.print("Error: " + e);
            mensagem = "Erro ao executar";
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='gerenciar_menu_perfil.do?acao=gerenciar&idPerfil=" + idPerfil + "'");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
