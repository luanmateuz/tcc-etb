package controller;

import dao.ClienteDAO;
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

/**
 *
 * @author luan
 */
public class GerenciarCliente extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idCliente = request.getParameter("idCliente");
        String mensagem = "";
        String icon = "";
        String titulo = "";

        try {
            Cliente cliente = new Cliente();
            ClienteDAO dao = new ClienteDAO();

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    cliente = dao.getCarregaPorId(Integer.parseInt(idCliente));
                    if (cliente.getIdCliente() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_cliente.jsp");
                        request.setAttribute("cliente", cliente);
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        request.setAttribute("dataNascimento", sdf.format(cliente.getDataNascimento().getTime()));
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Cliente nao encontrado";
                    }
                } else {
                    icon = "error";
                    titulo = "Acesso Negado!";
                    mensagem = "O Usuario n??o tem acesso!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    cliente.setIdCliente(Integer.parseInt(idCliente));
                    if (dao.deletar(cliente)) {
                        icon = "success";
                        titulo = "Sucesso!";
                        mensagem = "Desativado com sucesso!";
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Erro ao desativar o Cliente!";
                    }
                } else {
                    icon = "error";
                    titulo = "Acesso Negado!";
                    mensagem = "O Usuario n??o tem acesso!";
                }
            }

        } catch (Exception e) {
            out.print(e);
            icon = "error";
            titulo = "Erro ao executar";
            mensagem = "Ocorreu um erro ao executar";
        }
        
        exibirMensagem(icon, titulo, mensagem, response, request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";
        String icon = "";
        String titulo = "";

        String idCliente = request.getParameter("idCliente");
        String nome = request.getParameter("nome");
        String sobrenome = request.getParameter("sobrenome");
        String dataNascimento = request.getParameter("dataNascimento");
        Calendar dataNascimentoFormatada = null;

        try {
            Date date = new SimpleDateFormat("dd/MM/yyyy")
                    .parse(dataNascimento);
            dataNascimentoFormatada = Calendar.getInstance();
            dataNascimentoFormatada.setTime(date);
        } catch (ParseException ex) {
            System.out.println("Exception: " + ex);
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro de conves????o de data";
        }

        String sexo = request.getParameter("sexo");
        String cpf = request.getParameter("cpf");
        String status = request.getParameter("status");
        String email = request.getParameter("email");
        String telefone = request.getParameter("telefone");
        String cep = request.getParameter("cep");
        String rua = request.getParameter("rua");
        String numero = request.getParameter("numero");
        String uf = request.getParameter("uf");
        String bairro = request.getParameter("bairro");
        String cidade = request.getParameter("cidade");
        String complemento = request.getParameter("complemento");

        Cliente cliente = new Cliente();

        if (!idCliente.isEmpty()) {
            cliente.setIdCliente(Integer.parseInt(idCliente));
        }

        if (nome.equals("")) {
            icon = "error";
            titulo = "Ero";
            mensagem = "Todos os campos devem ser preenchidos!";
        } else {
            cliente.setNome(nome);
            cliente.setSobrenome(sobrenome);
            cliente.setDataNascimento(dataNascimentoFormatada);
            cliente.setSexo(sexo);
            cliente.setCpf(cpf);
            cliente.setStatus(Integer.parseInt(status));
            cliente.setEmail(email);
            cliente.setTelefone(telefone);
            cliente.setCep(cep);
            cliente.setRua(rua);
            cliente.setNumero(Integer.parseInt(numero));
            cliente.setUf(uf);
            cliente.setBairro(bairro);
            cliente.setCidade(cidade);
            cliente.setComplemento(complemento);

            try {
                ClienteDAO dao = new ClienteDAO();

                if (dao.gravar(cliente)) {
                    icon = "success";
                    titulo = "Sucesso!";
                    mensagem = "Gravado com sucesso!";
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Erro ao gravar no banco de dados!";
                }

            } catch (Exception e) {
                out.print(e);
                icon = "error";
                titulo = "Erro";
                mensagem = "Erro ao executar";
            }
        }

        exibirMensagem(icon, titulo, mensagem, response, request);
    }

    private static void exibirMensagem(String icon, String title, String mensagem, HttpServletResponse response, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
            dispatcher.include(request, response);
            String redirect = request.getContextPath() + "/listar_cliente.jsp";

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
