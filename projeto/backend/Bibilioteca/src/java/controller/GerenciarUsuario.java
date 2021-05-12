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
            out.println("Erro de convesção de data");
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

        String mensagem = "";
        String pagina = "location.href='listar_usuario.jsp'";

        Usuario usuario = new Usuario();

        if (!idUsuario.isEmpty()) {
            usuario.setIdUsuario(Integer.parseInt(idUsuario));
        }
        if (nome.equals("") || login.equals("") || senha.equals("") || status.equals("") || idPerfil.equals("")) {
            mensagem = "Todos os campos devem ser preenchidos!";
        }
        System.out.println("Senha: " + senha);
        System.out.println("Confirmar Senha: " + confirmarSenha);
        if (!senha.equals(confirmarSenha)) {
            pagina = "history.back()";
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
            usuario.setSenha(senha);
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
                    mensagem = "Gravado com sucesso!";
                } else {
                    mensagem = "Erro ao gravar no banco de dados!";
                }

            } catch (Exception e) {
                out.print(e);
                mensagem = "Erro ao executar";
            }
        }

        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println(pagina);
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
