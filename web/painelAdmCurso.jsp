<%@ page import = "config.Conexao" %>
<%@ page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-lg bg-body-tertiary">
                <div class="container-fluid">
                    <a class="navbar-brand" href="painelAdm.jsp">C.R.U.D.</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarText" aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarText">
                        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                            <li class="nav-item">
                                <a class="nav-link active" aria-current="page" href="painelAdm.jsp">Usuários</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="painelAdmCurso.jsp">Cursos</a>
                            </li>
                        </ul>
                        <span class="navbar-text">
                            <%
                                //captura o nome do usuario pela sessao
                                String nomeUsuario = (String) session.getAttribute("nomeUsuario");
                                //exibe o usuario
                                out.print(nomeUsuario);

                                //se tentar entrar pelo link sem ter logado
                                if (nomeUsuario == null) {
                                    response.sendRedirect("index.jsp");
                                }
                            %>
                            <a href="logout.jsp"> Sair </a>
                        </span>
                    </div>
                </div>
            </nav>
        </header>

        <main class="d-flex flex-column align-items-center">
            <form class="d-flex mt-4" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="txtName">
                <button class="btn btn-outline-success" type="submit">Buscar</button>
            </form>
            <table class="table table-bordered mt-4 w-75">
                <thead>
                    <tr>
                        <th scope="col">Nome do curso</th>
                        <th scope="col">Descrição</th>
                        <th scope="col">Carga Horária</th>
                        <th colspan="2">Ações</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        String nome = request.getParameter("txtName");

                        Statement st = null;
                        ResultSet rs = null;

                        //criar a conexao com o bd. Statement permite executar SQL (insert,select..)
                        st = new Conexao().conectar().createStatement();
                        if (nome != null) {
                            // executa a consulta na tabela usuario,conforme o login e senha informado
                            rs = st.executeQuery("SELECT * FROM curso WHERE nomeCurso LIKE '%" + nome + "%' order by nomeCurso asc");
                        } else {
                            rs = st.executeQuery("SELECT * FROM curso");
                        }

                        while (rs.next()) {
                            out.print("<tr>");
                            out.print("<td>" + rs.getString(2) + "</td>");
                            out.print("<td>" + rs.getString(3) + "</td>");
                            out.print("<td>" + rs.getString(4) + "</td>");
                            out.print("<td><a href='excluirCurso.jsp?id=" + rs.getString(1) + "'><img src='imagens/excluir.png'></a></td>");
                            out.print("<td><a href='alterarCurso.jsp?id=" + rs.getString(1) + "'><img src='imagens/editar-arquivo.png'></a></td>");
                            out.print("<tr>");
                        }
                    %>
                </tbody>
            </table>
            <p class="d-flex flex-row justify-content-center mt-4">
                <a class="btn btn-primary" href="adicionarCurso.jsp" role="button">Adicionar Curso</a>
            </p>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
