<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<TypeProduit> typesProduits = (List<TypeProduit>)request.getAttribute("types");
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
                    <%@ include file="/WEB-INF/jsp/produits/sidebar.jsp" %>
                </div>
    
                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <div class="form-container">
                        <h3 class="text-center mb-4">Ajouter un produit</h3>
    
                        <form action="/produits/nouveau" method="post">
                            <div class="mb-3">
                                <label for="nom" class="form-label">Nom du produit</label>
                                <input type="text" class="form-control" id="nom" name="nom" required>
                            </div>
                            <div class="mb-3">
                                <label for="type" class="form-label">Type de produit</label>
                                <select class="form-select" id="type" name="type.id" required>
                                    <option value="" disabled selected>Choisir le type</option>
                                    <% for (TypeProduit type : typesProduits) { %>
                                        <option value="<%= type.getId() %>"><%= type.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="descriptions" class="form-label">Déscription</label>
                                <textarea class="form-control" id="descriptions" name="descriptions" rows="4"></textarea>
                            </div>
                            <div class="mb-3">
                                <label for="prix" class="form-label">Prix de vente (en Ariary)</label>
                                <input type="number" class="form-control" id="prix" name="prix" step="0.1" required>
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
