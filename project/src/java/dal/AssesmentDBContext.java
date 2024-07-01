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

    public static void main(String[] args) {
        AssesmentDBContext db = new AssesmentDBContext();
        System.out.println(db.getAssesmentBySubject(1).size());
    }

    public ArrayList<Assessment> getAssesmentBySubject(int subid) {
        PreparedStatement stm = null;
        ArrayList<Assessment> ass = new ArrayList<>();

        try {

            String sql = "SELECT \n"
                    + "	 s.subid,\n"
                    + "    s.subname, \n"
                    + "    a.aname, \n"
                    + "    a.weight\n"
                    + "FROM \n"
                    + "    subjects s\n"
                    + "JOIN \n"
                    + "    assesments a ON s.subid = a.subid\n"
                    + "WHERE s.subid = ?";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, subid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Assessment asses = new Assessment();
                asses.setName(rs.getString("aname"));
                asses.setWeight(rs.getFloat("weight"));
                ass.add(asses);
                
            }

        } catch (SQLException ex) {
            Logger.getLogger(AssesmentDBContext.class.getName()).log(Level.SEVERE, null, ex);
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
    public Assessment get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Assessment> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
