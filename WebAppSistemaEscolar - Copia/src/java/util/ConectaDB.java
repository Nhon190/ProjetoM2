package util;

import java.sql.*;

public class ConectaDB {

    public static Connection conectar() throws ClassNotFoundException{
        Connection conn = null;
        try{
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/escola","root","");
            return conn;
        }
        catch(SQLException ex){
            System.out.println("Erro: " + ex);
        }
        return conn;        
    }
            
}
