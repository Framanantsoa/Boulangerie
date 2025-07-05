-- UNITES
INSERT INTO unites (nom_unite) VALUES
('g'),
('mL'),
('gousse(s)'),
('pièce(s)');

-- TYPES D'INGREDIENTS
INSERT INTO types_ingredients (nom_type_ingred) VALUES
('Nature'),
('Parfum');

-- GENRES
INSERT INTO genres (nom_genre) VALUES
('Homme'),
('Femme');

-- INGREDIENTS
INSERT INTO ingredients (nom_ingredient, descriptions, id_type_ingred, id_unite) VALUES
-- Ingrédients Nature
('Farine', 'Ingrédient de base pour la préparation de pâtes et de pains', 1, 1),
('Farine de blé', 'Ingrédient principal pour la préparation de pains, brioches, et viennoiseries', 1, 1),
('Farine de blé complète', 'Farine provenant du blé entier, utilisée pour les pains complets', 1, 1),
('Farine de seigle', 'Farine issue du seigle, utilisée pour les pains de campagne', 1, 1),
('Beurre', 'Ingrédient gras qui apporte du moelleux aux pâtes', 1, 1),
('Beurre fondu', 'Beurre fondu utilisé dans certaines recettes comme les pâtisseries', 1, 1),
('Levure de boulanger', 'Ingrédient permettant la fermentation et le levage des pâtes', 1, 1),
('Levure chimique', 'Levure utilisée dans les préparations qui ne nécessitent pas de levée', 1, 1),
('Sucre', 'Ingrédient sucré utilisé pour adoucir les recettes', 1, 1),
('Sucre glace', 'Sucre finement moulu, utilisé principalement pour les glaçages', 1, 1),
('Sucre en poudre', 'Sucre cristallisé utilisé dans diverses recettes de pâtisserie', 1, 1),
('Sel', 'Épice indispensable pour rehausser les saveurs', 1, 1),
('Lait', 'Liquide laitier utilisé pour hydrater la pâte', 1, 2),
('Crème liquide', 'Crème utilisée pour donner du moelleux aux préparations', 1, 2),
('Œufs', 'Ingrédient pour lier et apporter du moelleux à la pâte', 1, 4),
('Blancs d''œufs', 'Partie de l''œuf utilisée dans la préparation de certaines pâtisseries', 1, 4),
('Eau', 'Liquide essentiel à la préparation de la pâte', 1, 2),
('Eau froide', 'Eau utilisée dans des préparations nécessitant une température froide', 1, 2),
('Levain', 'Culture de levure naturelle pour faire lever la pâte', 1, 1),
('Chocolat', 'Ingrédient sucré utilisé pour ajouter de la saveur au pain', 1, 1),
('Chocolat noir', 'Chocolat avec une teneur élevée en cacao, utilisé pour les pâtisseries', 1, 1),
('Raisins secs', 'Fruits séchés utilisés pour garnir les produits', 1, 1),
('Lardons', 'Petits morceaux de lard utilisés dans les recettes salées', 1, 1),
('Fromage râpé', 'Fromage râpé utilisé pour ajouter de la saveur', 1, 1),
('Mozzarella', 'Fromage italien utilisé pour la pizza', 1, 1),
('Poivre', 'Épice utilisée pour ajouter du piquant aux recettes', 1, 1),
-- Ingrédients Parfum
('Banane', 'Fruit tropical doux utilisé pour diverses préparations', 2, 4),
('Oranges', 'Fruits utilisés principalement pour le jus', 2, 2),
('Pommes', 'Fruit sucré et juteux utilisé pour garnir les produits', 2, 1),
('Fruits rouges', 'Mélange de fruits comme les fraises, framboises et myrtilles', 2, 1),
('Cannelle', 'Épice parfumée pour ajouter de la saveur', 2, 1),
('Vanille', 'Ingrédient parfumé pour ajouter une note sucrée', 2, 1),
('Miel', 'Substance sucrée produite par les abeilles', 2, 2),
('Ail', 'Ingrédient pour ajouter du goût et de la saveur', 2, 3),
('Café', 'Ingrédient utilisé pour parfumer et ajouter de la saveur', 2, 1),
('Huile d''olive', 'Huile végétale utilisée pour la cuisson et la préparation', 2, 2),
('Graines de sésame', 'Graines utilisées pour ajouter du croquant et du goût', 2, 1),
('Graines de tournesol', 'Graines utilisées pour ajouter du croquant et du goût', 2, 1),
('Graines de lin', 'Graines utilisées pour ajouter du croquant et du goût', 2, 1);


