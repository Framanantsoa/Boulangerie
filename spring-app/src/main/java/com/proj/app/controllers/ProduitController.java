package com.proj.app.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import com.proj.app.entities.*;
import com.proj.app.repositories.CommissionRepository;
import com.proj.app.repositories.GenreRepository;
import com.proj.app.repositories.TypeIngredientRepository;
import com.proj.app.repositories.TypeProduitRepository;
import com.proj.app.repositories.VCommissionRepository;
import com.proj.app.services.PrixProduitService;
import com.proj.app.services.ProduitService;
import com.proj.app.services.VenteProduitService;

@Controller
@RequestMapping("/produits")
public class ProduitController 
{
    @Autowired
    private ProduitService produitService;

    @Autowired
    private PrixProduitService prixProduitService;

    @Autowired
    private VenteProduitService venteProduitService;

    @Autowired
    private TypeProduitRepository typeProduitRepo;

    @Autowired
    private TypeIngredientRepository typeIngredientRepo;

    @Autowired
    private GenreRepository genreRepo;

    @Autowired
    private CommissionRepository commissionRepository;

    @Autowired
    private VCommissionRepository commissionRepo;


    @GetMapping("/liste")
    public ModelAndView listeProduits(
        @RequestParam(defaultValue = "1") int page, 
        @RequestParam(defaultValue = "7") int size
    ) {
        ModelAndView mv = new ModelAndView("produits/liste");
        try {
            Pageable pageable = PageRequest.of(page - 1, size);
            Page<Produit> produitsPage = produitService.getPaginatedProduits(pageable);
    
            // Ajout des attributs à la requête pour être récupérés dans la JSP
            mv.addObject("produits", produitsPage.getContent());
            mv.addObject("currentPage", page);
            mv.addObject("totalPages", produitsPage.getTotalPages());
            mv.addObject("totalItems", produitsPage.getTotalElements());
            mv.addObject("size", size);
    
        } catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }       

