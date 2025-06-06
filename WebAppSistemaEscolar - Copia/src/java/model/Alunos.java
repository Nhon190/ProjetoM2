package model;

import java.util.Date;

public class Alunos {
    private int id;
    private String nome;
    private String cpf;
    private Date nascimento;
    private String email;

    //Métodos
    public Alunos() {
    }
    //Construtor
    public Alunos(int p_id, String p_nome, String p_cpf, Date p_nasc, String p_email) {
        this.id = p_id;
        this.nome = p_nome;
        this.cpf = p_cpf;
        this.nascimento = p_nasc;
        this.email = p_email;
    }
    
    //Getter
    public int getId() {
        return id;
    }
    public String getNome() {
        return nome;
    }
    public String getCpf() {
        return cpf;
    }
    public Date getNasc() {
        return nascimento;
    }
    public String getEmail() {
        return email;
    }
    
    //Setter
    public void setId(int p_id) {
        this.id = p_id;
    }
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }
    public void setCpf(String p_cpf) {
        this.cpf = p_cpf;
    }
    public void setNasc(Date p_nasc) {
        this.nascimento = p_nasc;
    }
    public void setEmail(String p_email) {
        this.email = p_email;
    }
   
}
