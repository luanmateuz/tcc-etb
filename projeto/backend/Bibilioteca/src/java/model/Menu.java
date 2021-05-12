package model;

/**
 *
 * @author luan
 */
public class Menu {
    
    private int idMenu;
    private String nome;
    private String link;
    private int exibir;    

    public Menu() {
    }

    public Menu(int idMenu, String nome, String link, int exibir) {
        this.idMenu = idMenu;
        this.nome = nome;
        this.link = link;
        this.exibir = exibir;
    }

    public int getIdMenu() {
        return idMenu;
    }

    public void setIdMenu(int idMenu) {
        this.idMenu = idMenu;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    public int getExibir() {
        return exibir;
    }

    public void setExibir(int exibir) {
        this.exibir = exibir;
    }

    @Override
    public String toString() {
        return "Menu{" + "idMenu=" + idMenu + ", nome=" + nome + ", link=" 
                + link + ", exibir=" + exibir + '}';
    }
    
}
