-- Désactivation temporaire des contraintes de FK
DO $$ 
BEGIN
    EXECUTE (
        SELECT string_agg(
            format('ALTER TABLE %I.%I DROP CONSTRAINT %I;', 
                tc.table_schema, 
                tc.table_name, 
                tc.constraint_name
            ), ' '
        )
        FROM information_schema.table_constraints tc
        WHERE tc.constraint_type = 'FOREIGN KEY'
    );
END $$;


-- Réactivation des contraintes de FK
DO $$ 
DECLARE 
    rec RECORD;
BEGIN
    FOR rec IN
        SELECT 
            tc.constraint_name,
            tc.table_schema,
            tc.table_name,
            kcu.column_name,
            ccu.table_schema AS foreign_table_schema,
            ccu.table_name AS foreign_table_name,
            ccu.column_name AS foreign_column_name
        FROM 
            information_schema.table_constraints AS tc
        JOIN 
            information_schema.key_column_usage AS kcu
        ON 
            tc.constraint_name = kcu.constraint_name
            AND tc.table_schema = kcu.table_schema
        JOIN 
            information_schema.constraint_column_usage AS ccu
        ON 
            ccu.constraint_name = tc.constraint_name
            AND ccu.table_schema = tc.table_schema
        WHERE 
            tc.constraint_type = 'FOREIGN KEY'
    LOOP
        -- Vérifier si la contrainte existe déjà
        IF NOT EXISTS (
            SELECT 1
            FROM information_schema.table_constraints
            WHERE constraint_name = rec.constraint_name
              AND table_schema = rec.table_schema
              AND table_name = rec.table_name
        ) THEN
            -- Ajouter la contrainte seulement si elle n'existe pas
            EXECUTE format('ALTER TABLE %I.%I ADD CONSTRAINT %I FOREIGN KEY (%I) REFERENCES %I.%I (%I);',
                           rec.table_schema, rec.table_name, rec.constraint_name,
                           rec.column_name, rec.foreign_table_schema, rec.foreign_table_name, rec.foreign_column_name);
        END IF;
    END LOOP;
END $$;
