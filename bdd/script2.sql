CREATE TABLE unites(
   id_unite SERIAL,
   nom_unite VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_unite)
);

CREATE TABLE clients(
   id_client SERIAL,
   nom_client VARCHAR(70)  NOT NULL,
   PRIMARY KEY(id_client)
);
ALTER TABLE clients ADD COLUMN id_genre INT;
-- Ajouter une contrainte FOREIGN KEY pour la colonne id_commission
ALTER TABLE clients ADD CONSTRAINT fk_genre
 FOREIGN KEY (id_client) REFERENCES clients(id_client);

CREATE TABLE types_ingredients(
   id_type_ingred SERIAL,
   nom_type_ingred VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_type_ingred)
);

CREATE TABLE ingredients(
   id_ingredient SERIAL,
   nom_ingredient VARCHAR(60)  NOT NULL,
   descriptions TEXT,
   id_type_ingred INTEGER NOT NULL,
   id_unite INTEGER NOT NULL,
   PRIMARY KEY(id_ingredient),
   FOREIGN KEY(id_type_ingred) REFERENCES types_ingredients(id_type_ingred),
   FOREIGN KEY(id_unite) REFERENCES unites(id_unite)
);

CREATE TABLE types_produits(
   id_type_prod SERIAL,
   nom_type_prod VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_type_prod)
);

CREATE TABLE produits(
   id_produit SERIAL,
   nom_produit VARCHAR(50)  NOT NULL,
   descriptions TEXT,
   estConseille BOOLEAN NOT NULL DEFAULT FALSE,
   id_type_prod INTEGER NOT NULL,
   PRIMARY KEY(id_produit),
   FOREIGN KEY(id_type_prod) REFERENCES types_produits(id_type_prod)
);

CREATE TABLE produits_conseilles(
   id_produit_cons SERIAL,
   date_ajout DATE NOT NULL,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_produit_cons),
   FOREIGN KEY(id_produit) REFERENCES produits(id_produit)
);

CREATE TABLE prix_produits(
   id_prix_prod SERIAL,
   date_modif DATE NOT NULL,
   prix_prod NUMERIC(18,2)   NOT NULL,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_prix_prod),
   FOREIGN KEY(id_produit) REFERENCES produits(id_produit)
);

CREATE TABLE recettes(
   id_recette SERIAL,
   nom_recette VARCHAR(50)  NOT NULL,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_recette),
   FOREIGN KEY(id_produit) REFERENCES produits(id_produit)
);

CREATE TABLE genres(
   id_genre SERIAL,
   nom_genre VARCHAR(50)  NOT NULL,
   PRIMARY KEY(id_genre)
);

CREATE TABLE commissions(
   id_commission SERIAL,
   valeur NUMERIC(15,2)   NOT NULL,
   PRIMARY KEY(id_commission)
);

CREATE TABLE ventes_produits(
   id_vente_prod SERIAL,
   date_vente TIMESTAMP NOT NULL,
   quantite_vendue NUMERIC(15,2)   NOT NULL,
   id_prix_prod INTEGER NOT NULL,
   PRIMARY KEY(id_vente_prod),
   FOREIGN KEY(id_prix_prod) REFERENCES prix_produits(id_prix_prod)
);
ALTER TABLE ventes_produits
 ALTER COLUMN date_vente TYPE DATE USING date_vente::DATE;
-- Ajouter la colonne id_commission
ALTER TABLE ventes_produits ADD COLUMN id_commission INT;
-- Ajouter une contrainte FOREIGN KEY pour la colonne id_commission
ALTER TABLE ventes_produits ADD CONSTRAINT fk_commission
 FOREIGN KEY (id_commission) REFERENCES commissions(id_commission);
-- Ajouter la colonne id_client
ALTER TABLE ventes_produits ADD COLUMN id_client INT;
-- Ajouter une contrainte FOREIGN KEY pour la colonne id_client
ALTER TABLE ventes_produits ADD CONSTRAINT fk_client
 FOREIGN KEY (id_client) REFERENCES clients(id_client);

CREATE TABLE stock_produits(
   id_stock_prod SERIAL,
   quantite NUMERIC(15,2)   NOT NULL,
   id_produit INTEGER NOT NULL,
   PRIMARY KEY(id_stock_prod),
   UNIQUE(id_produit),
   FOREIGN KEY(id_produit) REFERENCES produits(id_produit)
);

CREATE TABLE productions(
   id_production SERIAL,
   date_production TIMESTAMP,
   id_recette INTEGER,
   PRIMARY KEY(id_production),
   FOREIGN KEY(id_recette) REFERENCES recettes(id_recette)
);

CREATE TABLE details_recettes(
   id_detail_recette SERIAL,
   quantite NUMERIC(15,2)   NOT NULL,
   id_ingredient INTEGER NOT NULL,
   id_recette INTEGER NOT NULL,
   PRIMARY KEY(id_detail_recette),
   FOREIGN KEY(id_ingredient) REFERENCES ingredients(id_ingredient),
   FOREIGN KEY(id_recette) REFERENCES recettes(id_recette)
);

CREATE TABLE stock_ingredients(
   id_stock_ingredient SERIAL,
   quantite NUMERIC(15,2)   NOT NULL,
   id_ingredient INTEGER NOT NULL,
   PRIMARY KEY(id_stock_ingredient),
   UNIQUE(id_ingredient),
   FOREIGN KEY(id_ingredient) REFERENCES ingredients(id_ingredient)
);

CREATE TABLE prix_ingredients(
   id_prix_ingred SERIAL,
   date_modif DATE NOT NULL,
   prix_ingred NUMERIC(18,2)   NOT NULL,
   id_ingredient INTEGER NOT NULL,
   PRIMARY KEY(id_prix_ingred),
   FOREIGN KEY(id_ingredient) REFERENCES ingredients(id_ingredient)
);

CREATE TABLE achats_ingredients(
   id_achat_ingred SERIAL,
   date_achat DATE NOT NULL,
   quantite_ingred NUMERIC(17,2)   NOT NULL,
   id_prix_ingred INTEGER NOT NULL,
   PRIMARY KEY(id_achat_ingred),
   FOREIGN KEY(id_prix_ingred) REFERENCES prix_ingredients(id_prix_ingred)
);

