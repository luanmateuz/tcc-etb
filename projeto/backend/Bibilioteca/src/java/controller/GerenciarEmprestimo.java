package controller;

import dao.EmprestimoDAO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Cliente;
import model.Emprestimo;
import model.Livro;
import model.Usuario;

/**
 *
 * @author luan
 */
public class GerenciarEmprestimo extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idEmprestimo = request.getParameter("idEmprestimo");
        String idLivro = request.getParameter("idLivro");
        String idCliente = request.getParameter("idCliente");
        String mensagem = "";

        try {
            Emprestimo emprestimo = new Emprestimo();
            EmprestimoDAO dao = new EmprestimoDAO();

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    emprestimo = dao.getCarregaPorId(Integer.parseInt(idEmprestimo));
                    if (emprestimo.getIdEmprestimo() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_emprestimo.jsp");
                        request.setAttribute("emprestimo", emprestimo);
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        request.setAttribute("dataEntrega", sdf.format(emprestimo.getDataEntrega().getTime()));
                        request.setAttribute("dataDevolucao", sdf.format(emprestimo.getDataDevolucao().getTime()));
                        disp.forward(request, response);
                    } else {
                        mensagem = "Emprestimo nao encontrado";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    emprestimo.setIdEmprestimo(Integer.parseInt(idEmprestimo));
                    if (dao.deletar(emprestimo, Integer.parseInt(idLivro))) {
                        mensagem = "Emprestimo deletado com sucesso!";
                    } else {
                        mensagem = "Erro ao deletar emprestimo do banco de dados";
                    }
                } else {
                    mensagem = "Acesso Negado";
                }
            }

            if (acao.equals("finalizar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    emprestimo.setIdEmprestimo(Integer.parseInt(idEmprestimo));
                    if (dao.finalizar(emprestimo, Integer.parseInt(idLivro), Integer.parseInt(idCliente))) {
                        mensagem = "Emprestimo finalizado com sucesso!";
                    } else {
                        mensagem = "Erro ao finalizar emprestimo no banco de dados";
                    }
                } else {
                    mensagem = "Acesso Negado";
                }
            }

        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_emprestimo.jsp'");
        out.println("</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";

        String idEmprestimo = request.getParameter("idEmprestimo");
        String idUsuario = request.getParameter("idUsuario");
        String idCliente = request.getParameter("idCliente");
        String idLivro = request.getParameter("idLivro");
        String dataEntrega = request.getParameter("dataEntrega");
        Calendar dataEntregaFormatada = null;
        String dataDevolucao = request.getParameter("dataDevolucao");
        Calendar dataDevolucaoFormatada = null;

        try {
            SimpleDateFormat date = new SimpleDateFormat("dd/MM/yyyy");

            Date dateEntrega = date.parse(dataEntrega);
            dataEntregaFormatada = Calendar.getInstance();
            dataEntregaFormatada.setTime(dateEntrega);

            Date dateDevolucao = date.parse(dataDevolucao);
            dataDevolucaoFormatada = Calendar.getInstance();
            dataDevolucaoFormatada.setTime(dateDevolucao);
        } catch (ParseException ex) {
            System.out.println("Exception: " + ex);
            mensagem = "Erro de convesção de data";
        }

        String status = request.getParameter("status");
        String multaMotivo = request.getParameter("multaMotivo");
        String multaValor = request.getParameter("multaValor");
        String multaPaga = request.getParameter("multaPaga");

        Emprestimo emprestimo = new Emprestimo();

        if (!idEmprestimo.isEmpty()) {
            emprestimo.setIdEmprestimo(Integer.parseInt(idEmprestimo));
        }

        Cliente cliente = new Cliente();
        cliente.setIdCliente(Integer.parseInt(idCliente));

        Livro livro = new Livro();
        livro.setIdLivro(Integer.parseInt(idLivro));

        Usuario usuario = new Usuario();
        usuario.setIdUsuario(Integer.parseInt(idUsuario));

        emprestimo.setCliente(cliente);
        emprestimo.setLivro(livro);
        emprestimo.setUsuario(usuario);
        emprestimo.setDataEntrega(dataEntregaFormatada);
        emprestimo.setDataDevolucao(dataDevolucaoFormatada);
        emprestimo.setStatus(Integer.parseInt(status));

        if (!(multaMotivo.isEmpty() && multaPaga.isEmpty())) {
            emprestimo.setMultaMotivo(multaMotivo);
            if (!multaValor.isEmpty()) {
                emprestimo.setMultaValor(Double.parseDouble(multaValor));
            }
            emprestimo.setMultaPaga(Integer.parseInt(multaPaga));
        }

        try {
            EmprestimoDAO dao = new EmprestimoDAO();

            if (dao.gravar(emprestimo)) {
                if (status.equals("3")) {
                    if (dao.finalizar(emprestimo, Integer.parseInt(idLivro), Integer.parseInt(idCliente))) {
                        mensagem = "Gravado com sucesso!\nLivro Disponivel";
                    }
                }
                mensagem = "Gravado com sucesso!";
            } else {
                mensagem = "Erro ao gravar no banco de dados!";
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='listar_emprestimo.jsp'");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
