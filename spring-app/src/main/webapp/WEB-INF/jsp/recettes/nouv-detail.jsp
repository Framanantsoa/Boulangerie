<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Recette> recettes = (List<Recette>)request.getAttribute("recettes");
    List<Ingredient> ingredients = (List<Ingredient>)request.getAttribute("ingredients");
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
                    <%@ include file="/WEB-INF/jsp/recettes/sidebar.jsp" %>
                </div>
    
                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <div class="form-container">
                        <h3 class="text-center mb-4">Ajout d' ingrédient pour une recette</h3>
    
                        <form action="/recettes/details/nouv" method="post">
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom de la recette</label>
                                <select class="form-select" id="unite" name="recette.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for (Recette recette : recettes) { %>
                                        <option value="<%= recette.getId() %>"><%= recette.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="ingredient" class="form-label">Nom de l'ingrédient</label>
                                <select class="form-select" id="ingredient" name="ingredient.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for (Ingredient ingred : ingredients) { %>
                                        <option value="<%= ingred.getId() %>"><%= ingred.getNom() %> (en <%=ingred.getUnite().getNom()%>)</option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="quantite" class="form-label">Quantité</label>
                                <input type="number" class="form-control" id="quantite" name="quantite" step="0.1" required>
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
