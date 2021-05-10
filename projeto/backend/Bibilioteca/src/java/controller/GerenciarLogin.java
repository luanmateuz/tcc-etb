package controller;

import dao.UsuarioDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Menu;
import model.Usuario;

/**
 *
 * @author luan
 */
public class GerenciarLogin extends HttpServlet {

    private static ServletResponse response;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getSession().removeAttribute("ulogado");
        response.sendRedirect("form_login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.response = response;
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        try {
            UsuarioDAO dao = new UsuarioDAO();
            Usuario usuario = new Usuario();
            usuario = dao.getRecuperarUsuario(login);

            if (usuario.getIdUsuario() > 0 && usuario.getSenha().equals(senha)) {
                HttpSession sessao = request.getSession();
                sessao.setAttribute("ulogado", usuario);
                response.sendRedirect("index.jsp");
            } else {
                exibirMensagem("Login ou Senha invalidos!", request);
            }
        } catch (Exception e) {
            System.out.println("Exception: " + e);
            exibirMensagem("Usuario ou Perfil nao encontrado!");
        }

    }

    private static void exibirMensagem(String mensagem) {

        try {
            PrintWriter out = response.getWriter();
            response.setContentType("text/html;charset=UTF-8");
            out.println("<script src='assets/lib/sweetalert2/sweetalert2.all.min.js'></script>");
            out.println("<script src='assets/js/alerts.js'></script>");
            out.println("<script>showAlertSimple('error','Erro', '" + mensagem + "')</script>");
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    private static void exibirMensagem(String mensagem, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("form_login.jsp");
            dispatcher.include(request, response);
            
            out.println("<script>showAlertSimple('error','Erro', '" + mensagem + "');</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static Usuario verificarAcesso(HttpServletRequest request, HttpServletResponse response) {
        Usuario usuario = null;
        GerenciarLogin.response = response;

        try {
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("ulogado") == null) {
                response.sendRedirect("form_login.jsp");
            } else {
                String uri = request.getRequestURI();
                String queryString = request.getQueryString();
                if (queryString != null) {
                    uri += "?" + queryString;
                }
                usuario = (Usuario) request.getSession().getAttribute("ulogado");
                if (usuario == null) {
                    sessao.setAttribute("mensagem", "Voce não esta autenticado");
                    response.sendRedirect("form_login.jsp");
                } else {
                    boolean possuiAcesso = false;
                    for (Menu menu : usuario.getPerfil().getMenus()) {
                        if (uri.contains(menu.getLink())) {
                            possuiAcesso = true;
                            break;
                        }
                    }
                    if (!possuiAcesso) {
                        exibirMensagem("Acesso negado!");
                    }
                }
            }
        } catch (Exception e) {
            exibirMensagem("Exceção: " + e.getMessage());
        }

        return usuario;
    }

    public static boolean verificarPermissao(HttpServletRequest request, HttpServletResponse response) {
        Usuario usuario = null;
        GerenciarLogin.response = response;
        boolean possuiAcesso = false;

        try {
            HttpSession sessao = request.getSession();
            if (sessao.getAttribute("ulogado") == null) {
                response.sendRedirect("form_login.jsp");
            } else {
                String uri = request.getRequestURI();
                String queryString = request.getQueryString();
                if (queryString != null) {
                    uri += "?" + queryString;
                }
                usuario = (Usuario) request.getSession().getAttribute("ulogado");
                if (usuario == null) {
                    sessao.setAttribute("mensagem", "Voce não esta autenticado");
                    response.sendRedirect("form_login.jsp");
                } else {
                    for (Menu menu : usuario.getPerfil().getMenus()) {
                        if (uri.contains(menu.getLink())) {
                            possuiAcesso = true;
                            break;
                        }
                    }
                }
            }
        } catch (Exception e) {
            exibirMensagem("Exceção: " + e.getMessage());
        }

        return possuiAcesso;
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
