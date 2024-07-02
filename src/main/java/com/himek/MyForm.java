package com.himek;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class MyForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter pw = res.getWriter();
        
        try {
            String url = "jdbc:mysql://localhost:3306/student_managment_system";
            String username = "root";
            String password = "5381";
            
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection(url, username, password);
            
            PreparedStatement pStatement = connection.prepareStatement("INSERT INTO student_marks (rollno, name, fatherName, DSA, OOPS, EMA, SE, DE, LINUX, totalMarks, percentage, grade) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
            pStatement.setString(1, req.getParameter("rollno"));
            pStatement.setString(2, req.getParameter("name"));
            pStatement.setString(3, req.getParameter("fatherName"));
            pStatement.setInt(4, Integer.parseInt(req.getParameter("DSA")));
            pStatement.setInt(5, Integer.parseInt(req.getParameter("OOPS")));
            pStatement.setInt(6, Integer.parseInt(req.getParameter("EMA")));
            pStatement.setInt(7, Integer.parseInt(req.getParameter("SE")));
            pStatement.setInt(8, Integer.parseInt(req.getParameter("DE")));
            pStatement.setInt(9, Integer.parseInt(req.getParameter("LINUX")));
            
            int totalMarks = Integer.parseInt(req.getParameter("DSA")) +
                             Integer.parseInt(req.getParameter("OOPS")) +
                             Integer.parseInt(req.getParameter("EMA")) +
                             Integer.parseInt(req.getParameter("SE")) +
                             Integer.parseInt(req.getParameter("DE")) +
                             Integer.parseInt(req.getParameter("LINUX"));
            
            float percentage = (float) totalMarks / 6.0f;
            
            String grade;
            if (percentage >= 90) {
                grade = "A";
            } else if (percentage >= 80) {
                grade = "B";
            } else if (percentage >= 70) {
                grade = "C";
            } else if (percentage >= 60) {
                grade = "D";
            } else {
                grade = "F";
            }
            
            pStatement.setInt(10, totalMarks);
            pStatement.setFloat(11, percentage);
            pStatement.setString(12, grade);
            
            int resultSet = pStatement.executeUpdate();
            if (resultSet > 0) {
                pw.print("Form Submitted Successfully<br>");
                pw.print("Total Marks: " + totalMarks + "<br>");
                pw.print("Percentage: " + percentage + "<br>");
                pw.print("Grade: " + grade + "<br>");
            } else {
                pw.print("Form Not Submitted Successfully");
            }
            
        } catch (Exception e) {
            pw.print("Exception: " + e.getMessage());
            e.printStackTrace(pw);
        } finally {
            pw.close();
        }
    }
}
