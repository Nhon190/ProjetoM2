<%@page import="dao.UsuarioDAO"%>
<%@page import="model.Usuario"%>
<%@page import="java.security.*"%>
<%@page import="java.math.*"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Escola</title>
    </head>
    <body>
        <h1>Login</h1>
        <%
            String login = request.getParameter("login");
            String senha = request.getParameter("senha");
            
            Usuario usu = new Usuario();
            usu.setLogin(login);
            
            MessageDigest md5=MessageDigest.getInstance("MD5");
            md5.update(senha.getBytes(), 0, senha.length());            
            usu.setSenha( new BigInteger(1, md5.digest()).toString(16));            
            
            UsuarioDAO usuDAO = new UsuarioDAO();            
            
            if (usuDAO.consultar(usu) != null){
                out.println("Usuário: " + usu.getNome());
                session.setAttribute("autoriza", "1");           
        %>
                <script> window.location.href='index_menu.jsp'; </script>
        <%
            }else{
                session.setAttribute("autoriza", "0"); 
                out.println("Acesso não autorizado!!!");
            }                       
        %>
    </body>
</html>
