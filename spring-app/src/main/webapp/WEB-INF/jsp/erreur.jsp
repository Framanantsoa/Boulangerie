<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Erreur</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-danger">Erreur ${status}</h1>

        <% Object message = request.getAttribute("message"); 
        if (message instanceof String) { %>
            <p><strong>Message:</strong> <%= message %></p>
        <% 
        } else if (message instanceof String[]) { 
            String[] errors = (String[]) message; 
        %>
            <p><strong>Messages d'erreur:</strong></p>
            <ul>
                <% for (String err : errors) { %>
                    <li style="color: red;"><%= err %></li>
                <% } %>
            </ul>
        <% } %>
    </div>
</body>
</html>
