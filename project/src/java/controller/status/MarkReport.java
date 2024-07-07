/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.status;

import controller.auth.BaseRequiredStudent;
import dal.CourseDBContext;
import dal.GradeDBContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import model.Course;
import model.Grade;
import model.Student;
import model.User;

/**
 *
 * @author KEISHA
 */
public class MarkReport extends BaseRequiredStudent {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Student student)
    throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("cid"));
        int sid = student.getId();
        GradeDBContext db = new GradeDBContext();
        ArrayList<Grade> grades = db.getGradeByCidAndSid(cid, sid);
        
        request.setAttribute("grades", grades);
        request.getRequestDispatcher("../view/student/mark.jsp").forward(request, response);
        
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Student student)
    throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("course"));
        int sid = student.getId();
        GradeDBContext db = new GradeDBContext();
        ArrayList<Grade> grades = db.getGradeByCidAndSid(cid, sid);
        
        request.setAttribute("grades", grades);
        request.getRequestDispatcher("../view/student/mark.jsp").forward(request, response);
        
        
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
