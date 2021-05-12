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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idMenu = request.getParameter("idMenu");
        String mensagem = "";

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
                        System.out.println("Menu nao encontrado");
                        mensagem = "Menu não encontrado!";
                    }
                } else {
                    mensagem = "Acesso negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idMenu);
                    if (dao.deletar(id)) {
                        mensagem = "Menu deletado!";
                    } else {
                        mensagem = "Erro ao deletar menu!";
                    }
                } else {
                    mensagem = "Acesso negado!";
                }
            }
        } catch (Exception e) {
            out.println(e.getMessage());
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_menu.jsp'");
        out.println("</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String idMenu = request.getParameter("idMenu");
        String nome = request.getParameter("nome");
        String link = request.getParameter("link");
        String icone = request.getParameter("icone");
        String exibir = request.getParameter("exibir");
        String mensagem;

        try {
            Menu menu = new Menu();
            MenuDAO dao = new MenuDAO();

            if (!idMenu.isEmpty()) {
                menu.setIdMenu(Integer.parseInt(idMenu));
            }

            if (nome.equals("") || link.equals("") || exibir.equals("")) {
                mensagem = "Campos obrigatorios deveram ser preenchidos!";
            } else {
                menu.setNome(nome);
                menu.setLink(link);
                menu.setExibir(Integer.parseInt(exibir));

                if (dao.gravar(menu)) {
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }
            }
        } catch (Exception e) {
            out.print(e.getMessage());
            mensagem = "Erro ao executar";
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_menu.jsp'");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
