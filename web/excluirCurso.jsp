<%@ page import="config.Conexao" %>
<%@ page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String idCurso = request.getParameter("id");
    //converter a variavel para inteiro  
    int idCursoI = Integer.parseInt(idCurso);
    //gerar a conexao com o BD
    Statement st = null;
    ResultSet rs = null;
    st = new Conexao().conectar().createStatement();
    st.execute("DELETE FROM curso WHERE idCurso='" + idCursoI + "'");
%>
<script>
    alert("Usuário excluido com sucesso");
    window.location.href = "painelAdmCurso.jsp";
</script>
