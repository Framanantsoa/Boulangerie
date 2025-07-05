<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Produit> produits = (List<Produit>)request.getAttribute("produits");
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
                        <h3 class="text-center mb-4">Faire un produit conseillé</h3>
    
                        <form action="/produits/conseilles/nouveau" method="post">
                            <div class="mb-3">
                                <label for="produit.id" class="form-label">Nom du produit</label>
                                <select class="form-select" id="produit.id" name="produit.id" required>
                                    <option value="" disabled selected>Choisir le produit</option>
                                    <% for (Produit produit : produits) { %>
                                        <option value="<%= produit.getId() %>"><%= produit.getNom() %></option>
                                    <% } %>
                                </select>
                            </div>
                            <div class="mb-3">
                                <label for="dateAjout" class="form-label">Date d'ajout</label>
                                <input class="form-control" id="dateAjout" name="dateAjout" value="<%= LocalDate.now() %>"
                                 type="date" required>
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
