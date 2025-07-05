package com.proj.app.controllers;

import java.time.LocalDate;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import com.proj.app.entities.*;
import com.proj.app.repositories.TypeIngredientRepository;
import com.proj.app.repositories.UniteMesureRepository;
import com.proj.app.services.AchatIngredientService;
import com.proj.app.services.IngredientService;
import com.proj.app.services.PrixIngredientService;

@Controller
@RequestMapping("/ingredients")
public class IngredientController 
{   
    @Autowired
    private IngredientService ingredientService;

    @Autowired
    private TypeIngredientRepository typeIngredientRepo;

    @Autowired
    private UniteMesureRepository uniteRepo;

    @Autowired
    private PrixIngredientService prixIngredService;

    @Autowired
    private AchatIngredientService achatIngredService;


// CRUD
    @GetMapping("/liste")
    public ModelAndView listOfIngredients(
        @RequestParam(defaultValue = "1") int page,
        @RequestParam(defaultValue = "7") int size
    ) {
        ModelAndView mv = new ModelAndView("ingredients/liste");
        try {
            Pageable pageable = PageRequest.of(page-1, size);
            Page<Ingredient> ingredientsPage = this.ingredientService.getAllIngredients(pageable);

            mv.addObject("ingredients", ingredientsPage.getContent());
            mv.addObject("currentPage", page);
            mv.addObject("totalPages", ingredientsPage.getTotalPages());
            mv.addObject("totalItems", ingredientsPage.getTotalElements());
            mv.addObject("size", size);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @GetMapping("/nouveau")
    public ModelAndView nouveauIngredient() {
        ModelAndView modelView = new ModelAndView("ingredients/nouveau");
        try {
            modelView.addObject("typesIngredients", this.typeIngredientRepo.findAll());
            modelView.addObject("unites", this.uniteRepo.findAll());
        } 
        catch (Exception e) {
            modelView.setViewName("erreur");
            modelView.addObject("status", 500);
            modelView.addObject("message", "Impossible de récupérer les ingrédients: "+e.getMessage());
        }

        return modelView;
    }

    @PostMapping("/nouveau")
    public String ajouterIngredient(@ModelAttribute Ingredient ingredient,
     @RequestParam("prix") double prix,
     BindingResult bindingResult, Model model) {

    // Vérification des erreurs de validation
        if (bindingResult.hasErrors()) {
            List<UniteMesure> unites = this.uniteRepo.findAll();
            model.addAttribute("unites", unites);
            return "/ingredients/nouveau"; // Recharger le formulaire avec les erreurs
        }

    // Sauvegarder l'ingrédient
        ingredientService.ajouterIngredient(ingredient);

        PrixIngredient prixIngredient = new PrixIngredient();
        prixIngredient.setIngredient(ingredient);
        prixIngredient.setPrix(prix);
        prixIngredient.setDateModif(LocalDate.now());

        prixIngredService.ajouterPrixIngredient(prixIngredient);
    // Redirection vers la liste des ingrédients après ajout
        return "redirect:/ingredients/liste";
    }

    @GetMapping("/modifier/{id}")
    public ModelAndView modificationIngredient(@PathVariable Long id) {
        ModelAndView modelView = new ModelAndView("ingredients/modification");
        try {
            Ingredient ingredient = this.ingredientService.getIngredientById(id);
            PrixIngredient prixIngredient = this.prixIngredService.getDernierPrixIngredient(id);
            List<TypeIngredient> typeIngredients = this.typeIngredientRepo.findAll();
            
            modelView.addObject("unites", uniteRepo.findAll());
            modelView.addObject("ingredient", ingredient);
            modelView.addObject("prix", prixIngredient.getPrix());
            modelView.addObject("types", typeIngredients);
        } 
        catch (Exception e) {
            modelView.setViewName("erreur");
            modelView.addObject("status", 500);
            modelView.addObject("message", e.getMessage());
        }
        return modelView;
    }

    @PostMapping("/modifier/{id}")
    public String modifierIngredient(@PathVariable Long id, @ModelAttribute Ingredient ingredient,
     @RequestParam("prix") double nouveauPrix) {
        try {
            this.ingredientService.updateIngredient(id, ingredient, nouveauPrix);
        } 
        catch (Exception e) {
            return "redirect:/ingredients/modifier/{id}";
        }
        
        return "redirect:/ingredients/liste"; // Redirige vers la liste des ingrédients après modification
    }
    

// Achat
    @GetMapping("/achats")
    public ModelAndView achatIngredient() {
        ModelAndView mv = new ModelAndView("ingredients/achat");
        try {
            List<PrixIngredient> ingredients = this.prixIngredService.getDerniersPrixIngredients();
            
            mv.addObject("prixIngredients", ingredients);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    } 

    @PostMapping("/acheter")
    public ModelAndView enregistrerAchat(@ModelAttribute AchatIngredient achatIngredient) {
        ModelAndView mv = new ModelAndView();
        try {
            this.achatIngredService.acheterIngredient(achatIngredient);
            mv.setViewName("redirect:/ingredients/liste/achats");
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }

    @GetMapping("/liste/achats")
    public ModelAndView listeAchat(
        @RequestParam(required = false) Long idIngred
    ) {
        ModelAndView mv = new ModelAndView();
        try {
            mv.setViewName("ingredients/liste-achat");
            List<AchatIngredient> achats;
            if (idIngred != null) {
                achats = this.achatIngredService.getAchatsIngredientsAvecFiltre(idIngred);
            } 
            else {
                achats = this.achatIngredService.getAllAchats();
            }

            List<Ingredient> ingredients = this.ingredientService.getAllIngredients();

            mv.addObject("ingredients", ingredients);
            mv.addObject("achats", achats);
        } 
        catch (Exception e) {
            mv.setViewName("erreur");
            mv.addObject("status", 500);
            mv.addObject("message", e.getMessage());
        }

        return mv;
    }
}
