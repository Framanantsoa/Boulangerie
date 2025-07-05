<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Produit> produits = (List<Produit>)request.getAttribute("produits");
    String annee = request.getParameter("annee");
    String mois = request.getParameter("mois");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulaire de Vente</title>
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
                        <h3 class="text-center mb-4">Liste des produits conseillés</h3>
                        <!-- Lien vers l'insertion d'achat -->
                        <a href="/produits/conseilles/nouveau" class="btn btn-primary">Conseiller un produit</a>
                    </div>

                    <!-- Formulaire de filtres -->
                    <form method="get" action="${pageContext.request.contextPath}/produits/conseilles" class="mb-4">
                        <div class="row g-3">
                            <!-- Année -->
                            <div class="col-md-3">
                                <label for="annee" class="form-label">Année</label>
                                <input id="annee" name="annee" class="form-control" type="number"
                                 value="<%= (annee!=null)? annee:"" %>">
                            </div>

                            <!-- Mois -->
                            <div class="col-md-3">
                                <label for="mois" class="form-label">Mois</label>
                                <input type="number" id="mois" name="mois" class="form-control"
                                 value="<%= (mois!=null)? mois:"" %>">
                            </div>

                        </div>
                        <div class="col-md-12 d-flex align-items-end mt-3">
                            <button type="submit" class="btn btn-primary w-100">Filtrer</button>
                        </div>
                    </form>

                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom du produit</th>
                                    <th>Type du produit</th>
                                    <th>En stock</th>
                                </tr>
                            </thead>
                            <tbody>
                                <% if (produits == null || produits.isEmpty()) { %>
                                <tr>
                                    <td colspan="4" class="text-center">Aucun produit conseillé.</td>
                                </tr>
                                <% } else {
                                    for (Produit produit : produits) { %>
                                <tr>
                                    <td><%= produit.getId() %></td>
                                    <td><%= produit.getNom() %></td>
                                    <td><%= produit.getType().getNom() %></td>
                                    <td><%= produit.getStock().getQuantite() %></td>
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