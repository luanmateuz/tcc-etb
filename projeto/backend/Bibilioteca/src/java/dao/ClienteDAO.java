package dao;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
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
}
