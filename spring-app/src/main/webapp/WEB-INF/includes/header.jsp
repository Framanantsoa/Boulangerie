<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<header>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <!-- Lien vers la page d'accueil -->
            <a class="navbar-brand" href="/" href="/">
                <img src="/images/logo.png" alt="Logo" width="60"
                 class="d-inline-block align-text-center">
                BOULAN<strong style="color: burlywood;">GERIE</strong>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                <!-- Accueil -->
                    <li class="nav-item">
                        <a class="nav-link" href="/">Accueil</a>
                    </li>
                    
                <!-- Ingrédients -->
                    <li class="nav-item">
                        <a class="nav-link" href="/ingredients/liste">Ingrédients</a>
                    </li>
    
                <!-- Produits -->
                     <li class="nav-item">
                        <a class="nav-link" href="/produits/liste">Produits</a>
                    </li>
                
                <!-- Recettes -->
                    <li class="nav-item">
                        <a class="nav-link" href="/recettes/liste">Recettes</a>
                    </li>
    
                <!-- Productions -->
                    <li class="nav-item">
                        <a class="nav-link" href="/productions/liste">Productions</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
</header>
