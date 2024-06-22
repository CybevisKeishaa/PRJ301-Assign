package dal;

/*me
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author KEISHA
 */
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;

public abstract class DBContext<T> {
    protected Connection connect;
    
    public DBContext(){
        try {
            String user = "Keishaa";
            String pass = "123";
            String url  = "jdbc:sqlserver://localhost\\SQLEXPRESS:1433;databaseName=Assignment_SU24;encrypt=true;trustservercertificate=true;";
            
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connect = DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
}

    public abstract void insert();
    
    public abstract void delete();
    
    public abstract void update();
    
    public abstract T get(int id);
    
    public abstract ArrayList<T> list();
    
    
    
    
}