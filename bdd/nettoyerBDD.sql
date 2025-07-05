DO $$ 
DECLARE 
    seq RECORD;
BEGIN
-- Désactiver les contraintes de clé étrangère
    EXECUTE 'SET session_replication_role = replica';
    
-- Vider toutes les tables
    EXECUTE (
        SELECT string_agg('TRUNCATE TABLE ' || quote_ident(schemaname) || '.' || quote_ident(tablename) || ' CASCADE;', ' ')
        FROM pg_tables
        WHERE schemaname NOT IN ('pg_catalog', 'information_schema')
    );
    
-- Réactiver les contraintes de clé étrangère
    EXECUTE 'SET session_replication_role = DEFAULT';
    
-- Réinitialiser toutes les séquences
    FOR seq IN 
        SELECT c.oid::regclass::text AS seqname
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relkind = 'S'
    LOOP
        EXECUTE format('ALTER SEQUENCE %s RESTART WITH 1;', seq.seqname);
    END LOOP;
END $$;
