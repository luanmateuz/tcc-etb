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
                        System.out.println("perfil n encontrado");
                        mensagem = "Perfil não encontrado!";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idPerfil);
                    if (dao.deletar(id)) {
                        mensagem = "Perfil deletado!";
                    } else {
                        mensagem = "Erro ao deletar perfil! Este perfil contem menus vinculados!";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            mensagem = "Erro ao executar";
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_perfil.jsp'");
        out.println("</script>");
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

        try {
            Perfil perfil = new Perfil();
            PerfilDAO dao = new PerfilDAO();

            if (!idPerfil.isEmpty()) {
                perfil.setIdPerfil(Integer.parseInt(idPerfil));
            }

            if (nome.equals("") || nome.isEmpty()) {
                mensagem = "Campos obrigatorios deveram ser preenchidos!";
            } else {
                perfil.setNome(nome);
                if (dao.gravar(perfil)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }
            }

            out.println("<script type='text/javascript'>");
            out.println("alert('" + mensagem + "')");
            out.println("location.href='listar_perfil.jsp'");
            out.println("</script>");
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