INSERT INTO types_produits (nom_type_prod) VALUES 
('Viennoiseries'),
('Pains'),
('Pâtisseries'),
('Snacking et Sandwichs'),
('Boissons et Compléments');

-- PRODUITS
INSERT INTO produits (nom_produit, descriptions, estConseille, id_type_prod) VALUES
-- Viennoiseries (1)
('Croissant', 'Viennoiserie au beurre, légère et feuilletée', DEFAULT, 1),
('Pain au chocolat', 'Viennoiserie avec une garniture chocolatée', DEFAULT, 1),
('Chausson aux pommes', 'Viennoiserie avec une compote de pommes', DEFAULT, 1),
('Brioche', 'Viennoiserie moelleuse et légèrement sucrée', DEFAULT, 1),
('Pain aux raisins', 'Viennoiserie avec des raisins secs', DEFAULT, 1),
-- Pains (2)
('Baguette tradition', 'Pain classique avec une croûte dorée', DEFAULT, 2),
('Pain complet', 'Pain riche en fibres et en goût', DEFAULT, 2),
('Pain de campagne', 'Pain rustique au goût prononcé', DEFAULT, 2),
('Pain aux céréales', 'Pain garni de graines et de céréales', DEFAULT, 2),
('Pain au levain', 'Pain avec une saveur légèrement acidulée', DEFAULT, 2),
-- Pâtisseries (3)
('Éclair au chocolat', 'Pâtisserie garnie de crème au chocolat', DEFAULT, 3),
('Tarte aux pommes', 'Dessert composé de pâte et de pommes', DEFAULT, 3),
('Mille-feuille', 'Dessert feuilleté garni de crème pâtissière', DEFAULT, 3),
('Macaron', 'Petite pâtisserie à base d`amandes', DEFAULT, 3),
('Opéra', 'Pâtisserie au chocolat et au café', DEFAULT, 3),
-- Snacking et Sandwichs (4)
('Quiche lorraine', 'Pâte brisée garnie de crème et de lardons', DEFAULT, 4),
('Pizza margherita', 'Pâte à pizza avec tomates et mozzarella', DEFAULT, 4),
-- Boissons et Compléments (5)
('Jus d`orange', 'Boisson fraîche et naturelle', DEFAULT, 5),
('Chocolat chaud', 'Boisson chaude à base de cacao', DEFAULT, 5),
('Smoothie aux fruits rouges', 'Boisson fraîche et vitaminée', DEFAULT, 5);


-- Les recettes
INSERT INTO recettes (id_produit, nom_recette) VALUES
(1, 'Recette classique pour croissants feuilletés'),
(2, 'Recette traditionnelle pour pain au chocolat'),
(3, 'Recette savoureuse pour chausson aux pommes'),
(4, 'Recette moelleuse pour brioche'),
(5, 'Recette équilibrée pour pain aux raisins'),
(6, 'Recette artisanale pour baguette tradition'),
(7, 'Recette saine pour pain complet'),
(8, 'Recette rustique pour pain de campagne'),
(9, 'Recette nutritive pour pain aux céréales'),
(10, 'Recette artisanale pour pain au levain'),
(11, 'Recette gourmande pour éclair au chocolat'),
(12, 'Recette fruitée pour tarte aux pommes'),
(13, 'Recette raffinée pour mille-feuille'),
(14, 'Recette délicate pour macaron'),
(15, 'Recette sophistiquée pour opéra'),
(16, 'Recette savoureuse pour quiche lorraine'),
(17, 'Recette italienne pour pizza margherita'),
(18, 'Recette rafraîchissante pour jus d`orange'),
(19, 'Recette réconfortante pour chocolat chaud'),
(20, 'Recette vitaminée pour smoothie aux fruits rouges');


