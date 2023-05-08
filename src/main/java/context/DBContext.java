
package context;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;


public class DBContext {
//     public Connection getConnection()throws Exception {
//        String url = "jdbc:mysql:localhost//"+serverName+":"+portNumber + "\\" + instance +";databaseName="+dbName;
//        if(instance == null || instance.trim().isEmpty())
//            url = "jdbc:mysql:localhost//"+serverName+":"+portNumber +";databaseName="+dbName;
//        Class.forName("com.mysql.jdbc.Driver");
//        return DriverManager.getConnection(url, userID, password);
//    }

    private String jdbcURL = "jdbc:mysql://localhost:3306/wish";
    private String jdbcUserName = "root";
    private String jdbcPassword = "tronganh8893";

    public Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUserName, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;

        /*Insert your other code right after this comment*/
        /*Change/update information of your database connection, DO NOT change name of instance variables in this class*/
//    private final String serverName = "localhost";
//    private final String dbName = "wish";
//    private final String portNumber = "1433";
//    private final String instance="";//LEAVE THIS ONE EMPTY IF YOUR SQL IS A SINGLE INSTANCE
//    private final String userID = "root";
//    private final String password = "tronganh8893";

    }
}
 