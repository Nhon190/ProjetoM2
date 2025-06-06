<%@page import="java.util.List"%>
<%@page import="dao.AlunosDAO"%>
<%@page import="model.Alunos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <title>Consulta Geral dos Alunos</title>
    
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
        }
        th, td {
            padding: 8px;
            text-align: left;
            border: 1px solid #DDD;
        }
        tr:hover {
            background-color: #D6EEEE;
        }
    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.5/dist/css/bootstrap.min.css" 
          rel="stylesheet" 
          integrity="sha384-SgOJa3DmI69IUzQ2PVdRZhwQ+dy64/BUtbMJw1MZ8t5HZApcHrRKUc4W0kG879m7" 
          crossorigin="anonymous">
</head>
<body>
    <div class="container mt-4">
        <h2 class="mb-4">Consulta Geral dos Alunos</h2>

        <%
            AlunosDAO alunosDAO = new AlunosDAO();
            List<Alunos> lista = alunosDAO.consultar_lista_simples();
        %>

        <table class="table table-hover table-bordered">
            <thead class="table-light">
                <tr>
                    <th>#</th>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>CPF</th>
                    <th>Data de Nascimento</th>
                    <th>Email</th>
                    <th>Consultar</th>
                </tr>
            </thead>
            <tbody>
                <%
                    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
                    for (int i = 0; i < lista.size(); i++) {
                        Alunos aluno = lista.get(i);
                %>
                <tr>
                    <td><%= (i + 1) %></td>
                    <td><%= aluno.getId() %></td>
                    <td><%= aluno.getNome() %></td>
                    <td><%= aluno.getCpf() %></td>
                    <td><%= (aluno.getNasc() != null) ? sdf.format(aluno.getNasc()) : "" %></td>
                    <td><%= aluno.getEmail() %></td>
                    <td>
                        <a href="../alunos_consulta/con_alunos.jsp?cpf=<%= aluno.getCpf() %>" 
                           title="Consultar aluno">
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
            integrity="sha384-k6d4wzSIapyDyv1kpU366/PK5hCdSbCRGRCMv+eplOQJWyd1fbcAu9OCUj5zNLiq" 
            crossorigin="anonymous"></script>
</body>
</html>
