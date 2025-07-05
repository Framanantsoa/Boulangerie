<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List" %>
<%@page import="java.util.Map" %>

<%
    // Récupération des attributs et paramètres
    List<Map<String, Object>> commissions = (List<Map<String, Object>>) request.getAttribute("commissions");

    String dateMin = request.getParameter("dateMin");
    String dateMax = request.getParameter("dateMax");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boulangerie - Liste des commissions</title>
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

                <!-- Contenu principal -->
                <div class="col-lg-8 col-md-7">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-center mb-4">Liste des commissions</h3>
                        <!-- Liste des clients -->
                        <a href="/produits/commissions/genres" class="btn btn-primary">Commissions par genre</a>
                    </div>

                    <!-- Formulaire de filtres -->
                    <form method="get" action="${pageContext.request.contextPath}/produits/commissions" class="mb-4">
                        <div class="row g-3">
                            <!-- Filtre par date de début -->
                            <div class="col-md-6">
                                <label for="dateMin" class="form-label">Date début</label>
                                <input type="date" id="dateMin" name="dateMin" class="form-control" value="<%= dateMin != null ? dateMin : "" %>">
                            </div>

                            <!-- Filtre par date de fin -->
                            <div class="col-md-6">
                                <label for="dateMax" class="form-label">Date fin</label>
                                <input type="date" id="dateMax" name="dateMax" class="form-control" value="<%= dateMax != null ? dateMax : "" %>">
                            </div>
                        </div>
                        <div class="mt-3">
                            <button type="submit" class="btn btn-primary w-100">Filtrer</button>
                        </div>
                    </form>

                    <!-- Tableau des commissions -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover" style="font-size: 0.875rem;">
                            <thead class="table-light">
                                <tr>
                                    <th>ID</th>
                                    <th>Date de vente</th>
                                    <th>Nom du client</th>
                                    <th>Nom du produit</th>
                                    <th>Prix unitaire</th>
                                    <th>Quantité</th>
                                    <th>Commission</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (commissions == null || commissions.isEmpty()) { %>
                                <tr>
                                    <td colspan="7" class="text-center">Aucun résultat trouvé pour ces critères.</td>
                                </tr> <% 
                                } else {
                                    for (Map<String, Object> commission : commissions) { %>
                                    <tr>
                                        <td><%= commission.get("id_vente_prod") %></td>
                                        <td><%= commission.get("date_vente") %></td>
                                        <td><%= commission.get("nom_client") %></td>
                                        <td><%= commission.get("nom_produit") %></td>
                                        <td><%= commission.get("prix_prod") %></td>
                                        <td><%= commission.get("quantite_vendue") %></td>
                                        <td><%= commission.get("commission") %></td>
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
