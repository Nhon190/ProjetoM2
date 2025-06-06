<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="dao.MateriasDAO"%>
<%@page import="model.Materias"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8" />
    <title>Consulta da Matéria</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" 
          crossorigin="anonymous">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <h1 class="mb-4">Consulta da Matéria</h1>

        <%
            Materias mat = new Materias();
            mat.setNome(request.getParameter("nome"));

            MateriasDAO materiasDAO = new MateriasDAO();
            Materias resultado = materiasDAO.consultarPorNome(mat);

            if (resultado != null) {
        %>
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">Dados da Matéria</h5>
                    <p><strong>Id:</strong> <%= resultado.getId() %></p>
                    <p><strong>Nome:</strong> <%= resultado.getNome() %></p>
                    <p><strong>Professor:</strong> <%= resultado.getProfessor() %></p>
                </div>
            </div>
        <%
            } else {
        %>
            <div class="alert alert-warning" role="alert">
                Matéria não localizada!
            </div>
        <%
            }
        %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" 
            crossorigin="anonymous"></script>
</body>
</html>
