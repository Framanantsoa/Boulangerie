-- Insertion automatique dans stock_ingredients
CREATE OR REPLACE FUNCTION trigger_insert_stock_ingredient()
RETURNS TRIGGER AS $$
BEGIN
    -- Insérer une ligne dans stock_ingredients avec une quantité initiale de 0
    INSERT INTO stock_ingredients (quantite, id_ingredient)
    VALUES (0, NEW.id_ingredient);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Création du trigger
CREATE TRIGGER after_insert_ingredient
AFTER INSERT ON ingredients
FOR EACH ROW
EXECUTE FUNCTION trigger_insert_stock_ingredient();


-- Insertion automatique dans stock_produits
CREATE OR REPLACE FUNCTION trigger_insert_stock_produit()
RETURNS TRIGGER AS $$
BEGIN
    -- Insérer une ligne dans stock_produits avec une quantité initiale de 0
    INSERT INTO stock_produits (quantite, id_produit)
    VALUES (0, NEW.id_produit);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;
-- Création du trigger
CREATE TRIGGER after_insert_produit
AFTER INSERT ON produits
FOR EACH ROW
EXECUTE FUNCTION trigger_insert_stock_produit();



-- VIEWS
CREATE OR REPLACE VIEW v_commissions AS
select 
   v.id_vente_prod, 
   v.date_vente, 
   cs.nom_client, 
   ps.nom_produit, 
   pp.prix_prod, 
   v.quantite_vendue, 
   (pp.prix_prod*c.valeur)*v.quantite_vendue as commission 
from ventes_produits v 
JOIN commissions c on v.id_commission=c.id_commission 
JOIN prix_produits pp on v.id_prix_prod=pp.id_prix_prod 
JOIN clients cs on v.id_client=cs.id_client 
JOIN produits ps on pp.id_produit=ps.id_produit;

