package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author luan
 */
public class DatabaseDAO {

    public final String URL = "jdbc:mysql://localhost/biblioteca";
    public final String USUARIO = "root";
    public final String SENHA = "";
    public Connection conn;

    public DatabaseDAO() throws ClassNotFoundException {
        Class.forName("com.mysql.cj.jdbc.Driver");
    }

    public void conectar() throws SQLException {
        conn = DriverManager.getConnection(URL, USUARIO, SENHA);
    }

    public void desconectar() throws SQLException {
        conn.close();
    }
}
