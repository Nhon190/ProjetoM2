<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.MateriasDAO"%>
<%@page import="model.Materias"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Controle de Matérias</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" crossorigin="anonymous">
    </head>
    <body>
        <h1>Cadastro de Matérias</h1>
        
        <%
            Materias mat = new Materias(); // Instância do obj
            // Atrib. valor
            mat.setNome( request.getParameter("nome"));
            mat.setProfessor(request.getParameter("professor"));            
                        
            MateriasDAO materiasDAO = new MateriasDAO();
            
            if (materiasDAO.inserir(mat)){
                out.println("Matéria inserida com sucesso!");
            }else{
                out.println("Matéria não cadastrada!!!");
            }                      
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" crossorigin="anonymous"></script>
    </body>
</html>