-- Insertion des prix en Ariary (MGA) en fonction des unités
INSERT INTO prix_ingredients (date_modif, prix_ingred, id_ingredient) VALUES
-- Ingrédients Nature
('2025-01-11', 4, 1),   -- Farine (g)
('2025-01-11', 5, 2),   -- Farine de blé (g)
('2025-01-11', 5, 3),   -- Farine de blé complète (g)
('2025-01-11', 6, 4),   -- Farine de seigle (g)
('2025-01-11', 4.2, 5), -- Beurre (g)
('2025-01-11', 4.4, 6), -- Beurre fondu (g)
('2025-01-11', 6, 7),   -- Levure de boulanger (g)
('2025-01-11', 5.6, 8), -- Levure chimique (g)
('2025-01-11', 5.0, 9), -- Sucre (g)
('2025-01-11', 5.7, 10), -- Sucre glace (g)
('2025-01-11', 5.2, 11), -- Sucre en poudre (g)
('2025-01-11', 2.5, 12), -- Sel (g)
('2025-01-11', 6.2, 13), -- Lait (mL)
('2025-01-11', 10, 14),   -- Crème liquide (mL)
('2025-01-11', 800, 15), -- Œufs (pièce)
('2025-01-11', 500, 16), -- Blancs d'œufs (pièce)
('2025-01-11', 1.5, 17), -- Eau (mL)
('2025-01-11', 1.9, 18), -- Eau froide (mL)
('2025-01-11', 8, 19),   -- Levain (g)
('2025-01-11', 15, 20),  -- Chocolat (g)
('2025-01-11', 14.5, 21),-- Chocolat noir (g)
('2025-01-11', 10, 22),  -- Raisins secs (g)
('2025-01-11', 10.2, 23),-- Lardons (g)
('2025-01-11', 5.5, 24), -- Fromage râpé (g)
('2025-01-11', 8.0, 25), -- Mozzarella (g)
('2025-01-11', 4, 26),   -- Poivre (g)
-- Ingrédients Parfum
('2025-01-11', 300, 27), -- Banane (pièce)
('2025-01-11', 750, 28), -- Pommes (pièce)
('2025-01-11', 500, 29), -- Oranges (pièce)
('2025-01-11', 8.5, 30),   -- Fruits rouges (g)
('2025-01-11', 11.8, 31),-- Cannelle (g)
('2025-01-11', 15.9, 32),-- Vanille (g)
('2025-01-11', 8.0, 33), -- Miel (mL)
('2025-01-11', 7.6, 34),  -- Ail (gousse)
('2025-01-11', 8.2, 35), -- Café (g)
('2025-01-11', 13.5, 36),-- Huile d'olive (mL)
('2025-01-11', 6.5, 37),-- Graines de sésame (g)
('2025-01-11', 12.5, 38),-- Graines de tournesol (g)
('2025-01-11', 10.8, 39);-- Graines de lin (g)


-- Prix des produits
INSERT INTO prix_produits (date_modif, prix_prod, id_produit) VALUES
-- Viennoiseries
(current_date, 1200, 1),  -- Croissant
(current_date, 1500, 2),  -- Pain au chocolat
(current_date, 1700, 3),  -- Chausson aux pommes
(current_date, 2000, 4),  -- Brioche
(current_date, 1800, 5),  -- Pain aux raisins
-- Pains
(current_date, 1000, 6),  -- Baguette tradition
(current_date, 1500, 7),  -- Pain complet
(current_date, 2000, 8),  -- Pain de campagne
(current_date, 2500, 9),  -- Pain aux céréales
(current_date, 2300, 10), -- Pain au levain
-- Pâtisseries
(current_date, 2800, 11), -- Éclair au chocolat
(current_date, 3200, 12), -- Tarte aux pommes
(current_date, 3500, 13), -- Mille-feuille
(current_date, 1500, 14), -- Macaron
(current_date, 4000, 15), -- Opéra
-- Snacking et Sandwichs
(current_date, 5800, 16), -- Quiche lorraine
(current_date, 18000, 17), -- Pizza margherita
-- Boissons et Compléments
(current_date, 2000, 18), -- Jus d'orange
(current_date, 2500, 19), -- Chocolat chaud
(current_date, 3000, 20); -- Smoothie aux fruits rouges


