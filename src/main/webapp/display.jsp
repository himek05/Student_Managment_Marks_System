<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: center;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Student Marks</h2>
        <table>
            <thead>
                <tr>
                    <th>Roll Number</th>
                    <th>Name</th>
                    <th>Father's Name</th>
                    <th>DSA Marks</th>
                    <th>OOPS Marks</th>
                    <th>EMA Marks</th>
                    <th>SE Marks</th>
                    <th>DE Marks</th>
                    <th>LINUX Marks</th>
                    <th>Total Marks</th>
                    <th>Percentage</th>
                    <th>Grade</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    Connection connection = null;
                    Statement statement = null;
                    ResultSet resultSet = null;
                    
                    try {
                        // Database connection parameters
                        String url = "jdbc:mysql://localhost:3306/student_managment_system";
                        String username = "root";
                        String password = "5381";
                        
                        // Load and register JDBC driver
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        
                        // Establish connection
                        connection = DriverManager.getConnection(url, username, password);
                        
                        // SQL query to retrieve student marks
                        String query = "SELECT * FROM student_marks";
                        
                        // Create statement
                        statement = connection.createStatement();
                        
                        // Execute query
                        resultSet = statement.executeQuery(query);
                        
                        // Iterate through result set and display rows
                        while(resultSet.next()) {
                %>
                <tr>
                    <td><%= resultSet.getString("rollno") %></td>
                    <td><%= resultSet.getString("name") %></td>
                    <td><%= resultSet.getString("fatherName") %></td>
                    <td><%= resultSet.getInt("DSA") %></td>
                    <td><%= resultSet.getInt("OOPS") %></td>
                    <td><%= resultSet.getInt("EMA") %></td>
                    <td><%= resultSet.getInt("SE") %></td>
                    <td><%= resultSet.getInt("DE") %></td>
                    <td><%= resultSet.getInt("LINUX") %></td>
                    <td><%= resultSet.getInt("totalMarks") %></td>
                    <td><%= resultSet.getFloat("percentage") %></td>
                    <td><%= resultSet.getString("grade") %></td>
                </tr>
                <% 
                        }
                    } catch (ClassNotFoundException e) {
                        out.println("Class not found: " + e.getMessage());
                    } catch (SQLException e) {
                        out.println("SQL Exception: " + e.getMessage());
                    } finally {
                        // Close resources
                        try {
                            if (resultSet != null) resultSet.close();
                            if (statement != null) statement.close();
                            if (connection != null) connection.close();
                        } catch (SQLException e) {
                            out.println("SQL Exception (closing): " + e.getMessage());
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
</body>
</html>
