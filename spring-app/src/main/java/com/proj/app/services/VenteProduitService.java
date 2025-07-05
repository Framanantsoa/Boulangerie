package com.proj.app.services;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.proj.app.entities.Client;
import com.proj.app.entities.Genre;
import com.proj.app.entities.StockProduit;
import com.proj.app.entities.VenteProduit;
import com.proj.app.repositories.ClientRepository;
import com.proj.app.repositories.StockProduitRepository;
import com.proj.app.repositories.VenteProduitRepository;


@Service
public class VenteProduitService 
{
    @Autowired
    private VenteProduitRepository venteProduitRepo;

    @Autowired
    private StockProduitRepository stockProduitRepo;

    @Autowired
    private ClientRepository clientRepo;

    @Autowired
    private GenreService genreService;


    @Transactional
    public void ajouterVente(VenteProduit vente, String nomClient, String idGenre) {
        if (vente == null || vente.getQuantite() <= 0) {
            throw new IllegalArgumentException("Les informations de la vente sont invalides.");
        }
        Long idGr = Long.parseLong(idGenre);
        Genre genre = this.genreService.getById(idGr);

        Client client = this.clientRepo.getClient(nomClient);
        if(client == null) {
            client = new Client();
            client.setNom(nomClient);
            client.setGenre(genre);
        }
        clientRepo.save(client);
        
        vente.setClient(client);
        this.venteProduitRepo.save(vente);
        Long idVente = vente.getId();

    // Vérification de stock
        StockProduit stockProduit = this.stockProduitRepo.getStockProduitApresVente(idVente);
        if (stockProduit == null) {
            throw new RuntimeException("Produit non trouvé dans le stock.");
        }

        if(stockProduit.getQuantite() >= vente.getQuantite()) {
            stockProduit.setQuantite(stockProduit.getQuantite()-vente.getQuantite());
            this.stockProduitRepo.save(stockProduit);
        }
        else {
            throw new RuntimeException("Stock pour ce produit insuffisant, faites des productions d'abord !");
        }
    }

    public List<VenteProduit> getAllVenteAvecCritere(Long idTypeProd, Long idTypeIngred) {
        return this.venteProduitRepo.findVenteProduitAvecCritere(idTypeProd, idTypeIngred);
    }


    public List<Client> getClientsEnDate(Long idProduit, String dateMin, String dateMax) {
        // Appeler le repository
        return this.clientRepo.getClientsEnDate(idProduit, dateMin, dateMax);
    }

}
