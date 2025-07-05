<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<% 
    Ingredient ingredient = (Ingredient) request.getAttribute("ingredient"); 
    double prix = (double) request.getAttribute("prix");
    List<UniteMesure> unites = (List<UniteMesure>)request.getAttribute("unites");
    List<TypeIngredient> typesIngredients = (List<TypeIngredient>)request.getAttribute("types");
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
                    <%@ include file="/WEB-INF/jsp/ingredients/sidebar.jsp" %>
                </div>
    
                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <div class="form-container">
                        <h3 class="text-center mb-4">Modifier l'ingrédient</h3>
    
                        <form action="/ingredients/modifier/<%=ingredient.getId() %>" method="post">
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom de l'ingrédient</label>
                                <input type="text" class="form-control" id="nom" name="nom"
                                 value="<%= ingredient.getNom() %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="typeIngredient" class="form-label">Type d'ingrédient</label>
                                <select class="form-select" id="typeIngredient" name="typeIngredient.id" required>
                                <% for (TypeIngredient type : typesIngredients) { 
                                    if(ingredient.getType().getId()==type.getId()) { %>
                                        <option value="<%= type.getId() %>" selected><%= type.getNom() %></option>
                                    <% }
                                    else { %>
                                        <option value="<%= type.getId() %>"><%= type.getNom() %></option>
                                    <% }
                                } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="unite" class="form-label">Unité de mesure</label>
                                <select class="form-select" id="unite" name="unite.id" required>
                                <% for (UniteMesure unite : unites) { 
                                    if(ingredient.getUnite().getId()==unite.getId()) { %>
                                        <option value="<%= unite.getId() %>" selected><%= unite.getNom() %></option>
                                    <% }
                                    else { %>
                                        <option value="<%= unite.getId() %>"><%= unite.getNom() %></option>
                                    <% }
                                } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="descriptions" class="form-label">Déscription</label>
                                <textarea class="form-control" id="descriptions" rows="4"
                                 name="descriptions"><%= ingredient.getDescriptions() %></textarea>
                            </div>

                            <div class="mb-3">
                                <label for="prix" class="form-label">Coût de revient (en Ariary)</label>
                                <input type="number" class="form-control" id="prix" name="prix" step="0.1"
                                 value="<%= prix %>" required>
                            </div>
                            <button type="submit" class="btn btn-primary form-control">Valider</button>
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
