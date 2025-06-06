<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="dao.MateriasDAO"%>
<%@page import="model.Materias"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Consulta Geral das Matérias</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h2 class="mb-4">Consulta Geral das Matérias</h2>

        <%
            MateriasDAO materiasDAO = new MateriasDAO();
            List<Materias> lista = materiasDAO.con_materias_geral();
        %>

        <div class="table-responsive">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>#</th>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Professor</th>
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
                        <td><%= lista.get(i).getNome() %></td>
                        <td><%= lista.get(i).getProfessor() %></td>
                        <td>
                            <a href="../materias_consulta/con_materias.jsp?nome=<%= lista.get(i).getNome() %>">
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
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
