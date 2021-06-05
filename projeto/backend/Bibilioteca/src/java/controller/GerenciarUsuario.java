package controller;

import dao.UsuarioDAO;
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
import model.Perfil;
import model.Usuario;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author luan
 */
public class GerenciarUsuario extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idUsuario = request.getParameter("idUsuario");
        String mensagem = "";
        String icon = "";
        String titulo = "";
        String link = "";

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
                        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                        request.setAttribute("dataNascimento", sdf.format(usuario.getDataNascimento().getTime()));
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "Usuario nao encontrado";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    usuario.setIdUsuario(Integer.parseInt(idUsuario));
                    if (dao.deletar(usuario)) {
                        icon = "success";
                        titulo = "Sucesso!";
                        mensagem = "Desativado com sucesso";
                    } else {
                        icon = "error";
                        titulo = "Erro";
                        mensagem = "erro ao desativar o usuario";
                    }
                } else {
                    icon = "error";
                    titulo = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }
        } catch (Exception e) {
            out.print(e);
            icon = "error";
            titulo = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(icon, titulo, mensagem, link, response, request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";
        String link = "";
        String icon = "";
        String titulo = "";

        String idUsuario = request.getParameter("idUsuario");
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
            mensagem = "Erro de convesção de data";
        }

        String sexo = request.getParameter("sexo");
        String cpf = request.getParameter("cpf");
        String rg = request.getParameter("rg");
        String idPerfil = request.getParameter("idPerfil");
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");
        String confirmarSenha = request.getParameter("confirmarSenha");
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

        Usuario usuario = new Usuario();

        if (!idUsuario.isEmpty()) {
            usuario.setIdUsuario(Integer.parseInt(idUsuario));
        }

        if (nome.equals("") || login.equals("") || senha.equals("") || status.equals("") || idPerfil.equals("")) {
            icon = "error";
            titulo = "Erro";
            mensagem = "Todos os campos devem ser preenchidos!";
        }

        if (!senha.trim().equals(confirmarSenha.trim())) {
            link = "/gerenciar_usuario.do?acao=alterar&idUsuario=" + idUsuario;
            icon = "error";
            titulo = "Erro";
            mensagem = "Por favor, confirme a senha";
        } else {
            usuario.setNome(nome);
            usuario.setSobrenome(sobrenome);
            usuario.setDataNascimento(dataNascimentoFormatada);
            usuario.setSexo(sexo);
            usuario.setCpf(cpf);
            usuario.setRg(rg);

            Perfil perfil = new Perfil();
            perfil.setIdPerfil(Integer.parseInt(idPerfil));

            usuario.setPerfil(perfil);

            usuario.setLogin(login);

            String complexidade = BCrypt.gensalt(11);
            usuario.setSenha(BCrypt.hashpw(senha, complexidade));

            usuario.setStatus(Integer.parseInt(status));
            usuario.setEmail(email);
            usuario.setTelefone(telefone);
            usuario.setCep(cep);
            usuario.setRua(rua);
            usuario.setNumero(Integer.parseInt(numero));
            usuario.setUf(uf);
            usuario.setBairro(bairro);
            usuario.setCidade(cidade);
            usuario.setComplemento(complemento);

            try {
                UsuarioDAO dao = new UsuarioDAO();

                if (dao.gravar(usuario)) {
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

        exibirMensagem(icon, titulo, mensagem, link, response, request);
    }

    private static void exibirMensagem(String icon, String title, String mensagem, String link, HttpServletResponse response, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
            dispatcher.include(request, response);
            String redirect = request.getContextPath() + "/listar_usuario.jsp";

            if (!link.isEmpty()) {
                redirect = request.getContextPath() + link;
            }

            out.println("<script>showAlertBase('" + icon + "', '" + title + "', '" + mensagem + "', '" + redirect + "'); </script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
