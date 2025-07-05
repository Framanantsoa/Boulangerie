<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<% 
    List<PrixIngredient> prixIngredients = (List<PrixIngredient>)request.getAttribute("prixIngredients");
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
                        <h3 class="text-center mb-4">Acheter un ingrédient</h3>
    
                        <form action="/ingredients/acheter" method="post">
                            <div class="mb-3">
                                <label for="prixIngredient" class="form-label">Nom de l'ingrédient</label>
                                <select class="form-select" id="prixIngredient" name="prixIngredient.id" required>
                                    <option value="" disabled selected>Choisir une option</option>
                                    <% for(PrixIngredient pI : prixIngredients) { %>
                                        <option value="<%= pI.getId() %>">
                                            <%= pI.getIngredient().getNom() %> (en <%= pI.getIngredient().getUnite().getNom() %>) (<%= pI.getPrix() %> Ar)
                                        </option>
                                    <% } %>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="quantite" class="form-label">Quantité</label>
                                <input type="number" class="form-control" id="quantite" name="quantite" step="0.1" required>
                            </div>

                            <div class="mb-3">
                                <label for="dateAchat" class="form-label">Date d'achat</label>
                                <input type="date" class="form-control" id="dateAchat" name="dateAchat"required>
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
