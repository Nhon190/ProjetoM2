package dao;

import model.Alunos;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;
import java.text.SimpleDateFormat;
import util.ConectaDB;

import util.ConectaDB;

public class AlunosDAO {

    //Inserir
    public boolean inserir (Alunos p_alu) throws ClassNotFoundException{

        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); //Abre a conexão
            Statement stmt = conexao.createStatement();
            String sql = "Insert into alunos (nome, cpf, data_nascimento, email) values('"+
                    p_alu.getNome() + "', '" +
                    p_alu.getCpf() + "', '" +
                    new SimpleDateFormat("yyyy-MM-dd").format(p_alu.getNasc()) + "', '" +
                    p_alu.getEmail() + "')";
                                                                                           
            stmt.executeUpdate(sql); // Insert - Update - Delete
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }               
    }
    
    //Consultas
    public Alunos consultarPorCpf(Alunos p_alu) throws ClassNotFoundException {
    Connection conexao = null;
    try {
        conexao = ConectaDB.conectar();
        Statement stmt = conexao.createStatement();

        String sql = "SELECT * FROM alunos WHERE cpf = '" + p_alu.getCpf() + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            p_alu.setId(rs.getInt("id_aluno"));
            p_alu.setNome(rs.getString("nome"));
            p_alu.setCpf(rs.getString("cpf"));
            p_alu.setNasc(rs.getDate("data_nascimento"));
            p_alu.setEmail(rs.getString("email"));
            return p_alu;
        } else {
            return null;
        }
    } catch (SQLException ex) {
        System.out.println("Erro SQL: ");
        ex.printStackTrace();
        return null;
    }
}

    //Consulta Geral
    public List<Alunos> consultar_lista_simples() throws ClassNotFoundException {
        List<Alunos> lista = new ArrayList<>();
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM alunos ORDER BY nome";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Alunos alu = new Alunos();
                alu.setId(rs.getInt("id_aluno"));
                alu.setNome(rs.getString("nome"));
                alu.setCpf(rs.getString("cpf"));
                alu.setNasc(rs.getDate("data_nascimento"));
                alu.setEmail(rs.getString("email"));
                lista.add(alu);
            }

            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL (consultar_lista_simples): " + ex);
        }

        return lista;
    }
}

