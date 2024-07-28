/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller.subject;

import dal.ExamDBContext;
import dal.SubjectDBContext;
import java.io.IOException;
import java.util.ArrayList;
import model.Exam;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Subject;

/**
 *
 * @author KEISHA
 */

public class SubjectDetail extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        int subid = Integer.parseInt(request.getParameter("subid"));
        ExamDBContext db = new ExamDBContext();
        ArrayList<Exam> exams = db.getExamBySubID(subid);

        SubjectDBContext subDb = new SubjectDBContext();
        ArrayList<Subject> subs = subDb.list();
        
        request.setAttribute("exams", exams);
        request.setAttribute("subs", subs);
        request.getRequestDispatcher("../view/subject/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        doGet(request, response); // Handle POST requests same as GET
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }
}

