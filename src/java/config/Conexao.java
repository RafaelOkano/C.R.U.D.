package config;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.DriverManager;

public class Conexao {
    //SQLException caso ocorra algum erro de SQL
    //ClassNotFoundException se drive JDBC nao for encontrado
    public Connection conectar() throws SQLException, ClassNotFoundException {
        // carrega o driver JDBC
        Class.forName("com.mysql.cj.jdbc.Driver");

        //configurar conexao
        String url = "jdbc:mysql://localhost:3306/formacaojava"; // nome do banco de dados
        String user = "root"; // usuario para acessar banco de dados
        String password = ""; // senha para acessar banco de dados

        return DriverManager.getConnection(url, user, password);
    }
}
//é sempre igual em todos os projetos,só muda o nome do banco de dados
