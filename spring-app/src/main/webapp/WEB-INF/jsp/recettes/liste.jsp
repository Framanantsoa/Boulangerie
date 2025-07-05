<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Recette> recettes = (List<Recette>)request.getAttribute("recettes");
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
                    <%@ include file="/WEB-INF/jsp/recettes/sidebar.jsp" %>
                </div>
    
                <!-- Contenu -->
                <div class="col-lg-8 col-md-7">
                    <h3 class="text-center mb-4">Liste des recettes</h3>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Produit</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% 
                                if(recettes==null) { %>
                                <tr>
                                    <td colspan="5" class="text-center">Aucune recette trouvée.</td>
                                </tr> <% 
                                } 
                                else {
                                    for (Recette recette : recettes) {
                            %>
                                <tr>
                                    <td><%=recette.getId()%></td>
                                    <td><%=recette.getNom()%></td>
                                    <td><%=recette.getProduit().getNom()%></td>
                                    <td>
                                        <a href="/recettes/<%=recette.getId()%>/details" class="btn btn-info btn-sm">Voir plus</a>
                                    </td>
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
