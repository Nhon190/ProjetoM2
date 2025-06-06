package dao;

import model.Usuario;
import util.ConectaDB;
import java.sql.*;
import java.text.*;

public class UsuarioDAO {
        public Usuario consultar(Usuario p_usu) throws ClassNotFoundException, ParseException{

        Connection conexao = null;
        try{
            conexao = ConectaDB.conectar(); 
            Statement stmt = conexao.createStatement();   
            String sql = "SELECT * FROM usuario WHERE login = '" + p_usu.getLogin() + "' AND senha = '" + p_usu.getSenha() + "'";
            ResultSet rs = stmt.executeQuery(sql); 
            
            int n_reg = 0;
            while (rs.next()){               
               p_usu.setLogin(rs.getString("login") );
               p_usu.setSenha(rs.getString("senha") );
               p_usu.setNome(rs.getString("nome") );              
               n_reg++;
            }
                
            if (n_reg == 0){
                return null;
            }else{
                return p_usu;
            }            
        }
        catch(SQLException ex){
            System.out.println("Erro SQL: " + ex);    
            return null;
        }               
    }
}
