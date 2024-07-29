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
import model.Assessment;
import model.Course;
import model.Exam;
import model.Grade;
import model.Student;
import model.Subject;

/**
 *
 * @author KEISHA
 */
public class GradeDBContext extends DBContext<Grade> {

    public ArrayList<Grade> getGradesFromExamIds(ArrayList<Integer> eids) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        try {
            String sql = "SELECT eid,sid,score FROM grades WHERE (1>2)";
            for (Integer eid : eids) {
                sql += " OR eid = ?";
            }

            stm = connect.prepareStatement(sql);

            for (int i = 0; i < eids.size(); i++) {
                stm.setInt((i + 1), eids.get(i));
            }

            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Grade g = new Grade();
                g.setScore(rs.getFloat("score"));

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                g.setStudent(s);

                Exam e = new Exam();
                e.setId(rs.getInt("eid"));
                g.setExam(e);

                grades.add(g);
            }

        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                stm.close();
                connect.close();
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return grades;
    }

    public void insertGradesForCourse(int cid, ArrayList<Grade> grades) {
        String sql_remove = "DELETE FROM grades WHERE eid IN (SELECT e.eid FROM exams e WHERE e.aid IN (SELECT a.aid FROM assesments a WHERE a.subid IN (SELECT c.subid FROM courses c WHERE c.cid = ?)))";
        String sql_insert = "INSERT INTO grades\n"
                + "           (eid, sid, score)\n"
                + "     VALUES\n"
                + "           (?, ?, ?)";

        PreparedStatement stm_remove = null;
        PreparedStatement stm_insert = null;

        try {
            connect.setAutoCommit(false);
            stm_remove = connect.prepareStatement(sql_remove);
            stm_remove.setInt(1, cid);
            stm_remove.executeUpdate();

            stm_insert = connect.prepareStatement(sql_insert);
            for (Grade grade : grades) {
                stm_insert.setInt(1, grade.getExam().getId());
                stm_insert.setInt(2, grade.getStudent().getId());
                stm_insert.setFloat(3, grade.getScore());
                stm_insert.executeUpdate();
            }
            connect.commit();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connect.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connect.setAutoCommit(true);
                if (stm_remove != null) {
                    stm_remove.close();
                }
                if (stm_insert != null) {
                    stm_insert.close();
                }
                if (connect != null) {
                    connect.close();
                }
            } catch (SQLException ex) {
                Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    public ArrayList<Grade> getGradeByStudentID(int stdID) {
        ArrayList<Grade> grades = new ArrayList<>();

        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT st.sid, st.sname, s.subid, c.cid, c.cname, "
                    + "CASE "
                    + "    WHEN COUNT(g.score) < (SELECT COUNT(*) FROM assesments a WHERE a.subid = s.subid) "
                    + "    THEN 0 "
                    + "    ELSE AVG(g.score) "
                    + "END AS Average "
                    + "FROM students st "
                    + "LEFT JOIN students_courses sc ON st.sid = sc.sid "
                    + "LEFT JOIN courses c ON sc.cid = c.cid "
                    + "LEFT JOIN subjects s ON c.subid = s.subid "
                    + "LEFT JOIN exams e ON e.aid IN (SELECT a.aid FROM assesments a WHERE a.subid = s.subid) "
                    + "LEFT JOIN grades g ON g.eid = e.eid AND g.sid = st.sid "
                    + "WHERE st.sid = ? "
                    + "GROUP BY st.sid, st.sname, s.subid, c.cid, c.cname";
            stm = connect.prepareStatement(sql);
            stm.setInt(1, stdID);
            rs = stm.executeQuery();
            while (rs.next()) {
                Grade g = new Grade();
                g.setScore(rs.getFloat("Average"));

                Student s = new Student();
                s.setId(rs.getInt("sid"));
                s.setName(rs.getString("sname"));

                Course c = new Course();
                c.setId(rs.getInt("cid"));
                c.setName(rs.getString("cname"));

                ArrayList<Course> courses = new ArrayList<>();
                courses.add(c);
                s.setCourses(courses);

                g.setStudent(s);
                grades.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    public ArrayList<Grade> getGradeByCidAndSid(int courseID, int studentID) {
        PreparedStatement stm = null;
        ArrayList<Grade> grades = new ArrayList<>();
        try {
            String sql = "SELECT a.aname, a.weight, g.score\n"
                    + "FROM students st\n"
                    + "LEFT JOIN students_courses sc ON st.sid = sc.sid\n"
                    + "LEFT JOIN courses c ON sc.cid = c.cid\n"
                    + "LEFT JOIN assesments a ON c.subid = a.subid\n"
                    + "LEFT JOIN exams e ON e.aid = a.aid\n"
                    + "LEFT JOIN grades g ON g.eid = e.eid AND g.sid = st.sid\n"
                    + "WHERE st.sid = ? AND c.cid = ?;\n";

            stm = connect.prepareStatement(sql);
            stm.setInt(1, studentID);
            stm.setInt(2, courseID);
            ResultSet rs = stm.executeQuery();

            while (rs.next()) {
                Grade grade = new Grade();
                grade.setScore(rs.getFloat("score"));

                Assessment assessment = new Assessment();
                assessment.setName(rs.getString("aname"));
                assessment.setWeight(rs.getFloat("weight"));

                Exam exam = new Exam();
                exam.setAssessment(assessment);
                grade.setExam(exam);

                grades.add(grade);
            }

            rs.close();
            stm.close();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
    }

    public ArrayList<Grade> getGradesByCourses(ArrayList<Course> courses) {
        ArrayList<Grade> grades = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {

            for (Course course : courses) {
                String sql = "SELECT s.sid, s.sname, c.cid, c.cname, AVG(g.score) AS average_score "
                        + "FROM students s "
                        + "INNER JOIN students_courses sc ON s.sid = sc.sid "
                        + "INNER JOIN courses c ON sc.cid = c.cid "
                        + "INNER JOIN assesments a ON c.subid = a.subid "
                        + "INNER JOIN exams e ON a.aid = e.aid "
                        + "INNER JOIN grades g ON e.eid = g.eid AND s.sid = g.sid "
                        + "WHERE c.cid = ? "
                        + "GROUP BY s.sid, s.sname, c.cid, c.cname";
                stm = connect.prepareStatement(sql);
                stm.setInt(1, course.getId());
                rs = stm.executeQuery();

                while (rs.next()) {
                    Grade grade = new Grade();
                    grade.setScore(rs.getFloat("average_score"));

                    ArrayList<Course> cs = new ArrayList<>();
                    Course c = new Course();
                    c.setId(rs.getInt("cid"));
                    c.setName(rs.getString("cname"));
                    cs.add(c);

                    Student student = new Student();
                    student.setId(rs.getInt("sid"));
                    student.setName(rs.getString("sname"));
                    student.setCourses(cs);

                    grade.setStudent(student);
                    grades.add(grade);
                }
                rs.close();
                stm.close();
            }
            connect.close();
        } catch (SQLException ex) {
            Logger.getLogger(GradeDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return grades;
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
    public Grade get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public ArrayList<Grade> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
}
