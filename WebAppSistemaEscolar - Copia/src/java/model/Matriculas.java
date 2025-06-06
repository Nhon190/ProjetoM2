package model;

import java.util.Date;

public class Matriculas {
    private int id;
    private String cpf_aluno;
    private String nome_materia;
    private Date data_matricula;

    public Matriculas() {
    }
    
    //Construtor
    public Matriculas(int p_id, String p_cpf_alu, String p_nome_mat, Date p_data_matri) {
        this.id = p_id;
        this.cpf_aluno = p_cpf_alu;
        this.nome_materia = p_nome_mat;
        this.data_matricula = p_data_matri;
    }

    //Getter
    public int getId() {
        return id;
    }
    public String getCpf_alu() {
        return cpf_aluno;
    }
    public String getNome_mat() {
        return nome_materia;
    }
    public Date getData_matri() {
        return data_matricula;
    }
    
    //Setter
    public void setId(int p_id) {
        this.id = p_id;
    }
    public void setCpf_alu(String p_nome_alu) {
        this.cpf_aluno = p_nome_alu;
    }
    public void setNome_mat(String p_nome_mat) {
        this.nome_materia = p_nome_mat;
    }
    public void setData_matricula(Date p_data_matri) {
        this.data_matricula = p_data_matri;
    }    
        
}


