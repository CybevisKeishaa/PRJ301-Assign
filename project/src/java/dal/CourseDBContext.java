/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Student;

/**
 *
 * @author KEISHA
 */
public class CourseDBContext extends DBContext<Course> {

    public ArrayList<Course> getCoursesByLecturer(int lid) {
        ArrayList<Course> courses = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT c.cid,c.cname FROM courses c INNER JOIN lecturers l ON l.lid = c.lid\n"
                    + "				INNER JOIN semester sem ON sem.semid = c.semid\n"
                    + "				WHERE l.lid = ? AND sem.active = 1";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                courses.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return courses;

    }

    public ArrayList<Course> getCourseByStudentID(int studentID) {
            ArrayList<Course> courses = new ArrayList<>();
            PreparedStatement stm = null;
        
        try {
            
            
            String sql = "SELECT s.sid, s.sname,c.cid, c.cname FROM students s \n"
                    + "Inner JOIN students_courses sc on sc.sid = s.sid\n"
                    + "inner JOIN courses c on c.cid = sc.cid\n"
                    + "WHERE s.sid = ?";
            
            stm = connect.prepareStatement(sql);
            
            stm.setInt(1, studentID);
            ResultSet rs = stm.executeQuery();
            
            while(rs.next()){
                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));
                courses.add(c);
                
                
            }
            
            
            
            
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return courses;
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
    public Course get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Course> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
