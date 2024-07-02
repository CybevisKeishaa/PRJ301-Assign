/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Assessment;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Exam;
import model.Subject;

/**
 *
 * @author KEISHA
 */
public class AssesmentDBContext extends DBContext<Assessment> {

    public ArrayList<Assessment> getAssesmentBySubject(int subid) {
        PreparedStatement stm = null;
        ArrayList<Assessment> ass = new ArrayList<>();

        try {
            String sql = "SELECT a.aname, a.weight, a.subid, e.duration FROM assesments a\n"
                    + "INNER JOIN exams e on e.aid = a.aid\n"
                    + "WHERE a.subid = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment asses = new Assessment();
                asses.setName(rs.getString("aname"));
                asses.setWeight(rs.getFloat("weight"));

            }
        } catch (SQLException ex) {
            Logger.getLogger(AssesmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            if (stm != null) {
                try {
                    stm.close();
                } catch (SQLException e) {
                    Logger.getLogger(AssesmentDBContext.class.getName()).log(Level.SEVERE, null, e);
                }
            }
        }
        return ass;
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
    public Assessment get(int id
    ) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Assessment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
