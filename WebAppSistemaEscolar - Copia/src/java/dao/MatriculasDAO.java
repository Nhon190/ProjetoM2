package dao;

import model.Matriculas;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.ArrayList;
import java.sql.PreparedStatement;

import util.ConectaDB;

public class MatriculasDAO {

    // Inserir
    public boolean inserir(Matriculas p_matri) throws ClassNotFoundException {
        Connection conexao = null;
        try {
            conexao = ConectaDB.conectar();
            Statement stmt = conexao.createStatement();
            String sql = "INSERT INTO matriculas (cpf_aluno, nome_materia, data_matricula) VALUES ('" +
                    p_matri.getCpf_alu() + "', '" +
                    p_matri.getNome_mat() + "', '" +
                    new SimpleDateFormat("yyyy-MM-dd").format(p_matri.getData_matri()) + "')";

            stmt.executeUpdate(sql);
            return true;
        } catch (SQLException ex) {
            System.out.println("Erro SQL: " + ex);
            return false;
        }
    }
    
    //Consulta
    public List<Matriculas> consultarPorNomeMat(Matriculas p_matri) throws ClassNotFoundException {
        List<Matriculas> lista = new ArrayList<>();
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM matriculas WHERE nome_materia = ?";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            stmt.setString(1, p_matri.getNome_mat());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Matriculas mat = new Matriculas();
                mat.setId(rs.getInt("id_matricula"));
                mat.setCpf_alu(rs.getString("cpf_aluno"));
                mat.setNome_mat(rs.getString("nome_materia"));
                mat.setData_matricula(rs.getDate("data_matricula"));
                lista.add(mat);
            }

            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL (consultarPorNomeMat): " + ex);
        }

        return lista;
    }
    
    //Consulta Geral
    public List<Matriculas> con_matriculas_geral() throws ClassNotFoundException {
        List<Matriculas> lista = new ArrayList<>();
        Connection conexao = null;

        try {
            conexao = ConectaDB.conectar();
            String sql = "SELECT * FROM matriculas ORDER BY data_matricula DESC";
            PreparedStatement stmt = conexao.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Matriculas mat = new Matriculas();
                mat.setId(rs.getInt("id_matricula"));
                mat.setCpf_alu(rs.getString("cpf_aluno"));
                mat.setNome_mat(rs.getString("nome_materia"));
                mat.setData_matricula(rs.getDate("data_matricula"));
                lista.add(mat);
            }

            rs.close();
            stmt.close();
        } catch (SQLException ex) {
            System.out.println("Erro SQL (con_matriculas_geral): " + ex);
        }

        return lista;
    }
}
