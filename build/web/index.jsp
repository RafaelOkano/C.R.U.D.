<%@ page import = "config.Conexao" %>
<%@ page import = "java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login do Sistema</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    </head>
    <body>
        <section class="vh-100">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-sm-6 text-black">

                        <div class="d-flex align-items-center h-custom-2 px-5 ms-xl-4 mt-5 pt-5 pt-xl-0 mt-xl-n5">

                            <form style="width: 23rem;" method="post">

                                <h3 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Login</h3>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" name="txtlogin" id="form2Example18" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example18">Usuário</label>
                                </div>

                                <div data-mdb-input-init class="form-outline mb-4">
                                    <input type="text" name="txtsenha" id="form2Example28" class="form-control form-control-lg" />
                                    <label class="form-label" for="form2Example28">Senha</label>
                                </div>

                                <div class="pt-1 mb-4">
                                    <button data-mdb-button-init data-mdb-ripple-init class="btn btn-info btn-lg btn-block" type="submit">Login</button>
                                </div>
                            </form>
                        </div>

                    </div>
                    <div class="col-sm-6 px-0 d-none d-sm-block">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img3.webp"
                             alt="Login image" class="w-100 vh-100" style="object-fit: cover; object-position: left;">
                    </div>
                </div>
            </div>
        </section>
        <%
            //login : senac  senha : 123
            //obtem os valores dos inputs
            String loginVar = request.getParameter("txtlogin");
            String senhaVar = request.getParameter("txtsenha");

            Statement st = null; // executar a consulta
            ResultSet rs = null; // armazenar a consulta

            //criar a conexao com o bd. Statement permite executar SQL (insert,select..)
            st = new Conexao().conectar().createStatement();

            // executa a consulta na tabela usuario,conforme o login e senha informado
            rs = st.executeQuery("SELECT * FROM usuario WHERE login='" + loginVar + "' AND senha='" + senhaVar + "'");

            int i = 0; // inicializar o contador que verifica a quantidade de registro.

            String nomeUsuario = null;

            //verifica se ha pelo menos um registro
            if (rs.next()) {
                i = 1; //indica que encontrou pelo menos um usuario.
                nomeUsuario = rs.getString(2); // captura o nome do usuario encontrado.
            }
            // verifica se os campos estao vazios
            if (loginVar == null || senhaVar == null) {
                out.print("Por favor,verifique o usuário e senha");
            } //verifica se retornou algum usuario
            else if (i > 0) {
                //armazenar o nome do usuario em uma sessao
                session.setAttribute("nomeUsuario", nomeUsuario);
                //redirecionar para a pagina PAINEL ADM
                response.sendRedirect("painelAdm.jsp");
            } else {
                //nao localizou o usuario informado
                out.print("Dados incorretos.");
            }
        %>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    </body>
</html>