    @GetMapping("/nouveau")
    public ModelAndView nouveauProduit() {
        ModelAndView mv = new ModelAndView();
        try {
            mv.setViewName("produits/nouveau");
            List<TypeProduit> types = this.typeProduitRepo.findAll();
            mv.addObject("types", types);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @PostMapping("/nouveau")
    public ModelAndView ajouterProduit(@ModelAttribute Produit produit,
     @RequestParam("prix") double prix) {
        ModelAndView mv = new ModelAndView("redirect:/produits/liste");
        try {
            this.produitService.ajouterProduit(produit, prix);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 400);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView afficherPageModification(@PathVariable("id")Long id) {
        ModelAndView mv = new ModelAndView("produits/modification");
        try {
            Produit produit = this.produitService.getProduitById(id);
            PrixProduit prixProd = this.prixProduitService.getDernierPrixProduit(id);

            mv.addObject("produit", produit);
            mv.addObject("prix", prixProd.getPrix());
            mv.addObject("types", this.typeProduitRepo.findAll());
        }
        catch(Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @PostMapping("/modifier/{id}")
    public ModelAndView modifierProduit(@PathVariable("id")Long id,
     @ModelAttribute Produit produit,
     @RequestParam("prix") double nouveauPrix
    ) {
        ModelAndView mv = new ModelAndView("redirect:/produits/liste");
        try {
            this.produitService.mettreAJourProduit(id, produit, nouveauPrix);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @GetMapping("/ventes")
    public ModelAndView venteProduit() {
        ModelAndView mv = new ModelAndView("produits/vente");
        try {
            List<PrixProduit> prixProduits = this.prixProduitService.getDerniersPrixProduits();
            List<Genre> genres = this.genreRepo.findAll();
            List<Commission> commissions = this.commissionRepository.findAll();

            mv.addObject("genres", genres);
            mv.addObject("commissions", commissions);
            mv.addObject("prixProduits", prixProduits);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @PostMapping("/vendre")
    public ModelAndView ajouterVenteProduit(
        @ModelAttribute VenteProduit vente,
        @RequestParam("nomClient") String client,
        @RequestParam("genre") String genre
    ) {
        ModelAndView mv = new ModelAndView("redirect:/produits/liste/ventes");
        try {
            this.venteProduitService.ajouterVente(vente, client, genre);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 400);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @GetMapping("/liste/ventes")
    public ModelAndView listeVentesProduits(
        @RequestParam(required = false) Long idTypeProd,
        @RequestParam(required = false) Long idTypeIngred
    ) {
        ModelAndView mv = new ModelAndView("produits/liste-vente");
        try {
            List<TypeProduit> typesProduits = this.typeProduitRepo.findAll();
            List<TypeIngredient> typesIngredients = this.typeIngredientRepo.findAll();
            List<VenteProduit> ventes = this.venteProduitService.getAllVenteAvecCritere(
                idTypeProd, idTypeIngred
            );
            
            mv.addObject("typesIngredients", typesIngredients);
            mv.addObject("typesProduits", typesProduits);
            mv.addObject("ventes", ventes);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }


    @GetMapping("/conseilles/nouveau")
    public ModelAndView formulaireProduitConseille() {
        ModelAndView mv = new ModelAndView("produits/form-conseille");
        try {
            List<Produit> produits = this.produitService.getAll();
            mv.addObject("produits", produits);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @PostMapping("/conseilles/nouveau")
    public ModelAndView modifierProduit(
        @ModelAttribute ProduitConseille produitConseille
    ) {
        ModelAndView mv = new ModelAndView("redirect:/produits/conseilles");
        try {
            this.produitService.ajouterProduitConseille(produitConseille);
        }
        catch(Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }


    @GetMapping("/conseilles")
    public ModelAndView getProduitsConseille(
        @RequestParam(required = false) String annee,
        @RequestParam(required = false) String mois
    ) {
        ModelAndView mv = new ModelAndView("produits/liste-conseille");
        try {
            // Initialiser les variables avec des valeurs par défaut
            Integer anneeInt = null;
            Integer moisInt = null;

            // Vérifier et convertir l'année
            if (annee != null && !annee.isEmpty()) {
                try {
                    anneeInt = Integer.parseInt(annee);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("L'année fournie est invalide.");
                }
            }

            // Vérifier et convertir le mois
            if (mois != null && !mois.isEmpty()) {
                try {
                    moisInt = Integer.parseInt(mois);
                } catch (NumberFormatException e) {
                    throw new IllegalArgumentException("Le mois fourni est invalide.");
                }
            }

            List<Produit> produitsConseilles = this.produitService.getProduitsConseilles(anneeInt, moisInt);
            mv.addObject("produits", produitsConseilles);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur lors de la récupération des produits conseillés : " + e.getMessage());
        }
        return mv;
    }


    @GetMapping("/clients")
    public ModelAndView getClientsEnDate(
        @RequestParam(required = false) Long idProduit,
        @RequestParam(required = false) String dateMin,
        @RequestParam(required = false) String dateMax
    ) {
        ModelAndView mv = new ModelAndView("produits/clients");
        try {
            List<Produit> produits = this.produitService.getAll();
            List<Client> clients = this.venteProduitService.getClientsEnDate(idProduit, dateMin, dateMax);

            mv.addObject("produits", produits);
            mv.addObject("clients", clients);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }


    @GetMapping("/commissions")
    public ModelAndView getVentesAvecCommission(
        @RequestParam(required = false) String dateMin,
        @RequestParam(required = false) String dateMax
    ) {
        ModelAndView mv = new ModelAndView("produits/commissions");
        try {
            // Conversion des chaînes de caractères en LocalDate
            LocalDate min = (dateMin != null && !dateMin.isEmpty()) ? LocalDate.parse(dateMin) : null;
            LocalDate max = (dateMax != null && !dateMax.isEmpty()) ? LocalDate.parse(dateMax) : null;
            
            // Récupération des commissions depuis le repository
            List<Map<String, Object>> commissions = this.commissionRepo.getVentesAvecCommission(min, max);
            mv.addObject("commissions", commissions);
        } catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }


    @GetMapping("/commissions/genres")
    public ModelAndView getCommissionsParGenre(
        @RequestParam(required = false) String dateMin,
        @RequestParam(required = false) String dateMax
    ) {
        ModelAndView mv = new ModelAndView("produits/commission-genre");
        try {
            // Conversion des chaînes de caractères en LocalDate
            LocalDate min = (dateMin != null && !dateMin.isEmpty()) ? LocalDate.parse(dateMin) : null;
            LocalDate max = (dateMax != null && !dateMax.isEmpty()) ? LocalDate.parse(dateMax) : null;
            
            // Récupération des commissions depuis le repository
            List<Map<String, Object>> commissions = this.commissionRepo.getCommissionsParGenre(min, max);
            mv.addObject("commissions", commissions);
        } catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }


    @GetMapping("/historiques/prix")
    public ModelAndView getHistoriquePrixProduits(
        @RequestParam(required = false) Long idProduit,
        @RequestParam(required = false) String dateMin,
        @RequestParam(required = false) String dateMax
    ) {
        ModelAndView mv = new ModelAndView("produits/histo-prix");
        try {
            List<Produit> produits = this.produitService.getAll();
            List<PrixProduit> prixProduits = this.prixProduitService.getHistoriquePrixProduits(dateMin, dateMax, idProduit);

            mv.addObject("produits", produits);
            mv.addObject("prix", prixProduits);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }
        return mv;
    }
}
