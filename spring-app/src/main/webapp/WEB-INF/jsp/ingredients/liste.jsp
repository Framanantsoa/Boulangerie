<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List"%>
<%@ page import="com.proj.app.entities.*" %>

<%
    List<Ingredient> ingredients = (List<Ingredient>)request.getAttribute("ingredients");
    int currentPage = (int)request.getAttribute("currentPage");
    int totalPages = (int)request.getAttribute("totalPages");
    long totalItems = (long)request.getAttribute("totalItems");
    int size = (int)request.getAttribute("size");
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
                    <h3 class="text-center mb-4">Liste des ingrédients</h3>
                    <div class="table-responsive">
                        <table class="table table-bordered table-hover">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Nom</th>
                                    <th>Type d'ingrédient</th>
                                    <th>En stock</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <% if(ingredients==null) { %>
                                <tr>
                                    <td colspan="5" class="text-center">Aucun ingrédient trouvé.</td>
                                </tr> <% 
                                } 
                                else {
                                    for (Ingredient ingred : ingredients) {
                            %>
                                <tr>
                                    <td><%=ingred.getId()%></td>
                                    <td><%=ingred.getNom()%></td>
                                    <td><%=ingred.getType().getNom()%></td>
                                    <td><%=ingred.getStock().getQuantite()%> <%=ingred.getUnite().getNom()%></td>
                                    <td>
                                        <a href="/ingredients/modifier/<%= ingred.getId() %>" class="btn btn-warning btn-sm">Modifier</a>
                                        <!-- Lien pour ouvrir le modal -->
                                        <a href="#" class="btn btn-info btn-sm" data-bs-toggle="modal" data-bs-target="#ingredientModal" 
                                           data-id="<%= ingred.getId() %>"
                                           data-nom="<%= ingred.getNom() %>"
                                           data-description="<%= ingred.getDescriptions() %>">
                                           Voir détails
                                        </a>
                                    </td>
                                </tr>
                            <% 
                                    }
                                }
                            %>
                            </tbody>
                        </table>
                    </div>

                    <!-- Pagination -->
                    <div class="pagination">
                        <!-- Page précédente -->
                        <%  if(currentPage > 1) { %>
                            <a href="?page=<%=currentPage-1%>&size=<%=size%>" class="btn btn-secondary">prec.</a>
                        <% } %>

                        <!-- Affichage des pages -->
                        <span>Page <%=currentPage%> / <%=totalPages%></span>

                        <!-- Page suivante -->
                        <%  if(currentPage < totalPages) { %>
                            <a href="?page=<%=currentPage+1%>&size=<%=size%>" class="btn btn-secondary">suiv.</a>
                        <% } %>
                    </div>

                </div>
            </div>
        </div>
    </main>

    <!-- Modal -->
    <div class="modal fade" id="ingredientModal" tabindex="-1" aria-labelledby="ingredientModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="ingredientModalLabel">Détails de l'ingrédient</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <strong>Nom :</strong> <span id="ingredientNom"></span><br>
                    <strong>Description :</strong> <span id="ingredientDescription"></span><br>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/WEB-INF/includes/footer.jsp" %>

    <script>
        // Récupérer le modal et les éléments à remplir
        const ingredientModal = document.getElementById('ingredientModal');
        ingredientModal.addEventListener('show.bs.modal', function (event) {
            const button = event.relatedTarget; // Le bouton qui a déclenché l'événement
            const id = button.getAttribute('data-id');
            const nom = button.getAttribute('data-nom');
            const description = button.getAttribute('data-description');
            
            // Remplir les champs du modal avec les données de l'ingrédient
            document.getElementById('ingredientNom').textContent = nom;
            document.getElementById('ingredientDescription').textContent = description;
        });
    </script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
