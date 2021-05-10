package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import model.Menu;
import model.Perfil;

/**
 *
 * @author luan
 */
public class PerfilDAO extends DatabaseDAO {

    public PerfilDAO() throws ClassNotFoundException {
    }
    
    public ArrayList<Perfil> getLista() throws Exception {

        ArrayList<Perfil> lista = new ArrayList<>();
        String SQL = "SELECT * FROM perfil";
        this.conectar();
        try (Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SQL)) {

            while (rs.next()) {
                int id = rs.getInt("idPerfil");
                String nome = rs.getString("nome");

                Perfil perfil = new Perfil(id, nome);

                lista.add(perfil);
            }

            this.desconectar();
        }

        return lista;
    }

    public boolean gravar(Perfil perfil) {

        try {
            String sql;
            this.conectar();

            if (perfil.getIdPerfil() == 0) {
                sql = "INSERT INTO perfil(nome) VALUES (?)";
            } else {
                sql = "UPDATE perfil SET nome = ? WHERE idPerfil = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, perfil.getNome());
            if (perfil.getIdPerfil() > 0) {
                stmt.setInt(2, perfil.getIdPerfil());
            }

            stmt.execute();
            this.desconectar();
            return true;

        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return false;
        }
    }

    public Perfil getCarregaPorId(int id) throws SQLException, Exception {

        Perfil perfil = new Perfil();
        String sql = "SELECT * FROM perfil WHERE idPerfil = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            perfil.setIdPerfil(rs.getInt("idPerfil"));
            perfil.setNome(rs.getString("nome"));
            perfil.setMenus(menusVinculadosPorPerfil(id));
            perfil.setNaoMenus(menusNaoVinculadosPorPerfil(id));
        }

        this.desconectar();
        return perfil;
    }

    public boolean deletar(int id) {

        try {
            this.conectar();
            String sql = "DELETE FROM perfil WHERE idPerfil = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);
            stmt.execute();
            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return false;
        }
    }

    public ArrayList<Menu> menusVinculadosPorPerfil(int idPerfil) 
            throws SQLException {

        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu_perfil AS mp, menu AS m "
                + "WHERE mp.idMenu = m.idMenu AND mp.idPerfil = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, idPerfil);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Menu menu = new Menu();
            menu.setIdMenu(rs.getInt("m.idMenu"));
            menu.setNome(rs.getString("m.nome"));
            menu.setLink(rs.getString("m.link"));
            menu.setIcone(rs.getString("m.icone"));
            menu.setExibir(rs.getInt("m.exibir"));

            lista.add(menu);
        }

        this.desconectar();
        return lista;
    }

    public ArrayList<Menu> menusNaoVinculadosPorPerfil(int idPerfil) 
            throws Exception {

        ArrayList<Menu> lista = new ArrayList<Menu>();
        String sql = "SELECT m.* FROM menu AS m "
                + "WHERE m.idMenu NOT IN (SELECT mp.idMenu FROM "
                + "menu_perfil as mp WHERE mp.idPerfil = ?)";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, idPerfil);
        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Menu menu = new Menu();
            menu.setIdMenu(rs.getInt("m.idMenu"));
            menu.setNome(rs.getString("m.nome"));
            menu.setLink(rs.getString("m.link"));
            menu.setIcone(rs.getString("m.icone"));
            menu.setExibir(rs.getInt("m.exibir"));

            lista.add(menu);
        }

        this.desconectar();
        return lista;
    }

    public boolean vincular(int idMenu, int idPefil) {

        try {

            String sql = "INSERT INTO menu_perfil (idMenu, idPerfil) "
                    + "VALUES (?, ?)";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idMenu);
            stmt.setInt(2, idPefil);
            stmt.execute();

            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println("Exception: " + e);
            return false;
        }
    }

    public boolean desvincular(int idMenu, int idPefil) {

        try {

            String sql = "DELETE FROM menu_perfil "
                    + "WHERE idMenu = ? AND idPerfil = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, idMenu);
            stmt.setInt(2, idPefil);
            stmt.execute();

            this.desconectar();
            return true;
        } catch (Exception e) {
            System.out.println("Exception: " + e);
            return false;
        }
    }
    
}
