package dao;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Calendar;
import model.Cliente;

/**
 *
 * @author luan
 */
public class ClienteDAO extends DatabaseDAO {

    public ClienteDAO() throws ClassNotFoundException {
    }

    public ArrayList<Cliente> getLista() throws Exception {

        ArrayList<Cliente> lista = new ArrayList<>();
        String SQL = "SELECT * FROM cliente";
        this.conectar();
        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SQL)) {

            while (rs.next()) {
                Cliente cliente = new Cliente();
                cliente.setIdCliente(rs.getInt("idCliente"));
                cliente.setNome(rs.getString("nome"));
                cliente.setEmail(rs.getString("email"));
                cliente.setTelefone(rs.getString("telefone"));
                cliente.setStatus(rs.getInt("status"));

                lista.add(cliente);
            }

            this.desconectar();
        }

        return lista;
    }

    public boolean gravar(Cliente cliente) {

        try {
            String sql;
            this.conectar();

            if (cliente.getIdCliente() == 0) {
                sql = "INSERT INTO cliente (nome, sobrenome, dataNascimento, "
                        + "sexo, cpf, status, email, telefone, cep, rua, numero,"
                        + " uf, bairro, cidade, complemento) VALUES (?, ?, ?, ?, "
                        + "?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            } else {
                sql = "UPDATE cliente SET nome=?, sobrenome=?, dataNascimento=?, "
                        + "sexo=?, cpf=?, status=?, email=?, telefone=?, cep=?, "
                        + "rua=?, numero=?, uf=?, bairro=?, cidade=?, "
                        + "complemento=? WHERE idCliente=?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, cliente.getNome());
            stmt.setString(2, cliente.getSobrenome());
            stmt.setDate(3, new Date(
                    cliente.getDataNascimento().getTimeInMillis()));
            stmt.setString(4, cliente.getSexo());
            stmt.setString(5, cliente.getCpf());
            stmt.setInt(6, cliente.getStatus());
            stmt.setString(7, cliente.getEmail());
            stmt.setString(8, cliente.getTelefone());
            stmt.setString(9, cliente.getCep());
            stmt.setString(10, cliente.getRua());
            stmt.setInt(11, cliente.getNumero());
            stmt.setString(12, cliente.getUf());
            stmt.setString(13, cliente.getBairro());
            stmt.setString(14, cliente.getCidade());
            stmt.setString(15, cliente.getComplemento());

            if (cliente.getIdCliente() > 0) {
                stmt.setInt(16, cliente.getIdCliente());
            }

            stmt.execute();
            this.desconectar();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean deletar(Cliente cliente) {
        
        try {
            this.conectar();
            String sql = "DELETE FROM cliente WHERE idCliente=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, cliente.getIdCliente());
            stmt.execute();
            this.desconectar();

            return true;
        } catch (Exception e) {
            System.out.println("Erro: " + e);
            return false;
        }
    }

    public Cliente getCarregaPorId(int id) throws SQLException {

        Cliente cliente = new Cliente();
        String slq = "SELECT * FROM cliente WHERE idCliente = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(slq);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            cliente.setIdCliente(rs.getInt("idCliente"));
            cliente.setNome(rs.getString("nome"));
            cliente.setSobrenome(rs.getString("sobrenome"));

            Calendar dataNasc = Calendar.getInstance();
            dataNasc.setTime(rs.getDate("dataNascimento"));
            cliente.setDataNascimento(dataNasc);

            cliente.setSexo(rs.getString("sexo"));
            cliente.setCpf(rs.getString("cpf"));
            cliente.setStatus(rs.getInt("status"));
            cliente.setEmail(rs.getString("email"));
            cliente.setTelefone(rs.getString("telefone"));
            cliente.setCep(rs.getString("cep"));
            cliente.setRua(rs.getString("rua"));
            cliente.setNumero(rs.getInt("numero"));
            cliente.setUf(rs.getString("uf"));
            cliente.setBairro(rs.getString("bairro"));
            cliente.setCidade(rs.getString("cidade"));
            cliente.setComplemento(rs.getString("complemento"));
        }

        this.desconectar();
        return cliente;
    }
}
