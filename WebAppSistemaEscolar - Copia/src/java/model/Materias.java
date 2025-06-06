package model;

public class Materias {
    private int id;
    private String nome;
    private String professor;
    
    //Métodos
    public Materias() {
    }

    //Construtor
    public Materias(int p_id, String p_nome, String p_prof) {
        this.id = p_id;
        this.nome = p_nome;
        this.professor = p_prof;
    }

    //Getter
    public int getId() {
        return id;
    }
    public String getNome() {
        return nome;
    }
    public String getProfessor() {
        return professor;
    }

    //Setter
    public void setId(int p_id) {
        this.id = p_id;
    }
    public void setNome(String p_nome) {
        this.nome = p_nome;
    }
    public void setProfessor(String p_prof) {
        this.professor = p_prof;
    }
}
