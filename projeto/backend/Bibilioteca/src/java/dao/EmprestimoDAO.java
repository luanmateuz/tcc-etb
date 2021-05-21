package dao;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import model.Cliente;
import model.Emprestimo;
import model.Livro;
import model.Usuario;

/**
 *
 * @author luan
 */
public class EmprestimoDAO extends DatabaseDAO {

    public EmprestimoDAO() throws ClassNotFoundException {
    }
     
    
    public ArrayList<Emprestimo> getLista() throws Exception {

        ArrayList<Emprestimo> lista = new ArrayList<>();
        String SQL = "SELECT *, l.*, c.*, u.*  FROM emprestimo e "
                + "INNER JOIN livro l ON l.idLivro = e.idLivro "
                + "INNER JOIN cliente c ON c.idCliente = e.idCliente "
                + "INNER JOIN usuario u ON u.idUsuario = e.idUsuario";
        this.conectar();
        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SQL)) {

            while (rs.next()) {
                Emprestimo emprestimo = new Emprestimo();
                emprestimo.setIdEmprestimo(rs.getInt("e.idEmprestimo"));
                
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("c.idCliente"));
                cliente.setNome(rs.getString("c.nome"));
                emprestimo.setCliente(cliente);
                
                Livro livro = new Livro();
                livro.setIdLivro(rs.getInt("l.idLivro"));
                livro.setTitulo(rs.getString("l.titulo"));
                livro.setDisponivel(rs.getInt("l.disponivel"));
                emprestimo.setLivro(livro);
                
                Usuario usuario = new Usuario();
                usuario.setIdUsuario(rs.getInt("u.idUsuario"));
                usuario.setNome(rs.getString("u.nome"));
                emprestimo.setUsuario(usuario);
                
                Date data = rs.getDate("dataDevolucao");
                Calendar dataFormatada = Calendar.getInstance();
                dataFormatada.setTime(data);
                emprestimo.setDataDevolucao(dataFormatada);
                
                emprestimo.setStatus(rs.getInt("e.status"));

                lista.add(emprestimo);
            }

            this.desconectar();
        }

        return lista;
    }
 
}
