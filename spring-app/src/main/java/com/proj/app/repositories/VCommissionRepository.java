package com.proj.app.repositories;

import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class VCommissionRepository {

    @Autowired
    private NamedParameterJdbcTemplate namedParameterJdbcTemplate;

    public List<Map<String, Object>> getVentesAvecCommission(LocalDate dateMin, LocalDate dateMax) {
        // Construction de la requête SQL avec des filtres sur les dates
        String sql = "SELECT * FROM v_commissions WHERE 1=1";  // 1=1 permet d'ajouter facilement des conditions dynamiques

        MapSqlParameterSource params = new MapSqlParameterSource();
        
        // Ajouter le filtre pour dateMin si spécifié
        if (dateMin != null) {
            sql += " AND date_vente >= :dateMin"; // Remplacer 'date_vente' par le nom réel de la colonne dans votre base
            params.addValue("dateMin", dateMin);
        }
        
        // Ajouter le filtre pour dateMax si spécifié
        if (dateMax != null) {
            sql += " AND date_vente <= :dateMax"; // Remplacer 'date_column' par le nom réel de la colonne dans votre base
            params.addValue("dateMax", dateMax);
        }

        // Exécuter la requête avec les paramètres
        return namedParameterJdbcTemplate.queryForList(sql, params);
    }


    public List<Map<String, Object>> getCommissionsParGenre(LocalDate date1, LocalDate date2) {
        String sql = "SELECT g.id_genre, g.nom_genre, sum(v.commission) as commission_totale FROM v_commissions v"
        +" join clients c on v.nom_client=c.nom_client join genres g"
        +" on c.id_genre=g.id_genre where 1=1";
        
        MapSqlParameterSource params = new MapSqlParameterSource();

        if(date1 != null) {
            sql += " AND v.date_vente >= :dateMin";
            params.addValue("dateMin", date1);
        }
        if (date2 != null) {
            sql += " AND date_vente <= :dateMax"; // Remplacer 'date_column' par le nom réel de la colonne dans votre base
            params.addValue("dateMax", date2);
        }
        sql += " GROUP BY g.id_genre";

        return namedParameterJdbcTemplate.queryForList(sql, params);
    }
}
