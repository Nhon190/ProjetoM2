package model;

public class Usuario {
    
    private String login;    
    private String senha;
    private String nome;
            
    //Setter
    public void setLogin(String login) {
        this.login = login;
    }
    public void setSenha(String senha) {
        this.senha = senha;
    }
    public void setNome(String nome) {
        this.nome = nome;
    }    

    //Getter
    public String getLogin() {
        return login;
    }
    public String getSenha() {
        return senha;
    }
    public String getNome() {
        return nome;
    }
    
}
