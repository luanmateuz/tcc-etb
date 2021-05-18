package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Livro;

/**
 *
 * @author luan
 */
public class LivroDAO extends DatabaseDAO {

    public LivroDAO() throws ClassNotFoundException {
    }

    public ArrayList<Livro> getLista() {
        ArrayList<Livro> lista = new ArrayList<Livro>();

        try {
            this.conectar();
            String sql = "SELECT idLivro, titulo, imagem FROM livro";
            PreparedStatement pstmt = this.conn.prepareStatement(sql);
            ResultSet rs = pstmt.executeQuery();

            while (rs.next()) {
                Livro livro = new Livro();
                livro.setIdLivro(rs.getInt("idLivro"));
                livro.setTitulo(rs.getString("titulo"));
                livro.setImagem(rs.getString("imagem"));

                lista.add(livro);
            }

            rs.close();
            pstmt.close();
            this.conn.close();
        } catch (SQLException ex) {
            System.out.println("Exception: " + ex);
        }

        return lista;
    }

    public boolean gravar(Livro livro) {

        try {
            String sql;
            this.conectar();

            if (livro.getIdLivro() == 0) {
                sql = "INSERT INTO livro (titulo, descricao, autor, "
                        + "editora, categoria, paginas, ano, isbn, idioma, "
                        + "disponivel, imagem) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            } else {
                sql = "UPDATE livro SET titulo = ?, descricao = ?, autor = ?, "
                        + "editora = ?, categoria = ?, paginas = ?, ano = ?, "
                        + "isbn = ?, idioma = ?, disponivel = ?, imagem = ?"
                        + " WHERE idLivro = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, livro.getTitulo());
            stmt.setString(2, livro.getDescricao());
            stmt.setString(3, livro.getAutor());
            stmt.setString(4, livro.getEditora());
            stmt.setString(5, livro.getCategoria());
            stmt.setInt(6, livro.getPaginas());
            stmt.setInt(7, livro.getAno());
            stmt.setString(8, livro.getIsbn());
            stmt.setString(9, livro.getIdioma());
            stmt.setInt(10, livro.getDisponivel());
            stmt.setString(11, livro.getImagem());

            if (livro.getIdLivro() > 0) {
                stmt.setInt(12, livro.getIdLivro());
            }

            stmt.execute();
            this.desconectar();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }
    
    public boolean deletar(int id) {

        try {
            String sql = "DELETE FROM livro WHERE idLivro = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            this.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
            return false;
        }
    }

    public Livro getCarregaPorId(int id) throws SQLException {

        Livro livro = new Livro();
        String slq = "SELECT * FROM livro WHERE idLivro = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(slq);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            livro.setIdLivro(rs.getInt("idLivro"));
            livro.setTitulo(rs.getString("titulo"));
            livro.setDescricao(rs.getString("descricao"));
            livro.setAutor(rs.getString("autor"));
            livro.setEditora(rs.getString("editora"));
            livro.setCategoria(rs.getString("categoria"));
            livro.setPaginas(rs.getInt("paginas"));
            livro.setAno(rs.getInt("ano"));
            livro.setIsbn(rs.getString("isbn"));
            livro.setIdioma(rs.getString("idioma"));
            livro.setDisponivel(rs.getInt("disponivel"));
            livro.setImagem(rs.getString("imagem"));
        }

        this.desconectar();
        return livro;
    }

}
