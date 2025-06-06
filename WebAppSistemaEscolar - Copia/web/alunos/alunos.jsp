<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.AlunosDAO"%>
<%@page import="model.Alunos"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Alunos</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    </head>
    <body>
        <h1>Cadastro de Alunos</h1>
        
        <%
            Alunos alu = new Alunos(); // Instância do obj
            // Atrib. valor
            alu.setNome( request.getParameter("nome"));
            alu.setCpf(request.getParameter("cpf"));            
            //Date dt_nasc = new SimpleDateFormat("yyyy-MM-dd").parse( request.getParameter("nascimento") );            
            alu.setNasc( new SimpleDateFormat("yyyy-MM-dd").parse( request.getParameter("nasc")));
            alu.setEmail(request.getParameter("email"));
                        
            AlunosDAO alunosDAO = new AlunosDAO();
            
            if (alunosDAO.inserir(alu)){
                out.println("Aluno inserido com sucesso!");
            }else{
                out.println("Aluno não cadastrado!!!");
            }                      
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    </body>
</html>
