package controller;

import dao.MenuDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Menu;

/**
 *
 * @author luan
 */
public class GerenciarMenu extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idMenu = request.getParameter("idMenu");
        
        String mensagem = "";
        String icon = "";
        String titulo = "";

        try {
            Menu menu = new Menu();
            MenuDAO dao = new MenuDAO();

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    menu = dao.getCarregaPorId(Integer.parseInt(idMenu));
                    if (menu.getIdMenu() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_menu.jsp");
                        request.setAttribute("menu", menu);
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Menu não encontrado!";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idMenu);
                    if (dao.deletar(id)) {
                        icon = "success";
                        titulo = "Sucesso!";
                        mensagem = "Menu deletado!";
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Erro ao deletar menu!";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso negado!";
                }
            }
        } catch (Exception e) {
            out.println(e.getMessage());
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
        String idMenu = request.getParameter("idMenu");
        String nome = request.getParameter("nome");
        String link = request.getParameter("link");
        String exibir = request.getParameter("exibir");

        String mensagem = "";
        String icon = "";
        String titulo = "";

        try {
            Menu menu = new Menu();
            MenuDAO dao = new MenuDAO();

            if (!idMenu.isEmpty()) {
                menu.setIdMenu(Integer.parseInt(idMenu));
            }

            if (nome.equals("") || link.equals("") || exibir.equals("")) {
                icon = "error";
                titulo = "Erro";
                mensagem = "Campos obrigatorios deveram ser preenchidos!";
            } else {
                menu.setNome(nome);
                menu.setLink(link);
                menu.setExibir(Integer.parseInt(exibir));

                if (dao.gravar(menu)) {
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
            out.print(e.getMessage());
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
            String redirect = request.getContextPath() + "/listar_menu.jsp";

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