-- Détails des recettes
INSERT INTO details_recettes (quantite, id_ingredient, id_recette) VALUES
    -- Recette classique pour croissants feuilletés
(400, 1, 1), -- Farine
(150, 5, 1), -- Beurre
(10, 7, 1),  -- Levure de boulanger
(50, 9, 1),  -- Sucre
(10, 12, 1), -- Sel
(250, 13, 1), -- Lait
(50, 17, 1), -- Eau
(1, 15, 1),  -- Œufs
    -- Recette traditionnelle pour pain au chocolat
(400, 1, 2), -- Farine
(150, 5, 2), -- Beurre
(20, 7, 2),  -- Levure de boulanger
(50, 9, 2),  -- Sucre
(10, 12, 2), -- Sel
(250, 13, 2), -- Lait
(50, 17, 2), -- Eau
(1, 15, 2),  -- Œufs
(200, 20, 2), -- Chocolat
    -- Recette savoureuse pour chausson aux pommes
(250, 1, 3), -- Farine
(125, 5, 3), -- Beurre
(70, 9, 3),  -- Sucre
(5, 12, 3),  -- Sel
(10, 8, 3),  -- Levure chimique
(1, 15, 3),  -- Œufs
(80, 29, 3), -- Pommes
(6, 31, 3), -- Cannelle
    -- Recette moelleuse pour brioche
(400, 1, 4), -- Farine
(150, 5, 4), -- Beurre
(100, 9, 4), -- Sucre
(20, 7, 4),  -- Levure de boulanger
(10, 12, 4), -- Sel
(250, 13, 4), -- Lait
(2, 15, 4),  -- Œufs
(50, 17, 4), -- Eau
(10, 32, 4),  -- Vanille
    -- Recette équilibrée pour pain aux raisins
(400, 1, 5), -- Farine
(150, 5, 5), -- Beurre
(20, 7, 5),  -- Levure de boulanger
(50, 9, 5),  -- Sucre
(8, 12, 5), -- Sel
(250, 13, 5), -- Lait
(50, 17, 5), -- Eau
(2, 15, 5),  -- Œufs
(200, 22, 5), -- Raisins secs
    -- Recette artisanale pour baguette tradition
(500, 2, 6), -- Farine de blé
(300, 17, 6), -- Eau
(10, 7, 6),  -- Levure de boulanger
(7, 12, 6), -- Sel
(5, 9, 6),   -- Sucre
    -- Recette saine pour pain complet
(500, 3, 7), -- Farine de blé complète
(300, 17, 7), -- Eau
(20, 7, 7),   -- Levure de boulanger
(10, 12, 7),  -- Sel
(10, 9, 7),   -- Sucre
    -- Recette rustique pour pain de campagne
(500, 2, 8), -- Farine de blé
(350, 17, 8), -- Eau
(15, 7, 8),  -- Levure de boulanger
(10, 12, 8), -- Sel
(10, 9, 8),  -- Sucre
(100, 4, 8), -- Farine de seigle
    -- Recette nutritive pour pain aux céréales
(400, 2, 9), -- Farine de blé
(110, 4, 9), -- Farine de seigle
(250, 17, 9), -- Eau
(20, 7, 9),  -- Levure de boulanger
(10, 12, 9), -- Sel
(60, 37, 9), -- Graines de sésame
(20, 38, 9), -- Graines de tournesol
(20, 39, 9), -- Graines de lin
(10, 9, 9),  -- Sucre
    -- Recette artisanale pour pain au levain
