/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Subject;
import controller.student.list;
import java.util.ArrayList;
import model.Student;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Subject;

/**
 *
 * @author KEISHA
 */
public class StudentDBContext extends DBContext<Student> {

    

    @Override
    public ArrayList<Student> list() {
        PreparedStatement stm = null;

        ArrayList<Student> students = new ArrayList<>();
        try {
            String sql = "SELECT sid, sname FROM students";
            stm = connect.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));

                students.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return students;
    }

    @Override
    public void insert() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student get(int id) {
        PreparedStatement stm = null;
        Student s = null;
        
        try {
        String sql = "SELECT s.sid, s.sname, sub.subid, sub.subname\n" +
                    "FROM  students s\n" +
                    "JOIN students_courses sc ON s.sid = sc.sid\n" +
                    "JOIN courses c ON sc.cid = c.cid\n" +
                    "JOIN subjects sub ON c.subid = sub.subid\n" +
                    "WHERE s.sid = ? \n" +
                    "ORDER BY  s.sid, sub.subid;";
        
            
            stm= connect.prepareStatement(sql);
            stm.setInt(1, id);
            ResultSet rs = stm.executeQuery();
            if(rs.next()){
                s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));
            }
            
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }finally {
            try {
                stm.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return s;
    }
   
    
}
