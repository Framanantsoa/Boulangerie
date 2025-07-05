-- PRODUCTION ET GESTION DE STOCK 
-- INGREDIENTS
SELECT si.* FROM productions p
    JOIN recettes r on p.id_recette=r.id_recette
    JOIN details_recettes d on r.id_recette=d.id_recette
    JOIN stock_ingredients si on d.id_ingredient=si.id_ingredient
WHERE p.id_production = 1;

-- PRODUITS
SELECT sp.* FROM productions p
    JOIN recettes r on p.id_recette=r.id_recette
    JOIN produits pt on r.id_produit=pt.id_produit
    JOIN stock_produits sp on pt.id_produit=sp.id_produit
WHERE p.id_production = 1;


-- LISTE DES ACHATS
SELECT a.* FROM achats_ingredients a 
    JOIN prix_ingredients pi on a.id_prix_ingred=pi.id_prix_ingred 
    JOIN ingredients i on pi.id_ingredient=i.id_ingredient 
WHERE i.id_ingredient=1;


-- LISTE DES VENTES AVEC FILTRE
SELECT distinct vp.* FROM ventes_produits vp
    JOIN prix_produits pp on vp.id_prix_prod=pp.id_prix_prod
    JOIN produits p on pp.id_produit=p.id_produit
    JOIN types_produits tp on p.id_type_prod=tp.id_type_prod
    JOIN recettes r on p.id_produit=r.id_produit
    JOIN details_recettes dr on r.id_recette=dr.id_recette
    JOIN ingredients i on d.id_ingredient=i.id_ingredient
    JOIN types_ingredients ti on i.id_type_ingred=ti.id_type_ingred
WHERE ti.id_type_prod=2
AND tp.id_type_ingred=2
ORDER BY vp.date_vente DESC;
