package model;

/**
 *
 * @author luan
 */
public class Livro {
    
    private int idLivro;
    private String titulo;
    private String descricao;
    private String autor;
    private String editora;
    private String categoria;
    private int paginas;
    private int ano;
    private String isbn;
    private String idioma;
    private int disponivel;
    private String imagem;

    public Livro() {
    }

    public Livro(int idLivro, String titulo, String descricao, String autor, 
            String editora, String categoria, int paginas, int ano, String isbn,
            String idioma, int disponivel, String imagem) {
        this.idLivro = idLivro;
        this.titulo = titulo;
        this.descricao = descricao;
        this.autor = autor;
        this.editora = editora;
        this.categoria = categoria;
        this.paginas = paginas;
        this.ano = ano;
        this.isbn = isbn;
        this.idioma = idioma;
        this.disponivel = disponivel;
        this.imagem = imagem;
    }

    public int getIdLivro() {
        return idLivro;
    }

    public void setIdLivro(int idLivro) {
        this.idLivro = idLivro;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDescricao() {
        return descricao;
    }

    public void setDescricao(String descricao) {
        this.descricao = descricao;
    }

    public String getAutor() {
        return autor;
    }

    public void setAutor(String autor) {
        this.autor = autor;
    }

    public String getEditora() {
        return editora;
    }

    public void setEditora(String editora) {
        this.editora = editora;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getPaginas() {
        return paginas;
    }

    public void setPaginas(int paginas) {
        this.paginas = paginas;
    }

    public int getAno() {
        return ano;
    }

    public void setAno(int ano) {
        this.ano = ano;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public String getIdioma() {
        return idioma;
    }

    public void setIdioma(String idioma) {
        this.idioma = idioma;
    }

    public int getDisponivel() {
        return disponivel;
    }

    public void setDisponivel(int disponivel) {
        this.disponivel = disponivel;
    }

    public String getImagem() {
        return imagem;
    }

    public void setImagem(String imagem) {
        this.imagem = imagem;
    }

    @Override
    public String toString() {
        return "Livro{" + "idLivro=" + idLivro + ", titulo=" + titulo 
                + ", descricao=" + descricao + ", autor=" + autor + ", editora=" 
                + editora + ", categoria=" + categoria + ", paginas=" 
                + paginas + ", ano=" + ano + ", isbn=" + isbn + ", idioma=" 
                + idioma + ", disponivel=" + disponivel + ", imagem=" + imagem 
                + '}';
    }
    
}
