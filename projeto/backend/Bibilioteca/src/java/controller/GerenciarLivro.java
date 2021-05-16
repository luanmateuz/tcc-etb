/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.LivroDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Livro;

/**
 *
 * @author loost
 */
public class GerenciarLivro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idLivro = request.getParameter("idLivro");
        String mensagem = "";
        
        try {
            Livro livro = new Livro();
            LivroDAO dao = new LivroDAO();
            
            if (acao.equals("exibir")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    livro = dao.getCarregaPorId(Integer.parseInt(idLivro));
                    if (livro.getIdLivro()> 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/exibir_livro.jsp");
                        request.setAttribute("livro", livro);
                        disp.forward(request, response);
                    } else {
                        mensagem = "Cliente nao encontrado";
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
        out.println("location.href='listar_cliente.jsp'");
        out.println("</script>");
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
