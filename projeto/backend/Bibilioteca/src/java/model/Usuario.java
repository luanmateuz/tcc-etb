package model;

import java.util.Calendar;
import java.util.Date;

/**
 *
 * @author luan
 */
public class Usuario {
    
    private int idUsuario;
    private String nome;
    private String sobrenome;
    private Calendar dataNascimento;
    private String sexo;
    private String cpf;
    private String rg;
    private String login;
    private String senha;
    private int status;
    private String email;
    private String telefone;
    private String cep;
    private String rua;
    private int numero;
    private String uf;
    private String bairro;
    private String cidade;
    private String complemento;
    private Perfil perfil;

    public Usuario() {
    }

    public Usuario(int idUsuario, String nome, String sobrenome, 
            Calendar dataNascimento, String sexo, String cpf, String rg, 
            String login, String senha, int status, String email, 
            String telefone, String cep, String rua, int numero, String uf,
            String bairro, String cidade, String complemento, Perfil perfil) {
        this.idUsuario = idUsuario;
        this.nome = nome;
        this.sobrenome = sobrenome;
        this.dataNascimento = dataNascimento;
        this.sexo = sexo;
        this.cpf = cpf;
        this.rg = rg;
        this.login = login;
        this.senha = senha;
        this.status = status;
        this.email = email;
        this.telefone = telefone;
        this.cep = cep;
        this.rua = rua;
        this.numero = numero;
        this.uf = uf;
        this.bairro = bairro;
        this.cidade = cidade;
        this.complemento = complemento;
        this.perfil = perfil;
    }

    public Perfil getPerfil() {
        return perfil;
    }

    public void setPerfil(Perfil perfil) {
        this.perfil = perfil;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getSobrenome() {
        return sobrenome;
    }

    public void setSobrenome(String sobrenome) {
        this.sobrenome = sobrenome;
    }

    public Calendar getDataNascimento() {
        return dataNascimento;
    }

    public void setDataNascimento(Calendar dataNascimento) {
        this.dataNascimento = dataNascimento;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getCpf() {
        return cpf;
    }

    public void setCpf(String cpf) {
        this.cpf = cpf;
    }

    public String getRg() {
        return rg;
    }

    public void setRg(String rg) {
        this.rg = rg;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getSenha() {
        return senha;
    }

    public void setSenha(String senha) {
        this.senha = senha;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getTelefone() {
        return telefone;
    }

    public void setTelefone(String telefone) {
        this.telefone = telefone;
    }

    public String getCep() {
        return cep;
    }

    public void setCep(String cep) {
        this.cep = cep;
    }

    public String getRua() {
        return rua;
    }

    public void setRua(String rua) {
        this.rua = rua;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getUf() {
        return uf;
    }

    public void setUf(String uf) {
        this.uf = uf;
    }

    public String getBairro() {
        return bairro;
    }

    public void setBairro(String bairro) {
        this.bairro = bairro;
    }

    public String getCidade() {
        return cidade;
    }

    public void setCidade(String cidade) {
        this.cidade = cidade;
    }

    public String getComplemento() {
        return complemento;
    }

    public void setComplemento(String complemento) {
        this.complemento = complemento;
    }

    @Override
    public String toString() {
        return "Usuario{" + "idUsuario=" + idUsuario + ", nome=" + nome + 
                ", sobrenome=" + sobrenome + ", dataNascimento=" + 
                dataNascimento + ", sexo=" + sexo + ", cpf=" + cpf + ", rg="
                + rg + ", login=" + login + ", senha=" + senha + ", status="
                + status + ", email=" + email + ", telefone=" + telefone + 
                ", cep=" + cep + ", rua=" + rua + ", numero=" + numero + ", uf="
                + uf + ", bairro=" + bairro + ", cidade=" + cidade + 
                ", complemento=" + complemento + ", perfil=" + perfil + '}';
    }
    
}
