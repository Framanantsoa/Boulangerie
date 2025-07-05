package com.proj.app.controllers;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.proj.app.entities.*;
import com.proj.app.services.IngredientService;
import com.proj.app.services.ProductionService;
import com.proj.app.services.ProduitService;
import com.proj.app.services.RecetteService;

@Controller
@RequestMapping("/productions")
public class ProductionController 
{
    @Autowired
    private ProductionService productionService;

    @Autowired
    private IngredientService ingredientService;

    @Autowired
    private ProduitService produitService;

    @Autowired
    private RecetteService recetteService;


    @GetMapping("/liste")
    public ModelAndView listeProduction(
        @RequestParam(required = false) Long idIngredient,
        @RequestParam(required = false) Long idProduit
    ) {
        ModelAndView mv = new ModelAndView("productions/liste");
        try {
            List<Produit> produits = this.produitService.getAll();
            List<Ingredient> ingredients = this.ingredientService.getAllIngredients();
            List<Production> productions = this.productionService.getAllAvecFiltre(idIngredient, idProduit);

            mv.addObject("ingredients", ingredients);
            mv.addObject("produits", produits);
            mv.addObject("productions", productions);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne: " + e.getMessage());
        }
        return mv;
    }

    @GetMapping("/nouvelle")
    public ModelAndView nouvelleProduction() {
        ModelAndView mv = new ModelAndView("productions/nouveau");
        try {
            List<Recette> recettes = this.recetteService.getAll();
            mv.addObject("recettes", recettes);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", "Erreur interne: " + e.getMessage());
        }

        return mv;
    }

    @PostMapping("/nouvelle")
    public ModelAndView ajouterNouvelleProduction(@ModelAttribute Production production) {
        ModelAndView mv = new ModelAndView("redirect:/productions/liste");
        try {
            this.productionService.ajouterNouvelleProduction(production);
        } 
        catch (RuntimeException e) {
            mv.setViewName("erreur");
            mv.addObject("status", 400);

            String[] errors = e.getMessage().split("-");
            List<String> errList = new ArrayList<String>();
            for(int i=0; i<errors.length; i++) {
                if(!errors[i].isBlank()) {
                    errList.add(errors[i]);
                }
            }
            errors = errList.toArray(new String[0]);
            mv.addObject("message", errors);
        }

        return mv;
    }

}
