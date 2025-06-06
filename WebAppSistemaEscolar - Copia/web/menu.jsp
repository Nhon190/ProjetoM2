<!doctype html>
<html lang="en" data-bs-theme="auto">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Sistema Escolar</title>
    <script src="assets/dist/js/color-modes.js"></script>
    <link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
    <meta name="theme-color" content="#712cf9">

    <style>
      .sidebar-custom {
        background-color: #f8f9fa;
        border-right: 1px solid #dee2e6;
        min-height: 100vh;
      }

      .nav-link {
        border-radius: 0.375rem;
        margin-bottom: 0.25rem;
        transition: background-color 0.3s, color 0.3s;
        font-weight: 500;
      }

      .nav-link:hover,
      .nav-link:focus {
        background-color: #e0e7ff;
        color: #1e40af;
      }

      .nav-link svg {
        color: #6366f1;
      }

      .fs-4 {
        font-weight: 600;
        color: #4f46e5;
      }

      .bd-mode-toggle {
        z-index: 1500;
      }
    </style>

    <link href="assets/dist/css/sidebars.css" rel="stylesheet">
  </head>
  <body>
    <% if (session.getAttribute("autoriza").equals("1")) { } else {
         out.println("Não Autorizado: " + session.getAttribute("autoriza"));
         response.sendRedirect("index.html");
       } %>

    <svg xmlns="http://www.w3.org/2000/svg" class="d-none">
      <symbol id="adicionar" viewBox="0 0 16 16">
        <path d="M2 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v13.5a.5.5 0 0 1-.777.416L8 13.101l-5.223 2.815A.5.5 0 0 1 2 15.5zm2-1a1 1 0 0 0-1 1v12.566l4.723-2.482a.5.5 0 0 1 .554 0L13 14.566V2a1 1 0 0 0-1-1z"/>
        <path d="M8 4a.5.5 0 0 1 .5.5V6H10a.5.5 0 0 1 0 1H8.5v1.5a.5.5 0 0 1-1 0V7H6a.5.5 0 0 1 0-1h1.5V4.5A.5.5 0 0 1 8 4"/>
      </symbol>
      <symbol id="people-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z"/>
        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z"/>
      </symbol>
      <symbol id="table" viewBox="0 0 16 16">
        <path d="M0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V2zm15 2h-4v3h4V4zm0 4h-4v3h4V8zm0 4h-4v3h3a1 1 0 0 0 1-1v-2zm-5 3v-3H6v3h4zm-5 0v-3H1v2a1 1 0 0 0 1 1h3zm-4-4h4V8H1v3zm0-4h4V4H1v3zm5-3v3h4V4H6zm4 4H6v3h4V8z"/>
      </symbol>
      <symbol id="grid" viewBox="0 0 16 16">
        <path d="M0 2a1 1 0 0 1 1-1h14a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H1a1 1 0 0 1-1-1zm8.5 0v8H15V2zm0 9v3H15v-3zm-1-9H1v3h6.5zM1 14h6.5V6H1z"/>
      </symbol>
    </svg>

    <main class="d-flex flex-nowrap">
      <div class="d-flex flex-column flex-shrink-0 p-3 sidebar-custom" style="width: 280px;">
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none">
          <img src="imagens/logo.jpg" alt="Logo" width="70" height="70"/>
        </a>
        <a href="#" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-decoration-none">
          <span class="fs-4">Sistema Escolar</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="alunos/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#adicionar"/></svg>
              Cadastro de Alunos
            </a>
          </li>
          <li>
            <a href="alunos_consulta/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
              Consulta de Aluno
            </a>
          </li>
          <li>
            <a href="alunos_consulta/con_alunos_geral.jsp" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
              Consulta de Todos os Alunos
            </a>
          </li>
          <li>
            <a href="materias/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#adicionar"/></svg>
              Cadastro de Matérias
            </a>
          </li>
          <li>
            <a href="materias_consulta/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
              Consulta de Matéria
            </a>
          </li>
          <li>
            <a href="materias_consulta/con_materias_geral.jsp" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
              Consulta de Todas as Matérias
            </a>
          </li>
          <li>
            <a href="matriculas/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#adicionar"/></svg>
              Cadastro de Matriculas
            </a>
          </li>
          <li>
            <a href="matriculas_consulta/index.html" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
              Consulta de Matriculas
            </a>
          </li>
          <li>
            <a href="matriculas_consulta/con_matriculas_geral.jsp" target="main_page" class="nav-link">
              <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
              Consulta de Todas as Matriculas
            </a>
          </li>
        </ul>
        <hr>
      </div>
      <div class="b-example-divider b-example-vr"></div>
    </main>

    <script defer src="assets/dist/js/bootstrap.bundle.min.js"></script>
    <script defer src="assets/dist/js/sidebars.js"></script>
  </body>
</html>