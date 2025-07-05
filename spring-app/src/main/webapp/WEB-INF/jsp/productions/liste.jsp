<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Ingredient> ingredients = (List<Ingredient>) request.getAttribute("ingredients");
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
    List<Production> productions = (List<Production>) request.getAttribute("productions");

    String idProduit = request.getParameter("idProduit");
    String idIngredient = request.getParameter("idIngredient");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boulangerie - Liste des productions</title>
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
                    <h3 class="text-center mb-4">Liste des productions</h3>

                    <!-- Formulaire de filtres -->
                    <form method="get" action="${pageContext.request.contextPath}/productions/liste" class="mb-4">
                        <div class="row g-3">
                            <div class="col-md-4">
                                <label for="idProduit" class="form-label">Produit</label>
                                <select id="idProduit" name="idProduit" class="form-select">
                                    <option value="">-- Tous les produits --</option>
                                    <% if (produits != null) {
                                        for (Produit produit : produits) {
                                            boolean selected = idProduit != null && idProduit.equals(produit.getId().toString());
                                    %>
                                    <option value="<%= produit.getId() %>" <%= selected ? "selected" : "" %>>
                                        <%= produit.getNom() %>
                                    </option>
                                    <% } } %>
                                </select>
                            </div>
                        </div>
                        <div class="row g-3 mt-3">
                            <div class="col-md-4">
                                <label for="idIngredient" class="form-label">Ingrédient</label>
                                <select id="idIngredient" name="idIngredient" class="form-select">
                                    <option value="">-- Tous les ingrédients --</option>
                                    <% if (ingredients != null) {
                                        for (Ingredient ingredient : ingredients) {
                                            boolean selected = idIngredient != null && idIngredient.equals(ingredient.getId().toString());
                                    %>
                                    <option value="<%= ingredient.getId() %>" <%= selected ? "selected" : "" %>>
                                        <%= ingredient.getNom() %>
                                    </option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-8 d-flex align-items-end">
                                <button type="submit" class="btn btn-primary w-100">Filtrer</button>
                            </div>
                        </div>
                    </form>

                    <!-- Tableau des productions -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Date de production</th>
                                    <th>Nom de recette</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (productions == null || productions.isEmpty()) { %>
                                <tr>
                                    <td colspan="4" class="text-center">Aucune production faite pour le moment.</td>
                                </tr>
                                <% } else {
                                    for (Production prod : productions) { %>
                                <tr>
                                    <td><%= prod.getId() %></td>
                                    <td><%= prod.getDateTime() %></td>
                                    <td><%= prod.getRecette() != null ? prod.getRecette().getNom() : "N/A" %></td>
                                    <td>
                                        <a href="#" class="btn btn-info btn-sm">Voir détails</a>
                                    </td>
                                </tr>
                                <% } } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <%@ include file="/WEB-INF/includes/footer.jsp" %>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
