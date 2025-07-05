<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<TypeIngredient> typesIngredients = (List<TypeIngredient>)request.getAttribute("typesIngredients");
    List<TypeProduit> typesProduits = (List<TypeProduit>)request.getAttribute("typesProduits");
    List<VenteProduit> ventes = (List<VenteProduit>) request.getAttribute("ventes");
    
    String idTypeProd = request.getParameter("idTypeProd");
    String idTypeIngred = request.getParameter("idTypeIngred");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Liste des Ventes</title>
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
                    <%@ include file="/WEB-INF/jsp/produits/sidebar.jsp" %>
                </div>

                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-center mb-4">Liste des ventes de produits</h3>
                        <!-- Liste des clients -->
                        <a href="/produits/clients" class="btn btn-primary">Liste des clients</a>
                        <!-- Lien vers l'insertion d'achat -->
                        <a href="/produits/ventes" class="btn btn-primary">Nouvelle vente</a>
                    </div>
                    
                <!-- Formulaire de filtre -->
                    <form action="/produits/liste/ventes" method="GET" class="mb-4">
                        <div class="row">
                            <!-- Types de produits -->
                            <div class="col-md-8">
                                <label for="idTypeProd" class="form-label">Type de produit</label>
                                <select id="idTypeProd" name="idTypeProd" class="form-select">
                                    <% if (typesProduits != null) { %>
                                        <option value="">-- Tous les types --</option>
                                        <% for (TypeProduit typeProduit : typesProduits) {
                                            boolean selected = idTypeProd != null && idTypeProd.equals(typeProduit.getId().toString());
                                    %>
                                    <option value="<%= typeProduit.getId() %>" <%= selected ? "selected" : "" %>>
                                        <%= typeProduit.getNom() %>
                                    </option>
                                    <% } } %>
                                </select>
                            </div>
                            <!-- Types d'ingrédients -->
                            <div class="col-md-8">
                                <label for="idTypeIngred" class="form-label">Type d'ingrédient</label>
                                <select id="idTypeIngred" name="idTypeIngred" class="form-select">
                                    <% if (typesIngredients!= null) { %>
                                        <option value="">-- Tous les types --</option>
                                        <% for (TypeIngredient typeIngred : typesIngredients) {
                                            boolean selected = idTypeIngred != null && idTypeIngred.equals(typeIngred.getId().toString());
                                    %>
                                    <option value="<%= typeIngred.getId() %>" <%= selected ? "selected" : "" %>>
                                        <%= typeIngred.getNom() %>
                                    </option>
                                    <% } } %>
                                </select>
                            </div>
                            <div class="col-md-8 d-flex align-items-end">
                                <button type="submit" class="btn btn-success w-100">Filtrer</button>
                            </div>
                        </div>
                    </form>

                    <!-- Tableau des ventes -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Date de vente</th>
                                    <th>Produit vendu</th>
                                    <th>Quantité(s)</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (ventes == null || ventes.isEmpty()) { %>
                                <tr>
                                    <td colspan="4" class="text-center">Aucune vente faite.</td>
                                </tr>
                                <% } else {
                                    for (VenteProduit venteProduit : ventes) { %>
                                <tr>
                                    <td><%= venteProduit.getId() %></td>
                                    <td><%= venteProduit.getDate() %></td>
                                    <td><%= venteProduit.getPrixProduit().getProduit().getNom() %></td>
                                    <td><%= venteProduit.getQuantite() %></td>
                                </tr>
                                <% } } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>