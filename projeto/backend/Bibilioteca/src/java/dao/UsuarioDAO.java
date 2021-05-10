package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Perfil;
import model.Usuario;

/**
 *
 * @author luan
 */
public class UsuarioDAO extends DatabaseDAO {

    public UsuarioDAO() throws ClassNotFoundException {
    }

    public ArrayList<Usuario> getLista() throws Exception {

        ArrayList<Usuario> lista = new ArrayList<Usuario>();
        String sql = "SELECT *, p.nome FROM usuario u "
                + "INNER JOIN perfil p ON p.idPerfil = u.idPerfil ";
        
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(sql);
        ResultSet rs = stmt.executeQuery();
        
        while (rs.next()) {
            Usuario usuario = new Usuario();
            usuario.setIdUsuario(rs.getInt("u.idUsuario"));
            usuario.setNome(rs.getString("u.nome"));
            usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));

            Perfil perfil = new Perfil();
            perfil.setIdPerfil(rs.getInt("u.idPerfil"));
            perfil.setNome(rs.getString("p.nome"));

            usuario.setPerfil(perfil);

            lista.add(usuario);
        }

        this.desconectar();
        return lista;
    }

    public boolean gravar(Usuario usuario) {

        try {
            String sql;
            this.conectar();
            
            if (usuario.getIdUsuario() == 0) {
                sql = "INSERT INTO usuario (nome, login, senha, status, "
                        + "idPerfil) VALUES (?, ?, ?, ?, ?)";
            } else {
                sql = "UPDATE usuario SET nome=?, login=?, senha=?, status=?, "
                        + "idPerfil=? WHERE idUsuario=?";
            }

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, usuario.getNome());
            stmt.setString(2, usuario.getLogin());
            stmt.setString(3, usuario.getSenha());
            stmt.setInt(4, usuario.getStatus());
            stmt.setInt(5, usuario.getPerfil().getIdPerfil());

            if (usuario.getIdUsuario() > 0) {
                stmt.setInt(6, usuario.getIdUsuario());
            }

            stmt.execute();
            this.desconectar();

            return true;
        } catch (SQLException e) {
            System.out.println(e);
            return false;
        }
    }

    public Usuario getCarregaPorId(int id) throws SQLException {

        Usuario usuario = new Usuario();
        String slq = "SELECT u.*, p.nome FROM usuario u "
                + "INNER JOIN perfil p ON p.idPerfil = u.idPerfil "
                + "WHERE u.idUsuario = ?";
        this.conectar();
        PreparedStatement stmt = conn.prepareStatement(slq);
        stmt.setInt(1, id);

        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            usuario.setIdUsuario(rs.getInt("u.idUsuario"));
            usuario.setNome(rs.getString("u.nome"));
            usuario.setLogin(rs.getString("u.login"));
            usuario.setSenha(rs.getString("u.senha"));
            usuario.setStatus(rs.getInt("u.status"));
            Perfil perfil = new Perfil();
            perfil.setIdPerfil(rs.getInt("u.idPerfil"));
            perfil.setNome(rs.getString("p.nome"));
            usuario.setPerfil(perfil);
        }

        this.desconectar();
        return usuario;
    }

    public boolean deletar(Usuario usuario) {

        try {
            String sql = "UPDATE usuario SET status = 2 WHERE idUsuario = ?";
            this.conectar();
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, usuario.getIdUsuario());
            stmt.execute();
            this.desconectar();
            return true;
        } catch (SQLException e) {
            System.out.println("Exception: " + e);
            return false;
        }
    }

    public Usuario getRecuperarUsuario(String login) {

        Usuario usuario = new Usuario();
        String sql = "SELECT u.* FROM usuario u WHERE u.login = ?  "
                + "AND u.status = 1";

        try {
            this.conectar();

            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, login);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                usuario.setIdUsuario(rs.getInt("idUsuario"));
                usuario.setNome(rs.getString("nome"));
                usuario.setLogin(rs.getString("u.login"));
                usuario.setSenha(rs.getString("senha"));
                usuario.setStatus(rs.getInt("u.status"));
                PerfilDAO dao = new PerfilDAO();
                usuario.setPerfil(dao.getCarregaPorId(rs.getInt("u.idPerfil")));
            }

            this.desconectar();

            return usuario;
        } catch (Exception e) {
            System.out.println("Exception: " + e.getMessage());
            return null;
        }
    }
}
