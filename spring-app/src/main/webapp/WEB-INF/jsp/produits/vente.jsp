<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<PrixProduit> prixProduits = (List<PrixProduit>)request.getAttribute("prixProduits");
    List<Genre> genres = (List<Genre>)request.getAttribute("genres");
    List<Commission> commissions = (List<Commission>)request.getAttribute("commissions");
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
                    <div class="form-container">
                        <h3 class="text-center mb-4">Vendre un produit</h3>
    
                        <form action="/produits/vendre" method="post">
                            <div class="mb-3">
                                <label for="prixProduit" class="form-label">Nom du produit</label>
                                <select class="form-select" id="prixProduit" name="prixProduit.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for(PrixProduit pProd : prixProduits) { %>
                                        <option value="<%= pProd.getId() %>">
                                            <%= pProd.getProduit().getNom() %> (<%=pProd.getProduit().getStock().getQuantite()%>) (<%= pProd.getPrix() %> Ar)
                                        </option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="commission.id" class="form-label">Commission</label>
                                <select class="form-select" id="commission.id" name="commission.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for(Commission commission : commissions) { %>
                                        <option value="<%= commission.getId() %>">
                                            <%= commission.getValeur() %> 
                                        </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="quantite" class="form-label">Quantité</label>
                                <input type="number" class="form-control" id="quantite" name="quantite" required>
                            </div>

                            <div class="mb-3">
                                <label for="nomClient" class="form-label">Nom complet du client</label>
                                <input type="text" class="form-control" id="nomClient" name="nomClient" required>
                            </div>
                            <div class="mb-3">
                                <label for="genre" class="form-label">Genre du client</label>
                                <select class="form-select" id="genre" name="genre" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for(Genre genre : genres) { %>
                                        <option value="<%= genre.getId() %>">
                                            <%= genre.getNom() %> 
                                        </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="date" class="form-label">Date de vente</label>
                                <input type="date" class="form-control" id="date" name="date" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Valider</button>
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