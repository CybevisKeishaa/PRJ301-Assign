/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.status;

import controller.auth.BaseRequiredStudent;
import dal.GradeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Grade;
import model.Student;
import model.User;

/**
 *
 * @author KEISHA
 */
public class StudentStatus extends BaseRequiredStudent {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student)
            throws ServletException, IOException {
        GradeDBContext db = new GradeDBContext();

        int sid = student.getId();
        String name = student.getName();
        String cidParam = request.getParameter("cid");

        // Lấy danh sách điểm tổng quát
        ArrayList<Grade> grades = db.getGradeByStudentID(sid);
        request.setAttribute("grades", grades);
        request.setAttribute("name", name);

        if (cidParam != null) {
            // Lấy danh sách điểm chi tiết nếu có cid
            int cid = Integer.parseInt(cidParam);
            ArrayList<Grade> details = db.getGradeByCidAndSid(cid, sid);
            request.setAttribute("details", details);
        }

        request.getRequestDispatcher("../view/student/status.jsp").forward(request, response);

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student)
            throws ServletException, IOException {
        GradeDBContext db = new GradeDBContext();
        int sid = student.getId();
        String name = student.getName();
        String cidParam = request.getParameter("cid");

        // Lấy danh sách điểm tổng quát
        ArrayList<Grade> grades = db.getGradeByStudentID(sid);
        request.setAttribute("grades", grades);
        request.setAttribute("name", name);

        if (cidParam != null) {
            // Lấy danh sách điểm chi tiết nếu có cid
            int cid = Integer.parseInt(cidParam);
            ArrayList<Grade> details = db.getGradeByCidAndSid(cid, sid);
            request.setAttribute("details", details);
        }

        request.getRequestDispatcher("../view/student/status.jsp").forward(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
