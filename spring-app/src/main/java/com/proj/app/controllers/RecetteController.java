package com.proj.app.controllers;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.proj.app.entities.*;
import com.proj.app.repositories.DetailRecetteRepository;
import com.proj.app.services.IngredientService;
import com.proj.app.services.ProduitService;
import com.proj.app.services.RecetteService;

@Controller
@RequestMapping("/recettes")
public class RecetteController 
{
    @Autowired
    private RecetteService recetteService;

    @Autowired
    private IngredientService ingredientService;

    @Autowired
    private DetailRecetteRepository detailRecetteRepo;

    @Autowired
    private ProduitService produitService;


    @GetMapping("/liste")
    public ModelAndView listeRecettes() {
        ModelAndView mv = new ModelAndView("recettes/liste");
        try {
            List<Recette> recettes = this.recetteService.getAll();
            mv.addObject("recettes", recettes);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne : " + e.getMessage());
        }
        return mv;
    }


    @GetMapping("/{id}/details")
    public ModelAndView afficherDetailsRecette(@PathVariable Long id) {
        ModelAndView mv = new ModelAndView("recettes/detail");
        try {
            Recette recette = recetteService.getRecetteById(id);
            List<DetailRecette> details = recette.getDetailsRecettes();
            mv.addObject("details", details);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne : " + e.getMessage());
        }
        
        return mv;
    }


    @GetMapping("/details/nouv")
    public ModelAndView nouveauDetailRecette() {
        ModelAndView mv = new ModelAndView("recettes/nouv-detail");
        try {
            List<Recette> recettes = this.recetteService.getAll();
            List<Ingredient> ingredients = this.ingredientService.getAllIngredients();
            mv.addObject("recettes", recettes);
            mv.addObject("ingredients", ingredients);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne : " + e.getMessage());
        }

        return mv;
    }

    @PostMapping("/details/nouv")
    public String ajouterNouveauDetailRecette(@ModelAttribute DetailRecette detail) {
        try {
            this.detailRecetteRepo.save(detail);
            return "redirect:/recettes/liste";
        } 
        catch (Exception e) {
            return "redirect:/erreur";
        }
    }

    @GetMapping("/nouvelle")
    public ModelAndView nouvelleRecette() {
        ModelAndView mv = new ModelAndView("recettes/nouveau");
        try {
            List<Produit> produits = this.produitService.getAll();
            mv.addObject("produits", produits);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne : " + e.getMessage());
        }

        return mv;
    }

    @PostMapping("/nouvelle")
    public String ajouterNouvelleRecette(@ModelAttribute Recette recette) {
        try {
            this.recetteService.ajouterRecette(recette);
            return "redirect:/recettes/liste";
        } 
        catch (Exception e) {
            return "redirect:/erreur";
        }
    }
}
