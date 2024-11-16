<%@ page import="config.Conexao" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Curso</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
        <style>
            .gradient-custom-3 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))
            }
            .gradient-custom-4 {
                /* fallback for old browsers */
                background: #84fab0;

                /* Chrome 10-25, Safari 5.1-6 */
                background: -webkit-linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1));

                /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
                background: linear-gradient(to right, rgba(132, 250, 176, 1), rgba(143, 211, 244, 1))
            }
        </style>
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
        <main>
            <section class="vh-100 bg-image"
                     style="background-image: url('https://mdbcdn.b-cdn.net/img/Photos/new-templates/search-box/img4.webp');">
                <div class="mask d-flex align-items-center h-100 gradient-custom-3">
                    <div class="container h-100">
                        <div class="row d-flex justify-content-center align-items-center h-100">
                            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
                                <div class="card" style="border-radius: 15px;">
                                    <div class="card-body p-5">
                                        <h2 class="text-uppercase text-center mb-5">Cadastro de Curso</h2>

                                        <form>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" id="form3Example1cg" class="form-control form-control-lg" name="txtNome"/>
                                                <label class="form-label" for="form3Example1cg">Nome Do Curso: </label>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="text" id="form3Example3cg" class="form-control form-control-lg" name="txtDescricao"/>
                                                <label class="form-label" for="form3Example3cg">Descrição: </label>
                                            </div>

                                            <div data-mdb-input-init class="form-outline mb-4">
                                                <input type="number" id="form3Example4cg" class="form-control form-control-lg" name="txtCargaHoraria"/>
                                                <label class="form-label" for="form3Example4cg">Carga Horária: </label>
                                            </div>

                                            <div class="d-flex justify-content-center">
                                                <button  type="submit" data-mdb-button-init name="btnCadastrar"
                                                         data-mdb-ripple-init class="btn btn-success btn-block btn-lg gradient-custom-4 text-body">Cadastrar</button>
                                            </div>
                                        </form>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <form method="post" class="d-flex flex-column align-items-center mt-5">
                    <p>
                    <h1>Cadastro de Curso</h1>
                    </p>
                    <div class="mb-3 w-50">
                        <label for="Input1" class="form-label">Nome do curso: </label>
                        <input type="text" class="form-control" id="Input1" name="txtNome">
                    </div>
                    <div class="mb-3 w-50">
                        <label for="exampleFormControlTextarea1" class="form-label">Descrição: </label>
                        <textarea type="text" class="form-control" id="exampleFormControlTextarea1" rows="3" name="txtDescricao"></textarea>
                    </div>
                    <div class="mb-3 w-50">
                        <label for="Input2" class="form-label">Carga Horária: </label>
                        <input type="number" class="form-control" id="Input2" name="txtCargaHoraria">
                    </div>
                    <button type="submit" class="btn btn-primary" name="btnCadastrar">Adicionar</button>
                </form>
        </main>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
<%
    if (request.getParameter("btnCadastrar") != null) {
        //Obter valores informados no Form
        String nomeVar = request.getParameter("txtNome");
        String descricaoVar = request.getParameter("txtDescricao");
        String cargaHorariaVar = request.getParameter("txtCargaHoraria");

        //conexao
        Statement st = null;
        ResultSet rs = null;
        st = new Conexao().conectar().createStatement();
        rs = st.executeQuery("SELECT * FROM curso WHERE nomeCurso = '" + nomeVar + "'");

        if (rs.next()) {
            out.print("<script> alert('Usuário já cadastrado!') </script>");
        } else {
            //inserir dados no bd
            st.executeUpdate("INSERT INTO curso(nomeCurso, descricao, cargaHoraria)VALUES ('" + nomeVar + "','" + descricaoVar + "', '" + cargaHorariaVar + "')");
%>
<script>
    alert("Cadastro com sucesso!");
    window.location.href = 'painelAdmCurso.jsp';
</script>
<%
        }
    }
%>