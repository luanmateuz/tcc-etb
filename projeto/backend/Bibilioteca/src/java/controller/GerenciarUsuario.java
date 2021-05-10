package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Perfil;
import model.Usuario;

/**
 *
 * @author luan
 */
public class GerenciarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idUsuario = request.getParameter("idUsuario");
        String mensagem = "";

        try {
            Usuario usuario = new Usuario();
            UsuarioDAO dao = new UsuarioDAO();

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    usuario = dao.getCarregaPorId(Integer.parseInt(idUsuario));
                    if (usuario.getIdUsuario() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_usuario.jsp");
                        request.setAttribute("usuario", usuario);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Usuario nao encontrado";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    usuario.setIdUsuario(Integer.parseInt(idUsuario));
                    if (dao.deletar(usuario)) {
                        mensagem = "Desativado com sucesso";
                    } else {
                        mensagem = "erro ao desativar o usuario";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_usuario.jsp'");
        out.println("</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        String idUsuario = request.getParameter("idUsuario");
        String nome = request.getParameter("nome");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String status = request.getParameter("status");
        String idPerfil = request.getParameter("idPerfil");

        String mensagem = "";

        Usuario usuario = new Usuario();

        if (!idUsuario.isEmpty()) {
            usuario.setIdUsuario(Integer.parseInt(idUsuario));
        }
        if (nome.equals("") || login.equals("") || senha.equals("") || status.equals("") || idPerfil.equals("")) {
            mensagem = "Todos os campos devem ser preenchidos!";
        } else {
            usuario.setNome(nome);
            usuario.setLogin(login);
            usuario.setSenha(senha);
            usuario.setStatus(Integer.parseInt(status));

            Perfil perfil = new Perfil();
            perfil.setIdPerfil(Integer.parseInt(idPerfil));

            usuario.setPerfil(perfil);

            try {
                UsuarioDAO dao = new UsuarioDAO();

                if (dao.gravar(usuario)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }

                out.println("<script type='text/javascript'>");
                out.println("alert('" + mensagem + "')");
                out.println("location.href='listar_usuario.jsp'");
                out.println("</script>");
            } catch (Exception e) {
                out.print(e);
                mensagem = "Erro ao executar";
            }
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
