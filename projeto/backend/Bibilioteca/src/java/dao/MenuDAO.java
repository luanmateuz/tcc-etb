package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Menu;

/**
 *
 * @author luan
 */
public class MenuDAO extends DatabaseDAO {

    public MenuDAO() throws ClassNotFoundException {
    }

    public boolean gravar(Menu menu) {

        try {
            String sql;
            this.conectar();

            if (menu.getIdMenu() == 0) {
                sql = "INSERT INTO menu (nome, link, exibir) "
                        + "VALUES (?, ?, ?)";
            } else {
                sql = "UPDATE menu SET nome = ?, link = ?, exibir = ?"
                        + " WHERE idMenu = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, menu.getNome());
            stmt.setString(2, menu.getLink());
            stmt.setInt(3, menu.getExibir());

            if (menu.getIdMenu() > 0) {
                stmt.setInt(4, menu.getIdMenu());
            }

            stmt.execute();
            this.desconectar();

            return true;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Menu> getLista() throws Exception {

        ArrayList<Menu> lista = new ArrayList<>();
        String SQL = "SELECT * FROM menu";
        this.conectar();

        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SQL)) {

            while (rs.next()) {
                Menu menu = new Menu();
                menu.setIdMenu(rs.getInt("idMenu"));
                menu.setNome(rs.getString("nome"));
                menu.setLink(rs.getString("link"));
                menu.setExibir(rs.getInt("exibir"));

                lista.add(menu);
            }

            this.desconectar();
        }

        return lista;
    }

    public Menu getCarregaPorId(int id) {

        String sql = "SELECT * FROM menu WHERE idMenu = ?";

        try {
            Menu menu = new Menu();
            this.conectar();
            PreparedStatement stmt = conn.prepareCall(sql);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                menu.setIdMenu(id);
                menu.setNome(rs.getString("nome"));
                menu.setLink(rs.getString("link"));
                menu.setExibir(rs.getInt("exibir"));
            }

            this.desconectar();
            return menu;
        } catch (SQLException ex) {
            System.out.println("Erro: " + ex.getMessage());
            return null;
        }
    }

    public boolean deletar(int id) {

        try {
            this.conectar();
            String sql = "DELETE FROM menu WHERE idMenu = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            this.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println("Erro: " + e.getMessage());
            return false;
        }
    }

}
