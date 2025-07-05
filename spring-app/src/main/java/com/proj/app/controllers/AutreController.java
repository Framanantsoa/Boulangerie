package com.proj.app.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AutreController 
{
    @GetMapping("/")
    public ModelAndView index() {
        ModelAndView model = new ModelAndView("accueil");
        model.addObject("message", "Bienvenue sur la page d'accueil !");
        return model;
    }

    @GetMapping("/erreurs")
    public ModelAndView afficherErreur() {
        ModelAndView modelView = new ModelAndView("erreur");
        modelView.addObject("status", 500);

        // Test avec un message simple
        modelView.addObject("message", "Une erreur s'est produite !");
        return modelView;
    }
}
