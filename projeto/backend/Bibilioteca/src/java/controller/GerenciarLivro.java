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
                        mensagem = "Cliente nao encontrado";
                    }
                } else {
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
                        mensagem = "Cliente nao encontrado";
                    }
                } else {
                    mensagem = "Acesso Negado!";
                }
            }
            
            if (acao.equals("deletar")) {
                if (GerenciarLogin.verificarPermissao(request, response)) {
                    int id = Integer.parseInt(idLivro);
                    if (dao.deletar(id)) {
                        mensagem = "Livro deletado!";
                    } else {
                        mensagem = "Erro ao deletar livro!";
                    }
                } else {
                    mensagem = "Acesso negado!";
                }
            }
        } catch (Exception e) {
            out.print(e);
            mensagem = "Erro ao executar";
        }
        out.println("<script type='text/javascript'>");
        out.println("alert('" + mensagem + "')");
        out.println("location.href='index.jsp'");
        out.println("</script>");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String mensagem = "";

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
                Files.copy(input, file.toPath(),  StandardCopyOption.REPLACE_EXISTING);

                livro.setImagem(nomeImagem);
            } catch (IOException ex) {
                System.out.println("Exception: " + ex);
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
        out.println("location.href='index.jsp'");
        out.println("</script>");
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
