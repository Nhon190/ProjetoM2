package dao;

import model.Materias;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import util.ConectaDB;
import java.sql.Statement;

import util.ConectaDB;

public class MateriasDAO {

    //Inserir
    public boolean inserir (Materias p_mat) throws ClassNotFoundException{

        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();
            String sql = "Insert into materias (nome, professor) values('"+
                    p_mat.getNome() + "', '" +
                    p_mat.getProfessor()+"')";
                                                                                            
            stmt.executeUpdate(sql); 
            return true;
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);
            return false;
        }               
    }
    
    //Consultas
    public Materias consultarPorNome(Materias p_mat) throws ClassNotFoundException {
    Connection conexao = null;
    try {
        conexao = ConectaDB.conectar();
        Statement stmt = conexao.createStatement();

        String sql = "SELECT * FROM materias WHERE nome = '" + p_mat.getNome() + "'";
        ResultSet rs = stmt.executeQuery(sql);

        if (rs.next()) {
            p_mat.setId(rs.getInt("id_materia"));
            p_mat.setNome(rs.getString("nome"));
            p_mat.setProfessor(rs.getString("professor"));
            return p_mat;
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
    public List<Materias> con_materias_geral() throws ClassNotFoundException {
        List<Materias> lista = new ArrayList<>();
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM materias ORDER BY nome";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Materias mat = new Materias();
                mat.setId(rs.getInt("id_materia"));
                mat.setNome(rs.getString("nome"));
                mat.setProfessor(rs.getString("professor"));
                lista.add(mat);
            }

            rs.close();
            stmt.close();
            conexao.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL (con_materias_geral): " + ex);
        }

        return lista;
    }
}