(500, 2, 10), -- Farine de blé
(300, 17, 10), -- Eau
(100, 19, 10), -- Levain
(10, 12, 10), -- Sel
(5, 9, 10),   -- Sucre
    -- Recette gourmande pour éclair au chocolat
(100, 1, 11), -- Farine
(80, 5, 11),  -- Beurre
(250, 17, 11), -- Eau
(8, 15, 11),  -- Œufs
(4, 12, 11),  -- Sel (1 pincée)
(500, 13, 11), -- Lait
(110, 9, 11),  -- Sucre (crème)
(40, 1, 11),  -- Farine (crème)
(100, 21, 11), -- Chocolat noir
    -- Recette fruitée pour tarte aux pommes
(250, 1, 12), -- Farine
(125, 5, 12), -- Beurre
(120, 9, 12),  -- Sucre
(3, 12, 12),  -- Sel
(50, 18, 12), -- Eau froide
(150, 29, 12), -- Pommes
(5, 31, 12),  -- Cannelle
(20, 5, 12),   -- Beurre (pour les pommes)
    -- Recette raffinée pour mille-feuille
(250, 1, 13), -- Farine
(250, 5, 13), -- Beurre
(125, 17, 13), -- Eau
(4, 12, 13),  -- Sel
(500, 13, 13), -- Lait
(220, 9, 13),  -- Sucre
(4, 15, 13),   -- Œufs
(40, 1, 13),   -- Farine (pour la crème)
(8, 32, 13),   -- Vanille
    -- Recette délicate pour macaron
(125, 10, 14),  -- Sucre glace
(100, 16, 14), -- Blancs d'œufs
(50, 11, 14),   -- Sucre en poudre
(150, 14, 14), -- Crème liquide
(150, 21, 14), -- Chocolat noir
(50, 5, 14),   -- Beurre
    -- Recette sophistiquée pour opéra
(6, 15, 15),   -- Œufs (pour la génoise)
(150, 9, 15),  -- Sucre
(100, 1, 15),  -- Farine (pour la génoise)
(50, 6, 15),   -- Beurre fondu (pour la génoise)
(200, 5, 15),  -- Beurre (pour la crème au beurre)
(100, 10, 15),  -- Sucre glace (pour la crème au beurre)
(200, 21, 15), -- Chocolat noir (pour la ganache)
(200, 14, 15), -- Crème liquide (pour la ganache)
(100, 35, 15), -- Café
    -- Recette savoureuse pour quiche lorraine
(250, 1, 16),  -- Farine
(125, 5, 16),  -- Beurre
(50, 9, 16),   -- Sucre
(7, 12, 16),   -- Sel
(50, 18, 16),  -- Eau froide
(150, 23, 16), -- Lardons
(3, 15, 16),   -- Œufs
(100, 13, 16), -- Lait
(50, 24, 16),  -- Fromage râpé
(4, 26, 16),   -- Poivre
    -- Recette italienne pour pizza margherita
(250, 2, 17), -- Farine de blé
(150, 17, 17), -- Eau
(10, 7, 17),  -- Levure de boulanger
(5, 12, 17),  -- Sel
(20, 36, 17), -- Huile d'olive
(2, 34, 17),  -- Ail
(5, 26, 17),  -- Poivre
(150, 25, 17), -- Mozzarella
    -- Recette rafraîchissante pour jus d'orange
(500, 28, 18), -- Oranges
(30, 9, 18),   -- Sucre
(100, 17, 18), -- Eau
    -- Recette réconfortante pour chocolat chaud
(250, 13, 19), -- Lait
(50, 21, 19),  -- Chocolat noir
(30, 9, 19),   -- Sucre
    -- Recette vitaminée pour smoothie aux fruits rouges
(150, 30, 20), -- Fruits rouges
(1, 27, 20),   -- Banane
(20, 33, 20);  -- Miel


INSERT INTO commissions (valeur) VALUES
(0),
(0.05);
