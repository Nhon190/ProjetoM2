<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dao.MatriculasDAO"%>
<%@page import="model.Matriculas"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Consulta de Matricula</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous">
</head>
<body class="bg-light">
<div class="container mt-5">
    <h1 class="mb-4">Consulta de Matricula</h1>

    <%
        Matriculas matri = new Matriculas();
        matri.setNome_mat(request.getParameter("nome_materia"));

        MatriculasDAO matriculasDAO = new MatriculasDAO();
        List<Matriculas> resultados = matriculasDAO.consultarPorNomeMat(matri);

        if (resultados != null && !resultados.isEmpty()) {
    %>

    <table class="table table-bordered">
        <thead class="table-dark">
            <tr>
                <th>ID</th>
                <th>CPF do Aluno</th>
                <th>Matéria</th>
                <th>Data da Matrícula</th>
            </tr>
        </thead>
        <tbody>
        <%
            for (Matriculas m : resultados) {
        %>
            <tr>
                <td><%= m.getId() %></td>
                <td><%= m.getCpf_alu() %></td>
                <td><%= m.getNome_mat() %></td>
                <td><%= new SimpleDateFormat("dd/MM/yyyy").format(m.getData_matri()) %></td>
            </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <%
        } else {
    %>
    <div class="alert alert-warning" role="alert">
        Nenhum aluno matriculado nesta matéria!
    </div>
    <%
        }
    %>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
</body>
</html>
