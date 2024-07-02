<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Marks Form</title>
    <link rel="stylesheet" href="styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%; /* Adjust as per your design */
            max-width: 600px; /* Adjust as per your design */
        }

        h2 {
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
            display: flex;
            flex-wrap: wrap;
            align-items: center;
        }

        .form-group label {
            flex: 1;
            margin-bottom: 5px;
        }

        .form-group input[type="text"],
        .form-group input[type="number"] {
            flex: 2;
            width: calc(100% - 10px);
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
            width: 100%;
        }

        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Student Marks Form</h2>
    <form action="MyForm" method="post">
        <div class="form-group">
            <label for="rollno">Roll Number:</label>
            <input type="text" id="rollno" name="rollno" required>
        </div>
        <div class="form-group">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required>
        </div>
        <div class="form-group">
            <label for="fatherName">Father's Name:</label>
            <input type="text" id="fatherName" name="fatherName" required>
        </div>
        <div class="form-group">
            <label for="DSA">DSA Marks:</label>
            <input type="number" id="DSA" name="DSA" min="0" max="100" required>
        </div>
        <div class="form-group">
            <label for="OOPS">OOPS Marks:</label>
            <input type="number" id="OOPS" name="OOPS" min="0" max="100" required>
        </div>
        <div class="form-group">
            <label for="EMA">EMA Marks:</label>
            <input type="number" id="EMA" name="EMA" min="0" max="100" required>
        </div>
        <div class="form-group">
            <label for="SE">SE Marks:</label>
            <input type="number" id="SE" name="SE" min="0" max="100" required>
        </div>
        <div class="form-group">
            <label for="DE">DE Marks:</label>
            <input type="number" id="DE" name="DE" min="0" max="100" required>
        </div>
        <div class="form-group">
            <label for="LINUX">LINUX Marks:</label>
            <input type="number" id="LINUX" name="LINUX" min="0" max="100" required>
        </div>
        <button type="submit">Submit</button>
    </form>
</div>
</body>
</html>
