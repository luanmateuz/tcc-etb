package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
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
                + "INNER JOIN usuario u ON u.idUsuario = e.idUsuario "
                + "ORDER BY e.idEmprestimo DESC";
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
                
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                Date dataHoje = new Date(System.currentTimeMillis());
                System.out.println("dataDevolucao = " + rs.getDate("dataDevolucao"));
//                String dataHoje = sdf.format(Calendar.getInstance().getTime());
                System.out.println("dataHoje = " + dataHoje.toString());
                System.out.println("Comparaçao After = " + dataHoje.after(data));

                emprestimo.setStatus(rs.getInt("e.status"));

                System.out.println("Status = " + emprestimo.getStatus());
                
                if (dataHoje.after(data) && emprestimo.getStatus() == 1) {
                    System.out.println("Atrasado");
                    System.out.println("Metodo Multado [Cliente] = " + this.multado(3, cliente.getIdCliente()));
                    System.out.println("Metodo Atrasado [Emprestimo] = " + this.atrasado(emprestimo.getIdEmprestimo()));
                }
                
                System.out.println("");
                lista.add(emprestimo);
            }

            this.desconectar();
        }

        return lista;
    }

    public boolean gravar(Emprestimo emprestimo) {

        try {
            String sql;
            this.conectar();

            if (emprestimo.getIdEmprestimo() == 0) {
                sql = "INSERT INTO emprestimo (dataEntrega, dataDevolucao, "
                        + "idCliente, idUsuario, idLivro, multaMotivo, multaValor,"
                        + " multaPaga, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
            } else {
                sql = "UPDATE emprestimo SET dataEntrega = ?, dataDevolucao = ?, "
                        + "idCliente = ?, idUsuario = ?, idLivro = ?, multaMotivo = ?, "
                        + "multaValor = ?, multaPaga = ?, status = ? WHERE idEmprestimo = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setDate(1, new Date(emprestimo
                    .getDataEntrega().getTimeInMillis()));
            stmt.setDate(2, new Date(emprestimo
                    .getDataDevolucao().getTimeInMillis()));
            stmt.setInt(3, emprestimo.getCliente().getIdCliente());
            stmt.setInt(4, emprestimo.getUsuario().getIdUsuario());
            stmt.setInt(5, emprestimo.getLivro().getIdLivro());
            this.disponivel(2, emprestimo.getLivro().getIdLivro());
            stmt.setString(6, emprestimo.getMultaMotivo());
            stmt.setDouble(7, emprestimo.getMultaValor());
            stmt.setInt(8, emprestimo.getMultaPaga());
            stmt.setInt(9, emprestimo.getStatus());

            if (emprestimo.getIdEmprestimo() > 0) {
                stmt.setInt(10, emprestimo.getIdEmprestimo());
            }

            stmt.execute();
            this.desconectar();

            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean disponivel(int status, int idLivro) {

        try {
            String sql = "UPDATE livro SET disponivel = ? WHERE idLivro = ? ";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, status);
            stmt.setInt(2, idLivro);
            stmt.execute();
            this.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
            return false;
        }
    }

    public Emprestimo getCarregaPorId(int id) throws SQLException {

        Emprestimo emprestimo = new Emprestimo();
        String slq = "SELECT *, l.*, c.*, u.*  FROM emprestimo e "
                + "INNER JOIN livro l ON l.idLivro = e.idLivro "
                + "INNER JOIN cliente c ON c.idCliente = e.idCliente "
                + "INNER JOIN usuario u ON u.idUsuario = e.idUsuario  WHERE e.idEmprestimo = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(slq);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            emprestimo.setIdEmprestimo(rs.getInt("e.idEmprestimo"));

            Cliente cliente = new Cliente();
            cliente.setIdCliente(rs.getInt("c.idCliente"));
            cliente.setNome(rs.getString("c.nome"));
            cliente.setSobrenome(rs.getString("c.sobrenome"));
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

            Date data = rs.getDate("dataEntrega");
            Calendar dataEntregaFormatada = Calendar.getInstance();
            dataEntregaFormatada.setTime(data);
            emprestimo.setDataEntrega(dataEntregaFormatada);

            data = rs.getDate("dataDevolucao");
            Calendar dataDevolucaoFormatada = Calendar.getInstance();
            dataDevolucaoFormatada.setTime(data);
            emprestimo.setDataDevolucao(dataDevolucaoFormatada);

            emprestimo.setStatus(rs.getInt("e.status"));
            
            emprestimo.setMultaMotivo(rs.getString("e.multaMotivo"));
            emprestimo.setMultaValor(rs.getDouble("e.multaValor"));
            emprestimo.setMultaPaga(rs.getInt("e.multaPaga"));
        }

        this.desconectar();
        return emprestimo;
    }

    public boolean deletar(Emprestimo emprestimo, int idLivro) {
        try {
            String sql = "DELETE FROM emprestimo WHERE idEmprestimo = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, emprestimo.getIdEmprestimo());
            this.disponivel(1, idLivro);
            stmt.execute();
            
            this.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println("Exception: " + e.getMessage());
            return false;
        }
    }
    
    public boolean finalizar(Emprestimo emprestimo, int idLivro, int idCliente) {
        try {
            String sql = "UPDATE emprestimo SET status = 3 WHERE idEmprestimo = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, emprestimo.getIdEmprestimo());
            this.disponivel(1, idLivro);
            this.multado(1, idCliente);
            stmt.execute();
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean multado(int status, int idCliente) {
        try {
            String sql = "UPDATE cliente SET status = ? WHERE idCliente = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, status);
            stmt.setInt(2, idCliente);
            stmt.execute();
            
            return true;
        } catch (Exception e) {
            return false;
        }
    }
    
    public boolean atrasado(int idEmprestimo) {
        try {
            String sql = "UPDATE emprestimo SET status = 2, multaPaga = 2, "
                    + "multaMotivo = 'Devolução atrasada' WHERE idEmprestimo = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idEmprestimo);
            stmt.execute();
            
            return true;
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return false;
        }
    }
}
