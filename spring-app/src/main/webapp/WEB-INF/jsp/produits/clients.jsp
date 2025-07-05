<%@page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.List" %>
<%@page import="java.time.LocalDate" %>
<%@page import="com.proj.app.entities.*" %>

<%
    // Récupération des attributs et paramètres
    List<Produit> produits = (List<Produit>) request.getAttribute("produits");
    List<Client> clients = (List<Client>) request.getAttribute("clients");

    String idProduit = request.getParameter("idProduit");
    String dateMin = request.getParameter("dateMin");
    String dateMax = request.getParameter("dateMax");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Boulangerie - Liste des clients</title>
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
                    <h3 class="text-center mb-4">Liste des clients</h3>

                    <!-- Formulaire de filtres -->
                    <form method="get" action="${pageContext.request.contextPath}/produits/clients" class="mb-4">
                        <div class="row g-3">
                            <!-- Sélecteur de produit -->
                            <div class="col-md-4">
                                <label for="idProduit" class="form-label">Produit acheté par le client</label>
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

                            <!-- Filtre par date de début -->
                            <div class="col-md-4">
                                <label for="dateMin" class="form-label">Date début</label>
                                <input type="date" id="dateMin" name="dateMin" class="form-control" value="<%= dateMin != null ? dateMin : "" %>">
                            </div>

                            <!-- Filtre par date de fin -->
                            <div class="col-md-4">
                                <label for="dateMax" class="form-label">Date fin</label>
                                <input type="date" id="dateMax" name="dateMax" class="form-control" value="<%= dateMax != null ? dateMax : "" %>">
                            </div>
                        </div>
                        <div class="col-md-12 d-flex align-items-end mt-3">
                            <button type="submit" class="btn btn-primary w-100">Filtrer</button>
                        </div>
                    </form>

                    <!-- Tableau des clients -->
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom du client</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (clients == null || clients.isEmpty()) { %>
                                <tr>
                                    <td colspan="2" class="text-center">Aucun client trouvé pour ces critères.</td>
                                </tr>
                                <% } else {
                                    for (Client client : clients) { %>
                                <tr>
                                    <td><%= client.getId() %></td>
                                    <td><%= client.getNom() %></td>
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
