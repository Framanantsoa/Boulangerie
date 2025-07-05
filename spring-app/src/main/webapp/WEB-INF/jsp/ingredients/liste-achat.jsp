<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    String idIngred = request.getParameter("idIngred");
    List<AchatIngredient> achatsIngredients = (List<AchatIngredient>)request.getAttribute("achats");
    List<Ingredient> ingredients = (List<Ingredient>)request.getAttribute("ingredients");
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
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="text-center mb-4">Liste des achats d'ingrédients</h3>
                        <!-- Lien vers l'insertion d'achat -->
                        <a href="/ingredients/achats" class="btn btn-primary">Nouvel achat</a>
                    </div>
                    
                    <!-- Formulaire de filtre -->
                    <form method="GET" action="/ingredients/liste/achats" class="mb-4">
                        <div class="row">
                            <div class="col-md-8">
                                <label for="ingredient" class="form-label">Nom d'ingrédient</label>
                                <select name="idIngred" id="idIngred" class="form-select">
                                    <% if (ingredients != null) { %>
                                        <option value="">--Tous les ingrédients--</option>
                                        <% for (Ingredient ingred : ingredients) { 
                                            boolean selected = idIngred != null && idIngred.equals(ingred.getId().toString());
                                    %>
                                        <option value="<%= ingred.getId() %>" <%= selected ? "selected" : "" %>>
                                            <%=ingred.getNom()%>
                                        </option>
                                    <% } } %>                                    
                                </select>
                                <div class="col-md-8 d-flex align-items-end">
                                    <button type="submit" class="btn btn-success w-100">Filtrer</button>
                                </div>
                            </div>
                        </div>
                    </form>
                    
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom d'ingrédient</th>
                                    <th>Quantité achetée</th>
                                    <th>Date d'achat</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if(achatsIngredients==null) { %>
                                <tr>
                                    <td colspan="5" class="text-center">Aucune achat trouvée !</td>
                                </tr> <% 
                                } 
                                else {
                                    for (AchatIngredient achatIngred : achatsIngredients) {
                            %>
                                <tr>
                                    <td><%=achatIngred.getId()%></td>
                                    <td><%=achatIngred.getPrixIngredient().getIngredient().getNom()%></td>
                                    <td><%=achatIngred.getQuantite()%> <%=achatIngred.getPrixIngredient().getIngredient().getUnite().getNom()%></td>
                                    <td><%=achatIngred.getDateAchat()%></td>
                                </tr>
                            <% 
                                    }
                                }
                            %>
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
