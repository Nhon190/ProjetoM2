<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.MatriculasDAO"%>
<%@page import="model.Matriculas"%>
<%@page import="java.text.SimpleDateFormat"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Controle de Matrículas - Lista Geral</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" 
          rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="mb-4">Consulta Geral das Matrículas</h2>

        <%
            MatriculasDAO matriculasDAO = new MatriculasDAO();
            List<Matriculas> lista = matriculasDAO.con_matriculas_geral();
        %>

        <table class="table table-bordered table-hover">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>CPF do Aluno</th>
                    <th>Matéria</th>
                    <th>Data da Matrícula</th>
                    <th>Consultar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    for (int i = 0; i < lista.size(); i++) {
                %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= lista.get(i).getId() %></td>
                    <td><%= lista.get(i).getCpf_alu() %></td>
                    <td><%= lista.get(i).getNome_mat() %></td>
                    <td><%= new SimpleDateFormat("dd/MM/yyyy").format(lista.get(i).getData_matri()) %></td>
                    <td>
                        <a href="../matriculas_consulta/con_matriculas.jsp?nome_materia=<%= lista.get(i).getNome_mat() %>">
                            <img src="../imagens/cons.png" alt="Consultar" width="32" />
                        </a>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" 
            crossorigin="anonymous"></script>
</body>
</html>
