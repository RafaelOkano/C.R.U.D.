<%@ page import="config.Conexao" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idUsuario = request.getParameter("id");
    //converter a variavel para inteiro  
    int idUsuarioI = Integer.parseInt(idUsuario);
    //gerar a conexao com o BD
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    st.execute("DELETE FROM usuario WHERE idUsuario='" + idUsuarioI + "'");
%>
<script>
    alert("Usuário excluido com sucesso");
    window.location.href = "painelAdm.jsp";
</script>
