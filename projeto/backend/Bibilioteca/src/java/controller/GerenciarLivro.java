package controller;

import dao.LivroDAO;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import model.Livro;

/**
 *
 * @author luan
 */
@MultipartConfig
public class GerenciarLivro extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String acao = request.getParameter("acao");
        String idLivro = request.getParameter("idLivro");
        String mensagem = "";
        String icon = "";
        String tituloAlert = "";

        try {
            Livro livro = new Livro();
            LivroDAO dao = new LivroDAO();

            if (acao.equals("exibir")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    livro = dao.getCarregaPorId(Integer.parseInt(idLivro));
                    if (livro.getIdLivro() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/exibir_livro.jsp");
                        request.setAttribute("livro", livro);
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        tituloAlert = "Erro";
                        mensagem = "Livro nao encontrado";
                    }
                } else {
                    icon = "error";
                    tituloAlert = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("alterar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    livro = dao.getCarregaPorId(Integer.parseInt(idLivro));
                    if (livro.getIdLivro() > 0) {
                        RequestDispatcher disp = getServletContext()
                                .getRequestDispatcher("/form_livro.jsp");
                        request.setAttribute("livro", livro);
                        disp.forward(request, response);
                    } else {
                        icon = "error";
                        tituloAlert = "Erro";
                        mensagem = "Livro nao encontrado";
                    }
                } else {
                    icon = "error";
                    tituloAlert = "Erro";
                    mensagem = "Acesso Negado!";
                }
            }

            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idLivro);
                    if (dao.deletar(id)) {
                        icon = "success";
                        tituloAlert = "Sucesso";
                        mensagem = "Livro deletado!";
                    } else {
                        icon = "error";
                        tituloAlert = "Erro";
                        mensagem = "Erro ao deletar livro!";
                    }
                } else {
                    icon = "error";
                    tituloAlert = "Erro";
                    mensagem = "Acesso negado!";
                }
            }
        } catch (Exception e) {
            out.print(e);
            icon = "error";
            tituloAlert = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(icon, tituloAlert, mensagem, response, request);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";
        String icon = "";
        String tituloAlert = "";

        String idLivro = request.getParameter("idLivro");
        String titulo = request.getParameter("titulo");
        String descricao = request.getParameter("descricao");
        String autor = request.getParameter("autor");
        String editora = request.getParameter("editora");
        String categoria = request.getParameter("categoria");
        String paginas = request.getParameter("paginas");
        String ano = request.getParameter("ano");
        String isbn = request.getParameter("isbn");
        String idioma = request.getParameter("idioma");
        String disponivel = request.getParameter("disponivel");
        Part imagem = request.getPart("imagem");
        String imagemExiste = request.getParameter("imagemExiste");

        Livro livro = new Livro();

        if (!imagem.getSubmittedFileName().isEmpty()) {
            String pastaUpload = request.getServletContext().getRealPath("/assets/img/livros");
            File diretorioUpload = new File(pastaUpload);

            if (!diretorioUpload.exists()) {
                diretorioUpload.mkdir();
            }

            String nomeImagem = Paths.get(imagem.getSubmittedFileName()).getFileName().toString();
            InputStream conteudoImagem = imagem.getInputStream();

            File file = new File(pastaUpload, nomeImagem);

            try (InputStream input = conteudoImagem) {
                Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);

                livro.setImagem(nomeImagem);
            } catch (IOException ex) {
                System.out.println("Exception: " + ex);
                icon = "error";
                tituloAlert = "Erro";
                mensagem = "Erro ao fazer upload de imagem";
            }
        } else {
            livro.setImagem(imagemExiste);
        }

        if (!idLivro.isEmpty()) {
            livro.setIdLivro(Integer.parseInt(idLivro));
        }

        livro.setTitulo(titulo);
        livro.setDescricao(descricao);
        livro.setAutor(autor);
        livro.setEditora(editora);
        livro.setCategoria(categoria);
        livro.setPaginas(Integer.parseInt(paginas));
        livro.setAno(Integer.parseInt(ano));
        livro.setIsbn(isbn);
        livro.setIdioma(idioma);
        livro.setDisponivel(Integer.parseInt(disponivel));

        try {
            LivroDAO dao = new LivroDAO();
            if (dao.gravar(livro)) {
                icon = "success";
                tituloAlert = "Sucesso";
                mensagem = "Gravado com sucesso!";
            } else {
                icon = "error";
                tituloAlert = "Erro";
                mensagem = "Erro ao gravar no banco de dados!";
            }
        } catch (Exception e) {
            out.print(e);
            icon = "error";
            tituloAlert = "Erro";
            mensagem = "Erro ao executar";
        }

        exibirMensagem(icon, tituloAlert, mensagem, response, request);
    }

    private static void exibirMensagem(String icon, String title, String mensagem, HttpServletResponse response, HttpServletRequest request) {

        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            RequestDispatcher dispatcher = request.getRequestDispatcher("templates/base.jsp");
            dispatcher.include(request, response);
            String redirect = request.getContextPath() + "/index.jsp";

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
