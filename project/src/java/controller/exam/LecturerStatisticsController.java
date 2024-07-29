/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.exam;

import controller.auth.BaseRequiredLecturerAuthenticationController;
import dal.CourseDBContext;
import dal.GradeDBContext;
import model.Course;
import model.Grade;
import model.Lecturer;
import model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 * @author KEISHA
 */
public class LecturerStatisticsController extends BaseRequiredLecturerAuthenticationController {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer)
            throws ServletException, IOException {
        int lid = lecturer.getId();
        CourseDBContext courseDB = new CourseDBContext();
        GradeDBContext gradeDB = new GradeDBContext();

        ArrayList<Course> courses = courseDB.getCoursesByLecturer(lid);
        ArrayList<Grade> grades = gradeDB.getGradesByCourses(courses);

        request.setAttribute("grades", grades);
        request.setAttribute("courses", courses);
        request.getRequestDispatcher("../view/exam/statistics.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response, User user, Lecturer lecturer) throws ServletException, IOException {
        doGet(request, response, user, lecturer);
    }

    @Override
    public String getServletInfo() {
        return "Lecturer Statistics Controller";
    }

    
    

}
