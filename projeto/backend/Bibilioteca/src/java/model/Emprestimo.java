package model;

import java.util.Calendar;

/**
 *
 * @author luan
 */
public class Emprestimo {

    private int idEmprestimo;
    private Calendar dataEntrega;
    private Calendar dataDevolucao;
    private Cliente cliente;
    private Usuario usuario;
    private Livro livro;
    private int status;
    private String multaMotivo;
    private double multaValor;
    private int multaPaga;

    public Emprestimo() {
    }

    public Emprestimo(int idEmprestimo, Calendar dataEntrega, Calendar dataDevolucao, Cliente cliente, Usuario usuario, Livro livro, int status, String multaMotivo, double multaValor, int multaPaga) {
        this.idEmprestimo = idEmprestimo;
        this.dataEntrega = dataEntrega;
        this.dataDevolucao = dataDevolucao;
        this.cliente = cliente;
        this.usuario = usuario;
        this.livro = livro;
        this.status = status;
        this.multaMotivo = multaMotivo;
        this.multaValor = multaValor;
        this.multaPaga = multaPaga;
    }

    public int getIdEmprestimo() {
        return idEmprestimo;
    }

    public void setIdEmprestimo(int idEmprestimo) {
        this.idEmprestimo = idEmprestimo;
    }

    public Calendar getDataEntrega() {
        return dataEntrega;
    }

    public void setDataEntrega(Calendar dataEntrega) {
        this.dataEntrega = dataEntrega;
    }

    public Calendar getDataDevolucao() {
        return dataDevolucao;
    }

    public void setDataDevolucao(Calendar dataDevolucao) {
        this.dataDevolucao = dataDevolucao;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Livro getLivro() {
        return livro;
    }

    public void setLivro(Livro livro) {
        this.livro = livro;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMultaMotivo() {
        return multaMotivo;
    }

    public void setMultaMotivo(String multaMotivo) {
        this.multaMotivo = multaMotivo;
    }

    public double getMultaValor() {
        return multaValor;
    }

    public void setMultaValor(double multaValor) {
        this.multaValor = multaValor;
    }

    public int getMultaPaga() {
        return multaPaga;
    }

    public void setMultaPaga(int multaPaga) {
        this.multaPaga = multaPaga;
    }
    
}
