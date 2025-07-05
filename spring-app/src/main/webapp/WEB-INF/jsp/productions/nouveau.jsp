<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Recette> recettes = (List<Recette>)request.getAttribute("recettes");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boulangerie</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/header.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/ingredient.css">
</head>
<body>
    <%@ include file="/WEB-INF/includes/header.jsp" %>
    
    <main>
        <div class="container py-4">
            <div class="row">
                <!-- Sidebar -->
                <div class="col-lg-4 col-md-5 mb-3 mb-md-0">
                    <%@ include file="/WEB-INF/jsp/productions/sidebar.jsp" %>
                </div>
    
                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <div class="form-container">
                        <h3 class="text-center mb-4">Faire une production</h3>
    
                        <form action="/productions/nouvelle" method="post">
                            <div class="mb-3">
                                <label for="dateTime" class="form-label">Date et heure</label>
                                <input type="datetime-local" class="form-control" id="dateTime" name="dateTime" required>
                            </div>
                            <div class="mb-3">
                                <label for="recette" class="form-label">Nom de la recette</label>
                                <select class="form-select" id="recette" name="recette.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for (Recette recette: recettes) { %>
                                        <option value="<%= recette.getId() %>"><%= recette.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <button type="submit" class="btn btn-primary form-control">Ajouter</button>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/includes/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
